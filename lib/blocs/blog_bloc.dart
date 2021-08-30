import 'dart:convert';

import 'package:flutter_dev_to/models/article_model.dart';
import 'package:flutter_dev_to/models/full_article_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

enum ArticleType { FEATURED, NEW }

class BlogBloc {
  int nextPage = 1;
  Map<ArticleType, List<Article>> _cachedArticles = {};
  Map<ArticleType, int> _cachedNextPage = {};
  Map<int, FullArticle> _cachedFullArticles = {};

  BehaviorSubject<ArticleType> _subjectArticleType =
      BehaviorSubject.seeded(ArticleType.FEATURED);
  BehaviorSubject<List<Article>> _subjectArticles = BehaviorSubject();
  BehaviorSubject<bool> _subjectIsLoadingArticles =
      BehaviorSubject.seeded(false);
  BehaviorSubject<FullArticle> _subjectFullArticle = BehaviorSubject();
  BehaviorSubject<bool> _subjectIsLoadingFullArticle =
      BehaviorSubject.seeded(false);

  Stream<ArticleType> get articleType => _subjectArticleType.stream;
  ValueStream<List<Article>> get articles => _subjectArticles.stream;
  ValueStream<bool> get loading => _subjectIsLoadingArticles.stream;
  ValueStream<FullArticle> get fullArticle => _subjectFullArticle.stream;
  ValueStream<bool> get isLoadingFullArticle =>
      _subjectIsLoadingFullArticle.stream;

  BlogBloc() {
    getAndUpdateAricles();
  }

  void changeType(ArticleType type) {
    _subjectArticleType.sink.add(type);
    if (_cachedNextPage.containsKey(type)) {
      nextPage = _cachedNextPage[type] as int;
    } else {
      nextPage = 1;
    }
    _subjectArticles.sink.add([]);
    getAndUpdateAricles(loadCached: true);
  }

  /// Adds the articles of the current page to the articles stream
  Future<void> getAndUpdateAricles({bool loadCached = false}) async {
    // Load cached if existent
    if (loadCached && _cachedArticles.containsKey(_subjectArticleType.value)) {
      _subjectArticles.sink
          .add(_cachedArticles[_subjectArticleType.value] as List<Article>);
      return;
    }
    _subjectIsLoadingArticles.sink.add(true);

    final articles = await _getArticles(nextPage, _subjectArticleType.value);
    if (!_subjectArticles.hasValue) {
      _subjectArticles.sink.add(articles);
    } else {
      _subjectArticles.sink.add([..._subjectArticles.value, ...articles]);
    }

    _subjectIsLoadingArticles.sink.add(false);
    nextPage++;

    _cachedArticles[_subjectArticleType.value] = _subjectArticles.value;
    _cachedNextPage[_subjectArticleType.value] = nextPage;
  }

  /// Takes the id of the article and updates the fullArticle stream
  Future<void> getAndUpdateFullArticle(int id) async {
    if (_cachedFullArticles.containsKey(id)) {
      _subjectFullArticle.sink.add(_cachedFullArticles[id] as FullArticle);
      return;
    }
    _subjectIsLoadingFullArticle.sink.add(true);

    final fullArticle = await _getFullArticle(id);
    _subjectFullArticle.sink.add(fullArticle);

    _subjectIsLoadingFullArticle.sink.add(false);

    _cachedFullArticles[id] = fullArticle;
  }

  /// Takes the id of the article and returns the full article
  Future<FullArticle> _getFullArticle(int id) async {
    http.Response response =
        await http.get(Uri.parse('https://dev.to/api/articles/$id'));
    if (response.statusCode == 404) {
      throw Error();
    }
    return FullArticle.fromJson(jsonDecode(response.body));
  }

  /// Returns the articles of the given page
  Future<List<Article>> _getArticles(int page, ArticleType type) async {
    String baseUrl = 'https://www.dev.to/api/articles';
    if (type == ArticleType.NEW) {
      baseUrl += '/latest';
    }
    http.Response response =
        await http.get(Uri.parse('$baseUrl?page=$page&per_page=20'));
    if (response.statusCode != 200) {
      throw Error();
    }

    final List<dynamic> articles = jsonDecode(response.body);
    return articles.map((e) => Article.fromJson(e)).toList();
  }

  /// Closes the streams
  void dispose() {
    _subjectArticleType.close();
    _subjectArticles.close();
    _subjectIsLoadingArticles.close();
    _subjectFullArticle.close();
    _subjectIsLoadingFullArticle.close();
  }
}

final blogBloc = BlogBloc();
