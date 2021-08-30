import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_to/blocs/blog_bloc.dart';
import 'package:flutter_dev_to/models/article_model.dart';
import 'package:flutter_dev_to/screens/article_details_screen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  ScrollController _scrollController = ScrollController();
  int _currentActiveTabIndex = 0;

  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      if (blogBloc.loading.value) return;
      blogBloc.getAndUpdateAricles();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = blogBloc;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dev forums'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentActiveTabIndex,
        onTap: (int index) {
          if (index == _currentActiveTabIndex) return;
          final List<ArticleType> tabIndexType = [
            ArticleType.FEATURED,
            ArticleType.NEW
          ];
          blogBloc.changeType(tabIndexType[index]);
          setState(() {
            _currentActiveTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Featured',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'Latest',
          )
        ],
      ),
      body: StreamBuilder<List<Article>>(
        stream: bloc.articles,
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return ListView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              children: [
                ...snapshot.data!
                    .map((e) => _buildArticle(context, e))
                    .toList(),
                StreamBuilder<bool>(
                    stream: blogBloc.loading,
                    builder: (context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.data == true) {
                        return Container(
                          padding: EdgeInsets.all(30.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      return Container();
                    })
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildArticle(BuildContext context, Article article) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Card(
        child: InkWell(
          onTap: () async {
            Navigator.of(context).push(
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) =>
                    ArticleDetailsScreen(article: article),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'image-${article.id}',
                child: Image.network(article.socialImage),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'user-${article.id}',
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(article.user.profileImage90),
                          ),
                          title: Text(article.user.name),
                          subtitle: Text(article.createdAt),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Hero(
                      tag: 'title-${article.id}',
                      child: Text(
                        article.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text('${article.publicReactionsCount} reactions'),
                        SizedBox(
                          width: 18.0,
                        ),
                        Icon(Icons.comment_outlined),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text('${article.commentsCount} comments'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
