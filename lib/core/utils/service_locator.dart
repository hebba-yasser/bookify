import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
}
