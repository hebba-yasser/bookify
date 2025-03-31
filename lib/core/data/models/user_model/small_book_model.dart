import 'package:cloud_firestore/cloud_firestore.dart';

class SmallBookModel {
  final List<String>? authors;
  final String? id;
  final String? title;
  final String? image;
  final DateTime? viewedAt;
  const SmallBookModel(
      {this.authors, this.id, this.title, this.image, this.viewedAt});

  factory SmallBookModel.fromJson(Map<String, dynamic> json) {
    return SmallBookModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      authors: (json['authors'] as List<dynamic>?)
          ?.map((author) => author.toString())
          .toList(),
      viewedAt: json['viewedAt'] is Timestamp
          ? (json['viewedAt'] as Timestamp).toDate()
          : json['viewedAt'] != null
              ? DateTime.parse(json['viewedAt'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authors': authors,
      'id': id,
      'title': title,
      'image': image,
      'addedAt': viewedAt?.toIso8601String(),
    };
  }
}
