import 'package:get_it/get_it.dart';

import '../../features/auth/Data/Repos/auth_repo_imp.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
}
