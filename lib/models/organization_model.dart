class Organization {
  late String name;
  late String username;
  late String slug;
  late String profileImage;
  late String profileImage90;

  Organization(
      {required this.name,
      required this.username,
      required this.slug,
      required this.profileImage,
      required this.profileImage90});

  Organization.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    slug = json['slug'];
    profileImage = json['profile_image'];
    profileImage90 = json['profile_image_90'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['slug'] = this.slug;
    data['profile_image'] = this.profileImage;
    data['profile_image_90'] = this.profileImage90;
    return data;
  }
}
