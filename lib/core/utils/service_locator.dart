import 'package:bookify/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/profile/data/repos/profile_repos_imp.dart';
import '../../features/search/data/repos/search_repo_imp.dart';
import '../data/repos/shared_repo_imp.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiService>()));
  getIt
      .registerSingleton<SharedRepoImp>(SharedRepoImp(getIt.get<ApiService>()));
  getIt
      .registerSingleton<SearchRepoImp>(SearchRepoImp(getIt.get<ApiService>()));

  getIt.registerSingleton<ProfileReposImp>(ProfileReposImp(
    getIt.get<AuthRepoImp>(),
  ));
}
