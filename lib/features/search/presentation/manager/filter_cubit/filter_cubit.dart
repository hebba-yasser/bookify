import 'package:bloc/bloc.dart';

import '../../../../../core/data/data_sources/preferences_data_source.dart';
import 'filter_states.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(ChipsInitial());

  String? selectedOrderBy;
  String? selectedBookType;
  String? selectedLanguage;

  void selectOrderBy(String orderBy) {
    selectedOrderBy = (selectedOrderBy == orderBy) ? null : orderBy;
    emit(FilterUpdated());
  }

  void selectBookType(String bookType) {
    selectedBookType = (selectedBookType == bookType) ? null : bookType;
    emit(FilterUpdated());
  }

  String? selectedLanguageCode; // New field for API requests

  void selectLanguage(String language) {
    selectedLanguage = language; // Keep name for UI

    // Get language code from supportedLanguages
    final languageEntry = PreferencesDataSource.supportedLanguages.firstWhere(
      (lang) => lang["name"] == language,
      orElse: () => {"code": ''},
    );

    selectedLanguageCode = languageEntry["code"];
    print(selectedLanguageCode);
    emit(FilterUpdated());
  }

  void clearAllFilters() {
    selectedOrderBy = null;
    selectedBookType = null;
    selectedLanguage = null;
    selectedLanguageCode = null;
    emit(FiltersCleared());
  }
}
