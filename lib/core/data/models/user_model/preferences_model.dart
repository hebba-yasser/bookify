class PreferencesModel {
  final List<String> genres;
  final List<String> languagesCode;
  final List<String> favoriteAuthors;

  PreferencesModel({
    required this.genres,
    required this.languagesCode,
    required this.favoriteAuthors,
  });

   Map<String, dynamic> toJson() {
    return {
      'selectedGenres': genres,
      'selectedLanguages': languagesCode,
      'favoriteAuthors': favoriteAuthors,
    };
  }

  factory PreferencesModel.fromJson(Map<String, dynamic> json) {
    return PreferencesModel(
      genres: List<String>.from(json['genres'] ?? []),
      languagesCode: List<String>.from(json['languagesCode'] ?? []),
      favoriteAuthors: List<String>.from(json['favoriteAuthors'] ?? []),
    );
  }
}
