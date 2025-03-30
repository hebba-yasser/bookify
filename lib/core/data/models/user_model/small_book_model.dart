class SmallBookModel {
  final List<String>? authors;
  final int? id;
  final String? title;
  final String? image;

  const SmallBookModel({
    this.authors,
    this.id,
    this.title,
    this.image,
  });

  factory SmallBookModel.fromJson(Map<String, dynamic> json) {
    return SmallBookModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      authors: (json['authors'] as List<dynamic>?)
          ?.map((author) => author.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authors': authors,
      'id': id,
      'title': title,
      'image': image,
    };
  }
}
