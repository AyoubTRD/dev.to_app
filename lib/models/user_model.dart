class User {
  late String name;
  late String username;
  String? twitterUsername;
  String? githubUsername;
  String? websiteUrl;
  late String profileImage;
  late String profileImage90;

  User(
      {required this.name,
      required this.username,
      this.twitterUsername,
      this.githubUsername,
      this.websiteUrl,
      required this.profileImage,
      required this.profileImage90});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    twitterUsername = json['twitter_username'];
    githubUsername = json['github_username'];
    websiteUrl = json['website_url'];
    profileImage = json['profile_image'];
    profileImage90 = json['profile_image_90'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['twitter_username'] = this.twitterUsername;
    data['github_username'] = this.githubUsername;
    data['website_url'] = this.websiteUrl;
    data['profile_image'] = this.profileImage;
    data['profile_image_90'] = this.profileImage90;
    return data;
  }
}
