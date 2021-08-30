import 'package:flutter_dev_to/models/organization_model.dart';
import 'package:flutter_dev_to/models/user_model.dart';

class FullArticle {
  late String typeOf;
  late int id;
  late String title;
  late String description;
  String? coverImage;
  String? readablePublishDate;
  late String socialImage;
  late String tagList;
  late List<String> tags;
  late String slug;
  late String path;
  late String url;
  late String canonicalUrl;
  late int commentsCount;
  late int positiveReactionsCount;
  late int publicReactionsCount;
  int? collectionId;
  late String createdAt;
  String? editedAt;
  String? crosspostedAt;
  late String publishedAt;
  String? lastCommentAt;
  late String publishedTimestamp;
  late int readingTimeMinutes;
  late String bodyHtml;
  late String bodyMarkdown;
  late User user;
  Organization? organization;

  FullArticle(
      {required this.typeOf,
      required this.id,
      required this.title,
      required this.description,
      this.coverImage,
      this.readablePublishDate,
      required this.socialImage,
      required this.tagList,
      required this.tags,
      required this.slug,
      required this.path,
      required this.url,
      required this.canonicalUrl,
      required this.commentsCount,
      required this.positiveReactionsCount,
      required this.publicReactionsCount,
      this.collectionId,
      required this.createdAt,
      this.editedAt,
      this.crosspostedAt,
      required this.publishedAt,
      this.lastCommentAt,
      required this.publishedTimestamp,
      required this.readingTimeMinutes,
      required this.bodyHtml,
      required this.bodyMarkdown,
      required this.user,
      this.organization});

  FullArticle.fromJson(Map<String, dynamic> json) {
    typeOf = json['type_of'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    coverImage = json['cover_image'];
    readablePublishDate = json['readable_publish_date'];
    socialImage = json['social_image'];
    tagList = json['tag_list'];
    tags = json['tags'].cast<String>();
    slug = json['slug'];
    path = json['path'];
    url = json['url'];
    canonicalUrl = json['canonical_url'];
    commentsCount = json['comments_count'];
    positiveReactionsCount = json['positive_reactions_count'];
    publicReactionsCount = json['public_reactions_count'];
    collectionId = json['collection_id'];
    createdAt = json['created_at'];
    editedAt = json['edited_at'];
    crosspostedAt = json['crossposted_at'];
    publishedAt = json['published_at'];
    lastCommentAt = json['last_comment_at'];
    publishedTimestamp = json['published_timestamp'];
    readingTimeMinutes = json['reading_time_minutes'];
    bodyHtml = json['body_html'];
    bodyMarkdown = json['body_markdown'];
    user = new User.fromJson(json['user']);
    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_of'] = this.typeOf;
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['cover_image'] = this.coverImage;
    data['readable_publish_date'] = this.readablePublishDate;
    data['social_image'] = this.socialImage;
    data['tag_list'] = this.tagList;
    data['tags'] = this.tags;
    data['slug'] = this.slug;
    data['path'] = this.path;
    data['url'] = this.url;
    data['canonical_url'] = this.canonicalUrl;
    data['comments_count'] = this.commentsCount;
    data['positive_reactions_count'] = this.positiveReactionsCount;
    data['public_reactions_count'] = this.publicReactionsCount;
    data['collection_id'] = this.collectionId;
    data['created_at'] = this.createdAt;
    data['edited_at'] = this.editedAt;
    data['crossposted_at'] = this.crosspostedAt;
    data['published_at'] = this.publishedAt;
    data['last_comment_at'] = this.lastCommentAt;
    data['published_timestamp'] = this.publishedTimestamp;
    data['reading_time_minutes'] = this.readingTimeMinutes;
    data['body_html'] = this.bodyHtml;
    data['body_markdown'] = this.bodyMarkdown;
    data['user'] = this.user.toJson();
    data['organization'] = this.organization?.toJson();
    return data;
  }
}
