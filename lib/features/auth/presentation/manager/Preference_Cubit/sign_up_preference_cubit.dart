import 'package:bloc/bloc.dart';
import 'package:bookify/core/data/models/user_model/preferences_model.dart';
import 'package:bookify/features/auth/presentation/manager/Preference_Cubit/sign_up_preference%20_state.dart';

import '../../../../../core/data/models/user_model/user_model.dart';
import '../../../data/repos/auth_repo.dart';

class SignUpPreferenceCubit extends Cubit<SignUpPreferenceState> {
  final AuthRepo authRepo;

  SignUpPreferenceCubit(this.authRepo) : super(SignUpPreferenceInitial());
  List<String> genres = [];
  List<String> languagesCode = [];
  List<String> favoriteAuthors = [];

  void updatePreference(List<String> preferenceList, String label) {
    if (preferenceList.contains(label)) {
      preferenceList.remove(label);
    } else {
      preferenceList.add(label);
    }
    emit(SignUpPreferenceSelected());
  }

  void removeFavAuthor(String label) {
    if (favoriteAuthors.contains(label)) {
      favoriteAuthors.remove(label);
      emit(SignUpFavAuthorRemoved());
    }
  }

  void selectFavAuthor(String label) {
    if (favoriteAuthors.contains(label)) {
      favoriteAuthors.remove(label); // Unselect chip
    } else {
      favoriteAuthors.add(label); // Select chip
    }
    emit(SignUpFavAuthorSelected());
  }

  Future<void> updateUserPreferences() async {
    emit(SignUpSavePreferencesLoading());
    final PreferencesModel preferences = PreferencesModel(
        genres: genres,
        languagesCode: languagesCode,
        favoriteAuthors: favoriteAuthors);
    UserModel updatedUser = UserModel(
      preferences: preferences,
    );
    var result = await authRepo.updateUserPreferences(user: updatedUser);
    result.fold((failure) {
      emit(SignUpSavePreferencesError(failure.errMessage));
    }, (newUser) async {
      emit(SignUpSavePreferencesSuccess());
    });
  }
}
