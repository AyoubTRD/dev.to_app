import 'dart:convert';

import 'package:flutter_dev_to/models/full_article_model.dart';

const kApiKey = 'ZvVoujoo5L8faMCaTEHRX62Y';

const kArticles = """[
{
"type_of": "article",
"id": 721780,
"title": "React 18 Alpha is out! Now what?",
"description": "Hello!  They kept us in Suspense long enough, but HECK React developers have some new features to...",
"readable_publish_date": "Jun 8",
"slug": "react-18-alpha-is-out-now-what-2apj",
"path": "/cassidoo/react-18-alpha-is-out-now-what-2apj",
"url": "https://dev.to/cassidoo/react-18-alpha-is-out-now-what-2apj",
"comments_count": 25,
"public_reactions_count": 458,
"collection_id": null,
"published_timestamp": "2021-06-08T18:05:22Z",
"positive_reactions_count": 458,
"cover_image": "https://res.cloudinary.com/practicaldev/image/fetch/s--U4Dl1yeC--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://images.unsplash.com/photo-1492412931596-e47811cc802f%3Fixid%3DMnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8%26ixlib%3Drb-1.2.1%26auto%3Dformat%26fit%3Dcrop%26w%3D1650%26q%3D80",
"social_image": "https://res.cloudinary.com/practicaldev/image/fetch/s---CQdjWFb--/c_imagga_scale,f_auto,fl_progressive,h_500,q_auto,w_1000/https://images.unsplash.com/photo-1492412931596-e47811cc802f%3Fixid%3DMnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8%26ixlib%3Drb-1.2.1%26auto%3Dformat%26fit%3Dcrop%26w%3D1650%26q%3D80",
"canonical_url": "https://www.netlify.com/blog/2021/06/08/react-18-alpha-is-out-now-what/",
"created_at": "2021-06-08T18:03:02Z",
"edited_at": "2021-06-28T23:47:16Z",
"crossposted_at": "2021-06-08T18:05:22Z",
"published_at": "2021-06-08T00:00:00Z",
"last_comment_at": "2021-08-04T10:14:45Z",
"reading_time_minutes": 3,
"tag_list": [
"react"
],
"tags": "react",
"user": {
"name": "Cassidy Williams",
"username": "cassidoo",
"twitter_username": "cassidoo",
"github_username": "cassidoo",
"website_url": "http://cassidoo.co",
"profile_image": "https://res.cloudinary.com/practicaldev/image/fetch/s--X6yB_pWq--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/6401/db5b0ab6-93a1-4168-9f97-af8d363c1153.png",
"profile_image_90": "https://res.cloudinary.com/practicaldev/image/fetch/s--P4HnHvGk--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/6401/db5b0ab6-93a1-4168-9f97-af8d363c1153.png"
}
},
{
"type_of": "article",
"id": 710585,
"title": "What was your win this week?",
"description": "Got to all your meetings on time? Started a new project? Fixed a tricky bug?",
"readable_publish_date": "May 28",
"slug": "what-was-your-win-this-week-2ei4",
"path": "/devteam/what-was-your-win-this-week-2ei4",
"url": "https://dev.to/devteam/what-was-your-win-this-week-2ei4",
"comments_count": 71,
"public_reactions_count": 38,
"collection_id": null,
"published_timestamp": "2021-05-28T17:49:47Z",
"positive_reactions_count": 38,
"cover_image": "https://res.cloudinary.com/practicaldev/image/fetch/s--pyDLAPme--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://cl.ly/188e843c2985/download/Image%25202019-02-15%2520at%25202.36.37%2520PM.png",
"social_image": "https://res.cloudinary.com/practicaldev/image/fetch/s--82JthPbs--/c_imagga_scale,f_auto,fl_progressive,h_500,q_auto,w_1000/https://cl.ly/188e843c2985/download/Image%25202019-02-15%2520at%25202.36.37%2520PM.png",
"canonical_url": "https://dev.to/devteam/what-was-your-win-this-week-2ei4",
"created_at": "2021-05-27T20:39:59Z",
"edited_at": null,
"crossposted_at": null,
"published_at": "2021-05-28T17:49:47Z",
"last_comment_at": "2021-08-02T15:55:13Z",
"reading_time_minutes": 1,
"tag_list": [
"discuss",
"weeklyretro"
],
"tags": "discuss, weeklyretro",
"user": {
"name": "Gracie Gregory (she/her)",
"username": "graciegregory",
"twitter_username": "GracieGregory16",
"github_username": "SGGregory",
"website_url": null,
"profile_image": "https://res.cloudinary.com/practicaldev/image/fetch/s---MR9BSbR--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/342975/98b7a8ed-aa91-48a3-bcc0-ebe2c13b5893.png",
"profile_image_90": "https://res.cloudinary.com/practicaldev/image/fetch/s--YTDghB6M--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/342975/98b7a8ed-aa91-48a3-bcc0-ebe2c13b5893.png"
},
"organization": {
"name": "The DEV Team",
"username": "devteam",
"slug": "devteam",
"profile_image": "https://res.cloudinary.com/practicaldev/image/fetch/s--CAGmUhNa--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png",
"profile_image_90": "https://res.cloudinary.com/practicaldev/image/fetch/s--mbsgKaXh--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png"
},
"flare_tag": {
"name": "discuss",
"bg_color_hex": "#000000",
"text_color_hex": "#FFFFFF"
}
},
{
"type_of": "article",
"id": 720932,
"title": "How to auto-document the database schema of your Rails app",
"description": "I’m wrapping up my RailsConf 2021 presentation recap today. Check out Part 1, Part 2  and Part 3 in c...",
"readable_publish_date": "Jun 8",
"slug": "how-to-auto-document-the-database-schema-of-your-rails-app-50b",
"path": "/appland/how-to-auto-document-the-database-schema-of-your-rails-app-50b",
"url": "https://dev.to/appland/how-to-auto-document-the-database-schema-of-your-rails-app-50b",
"comments_count": 1,
"public_reactions_count": 78,
"collection_id": 12899,
"published_timestamp": "2021-06-08T11:46:33Z",
"positive_reactions_count": 78,
"cover_image": null,
"social_image": "https://res.cloudinary.com/practicaldev/image/fetch/s--FwXhMN6c--/c_imagga_scale,f_auto,fl_progressive,h_500,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/i0idvb4tawhdkoc0e998.png",
"canonical_url": "https://dev.to/appland/how-to-auto-document-the-database-schema-of-your-rails-app-50b",
"created_at": "2021-06-07T19:48:25Z",
"edited_at": "2021-06-08T13:29:45Z",
"crossposted_at": null,
"published_at": "2021-06-08T11:46:33Z",
"last_comment_at": "2021-06-10T21:30:05Z",
"reading_time_minutes": 2,
"tag_list": [
"rails",
"database",
"techtalks"
],
"tags": "rails, database, techtalks",
"user": {
"name": "Kevin Gilpin",
"username": "kgilpin",
"twitter_username": "kegilpin",
"github_username": "kgilpin",
"website_url": "https://appland.com",
"profile_image": "https://res.cloudinary.com/practicaldev/image/fetch/s--IRMQRbkN--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/555587/2be89914-0dee-4f3f-a4f0-2102df256d7d.jpeg",
"profile_image_90": "https://res.cloudinary.com/practicaldev/image/fetch/s--3sMQUeQo--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/555587/2be89914-0dee-4f3f-a4f0-2102df256d7d.jpeg"
},
"organization": {
"name": "AppLand",
"username": "appland",
"slug": "appland",
"profile_image": "https://res.cloudinary.com/practicaldev/image/fetch/s--W7Ixadu0--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/3566/db90af67-aa32-4983-99fb-b98db0777b17.png",
"profile_image_90": "https://res.cloudinary.com/practicaldev/image/fetch/s--P7is9gP1--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/3566/db90af67-aa32-4983-99fb-b98db0777b17.png"
},
"flare_tag": {
"name": "techtalks",
"bg_color_hex": "#311a99",
"text_color_hex": "#ff6264"
}
}
]""";
