class AuthorModel {
  final String authorName;
  final String? authorImagePath;

  const AuthorModel({
    required this.authorName,
    this.authorImagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'authorName': authorName,
      'authorImagePath': authorImagePath,
    };
  }
}
