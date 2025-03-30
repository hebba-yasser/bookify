import 'package:bookify/core/data/models/user_model/preferences_model.dart';
import 'package:bookify/core/data/models/user_model/small_book_model.dart';

class UserModel {
  final String? uId;
  final String? name;
  final String? email;
  final String? phone;
  final String? imgUrl;
  final PreferencesModel? preferences;
  final List<String>? recentSearch;
  final List<SmallBookModel>? likedBooks;
  final Map<String, List<SmallBookModel>>? readingList;

  const UserModel({
    this.uId,
    this.name,
    this.email,
    this.phone,
    this.imgUrl,
    this.preferences,
    this.recentSearch,
    this.likedBooks,
    this.readingList,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uId: data['uId'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      imgUrl: data['imgUrl'] ?? '',
      preferences: data['preferences'] == null
          ? null
          : PreferencesModel.fromJson(data['preferences']),
      recentSearch: (data['recentSearch'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      likedBooks: (data['likedBooks'] as List<dynamic>?)
          ?.map((e) => SmallBookModel.fromJson(e))
          .toList(),
      readingList: {
        "Want to Read": (data['readingList']?["Want to Read"] as List<dynamic>?)
                ?.map((e) => SmallBookModel.fromJson(e))
                .toList() ??
            [],
        "Currently Reading":
            (data['readingList']?["Currently Reading"] as List<dynamic>?)
                    ?.map((e) => SmallBookModel.fromJson(e))
                    .toList() ??
                [],
        "Finished": (data['readingList']?["Finished"] as List<dynamic>?)
                ?.map((e) => SmallBookModel.fromJson(e))
                .toList() ??
            [],
      },
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'phone': phone,
      'imgUrl': imgUrl,
      'preferences': preferences?.toJson(),
      'recentSearch': recentSearch,
      'likedBooks': likedBooks?.map((e) => e.toJson()).toList(),
      'readingList': {
        "Want to Read":
            readingList?["Want to Read"]?.map((e) => e.toJson()).toList(),
        "Currently Reading":
            readingList?["Currently Reading"]?.map((e) => e.toJson()).toList(),
        "Finished": readingList?["Finished"]?.map((e) => e.toJson()).toList(),
      },
    };
  }
}
