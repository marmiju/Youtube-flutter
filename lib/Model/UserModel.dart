class Usermodel {
  final String username;
  final String email;
  final String profilePic;
  final subscriptions;
  final videos;
  final String userId;
  final description;
  final type;

  Usermodel({
    required this.username,
    required this.email,
    required this.profilePic,
    this.subscriptions,
    this.videos,
    required this.userId,
    this.description,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'profilePic': profilePic,
      'subscriptions': subscriptions,
      'videos': videos,
      'userId': userId,
      'description': description,
      'type': type,
    };
  }

  // Factory constructor for creating a Usermodel instance from a Map (JSON)
  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      username: json['username'] as String,
      email: json['email'] as String,
      profilePic: json['profilePic'] as String,
      subscriptions: json['subscriptions'] as List,
      videos: json['videos'] as List,
      userId: json['userId'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
    );
  }
}
