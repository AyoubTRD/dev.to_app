import 'package:flutter/material.dart';
import 'package:flutter_dev_to/blocs/blog_bloc.dart';
import 'package:flutter_dev_to/models/article_model.dart';
import 'package:flutter_dev_to/models/full_article_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:intl/intl.dart' as intl;

class ArticleDetailsScreen extends StatefulWidget {
  ArticleDetailsScreen({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  void initState() {
    super.initState();
    blogBloc.getAndUpdateFullArticle(widget.article.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: Text('Back'),
        icon: Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Hero(
            tag: 'image-${widget.article.id}',
            child: Image.network(widget.article.socialImage),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'user-${widget.article.id}',
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: -4),
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(widget.article.user.profileImage90),
                      ),
                      title: Text(widget.article.user.name),
                      subtitle: Text(widget.article.createdAt),
                    ),
                  ),
                ),
                Hero(
                  tag: 'title-${widget.article.id}',
                  child: Text(
                    widget.article.title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(height: 25.0),
                StreamBuilder<bool>(
                  stream: blogBloc.isLoadingFullArticle,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.data == true) {
                      return Container(
                        margin: EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    return StreamBuilder<FullArticle>(
                      stream: blogBloc.fullArticle,
                      builder: (BuildContext context,
                          AsyncSnapshot<FullArticle> snapshot) {
                        if (!snapshot.hasData) return Container();
                        return Html(
                          style: {
                            '.highlight-action': Style(
                              display: Display.NONE,
                            ),
                            'pre': Style(
                              fontSize: FontSize.medium,
                              backgroundColor: Colors.grey[800],
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 10.0),
                            ),
                          },
                          data: snapshot.data!.bodyHtml,
                          onLinkTap: (String? url, a, b, c) {
                            if (url == null) return;
                            try {
                              launch(url);
                            } catch (e) {}
                          },
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 50.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
