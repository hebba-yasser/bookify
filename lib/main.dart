import 'package:bookify/features/home/data/repos/home_repo_imp.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants.dart';
import 'core/cubits/user_data_cubit/user_data_cubit.dart';
import 'core/data/repos/shared_repo_imp.dart';
import 'core/styles/colors.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/service_locator.dart';
import 'features/home/presentation/manager/fetch_new_arrival_book_cubit/fetch_new_arrival_book_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://riclxbqdxdapelppnelo.supabase.co',
    anonKey: dotenv.env['Supabase_Key']!,
  );
  Bloc.observer = AppCubitObserver();
  await CacheHelper.init();
  setupServiceLocator();
  uId = CacheHelper.getString(key: 'uid');
  isLogged = CacheHelper.getBoolean(key: 'islogged') ?? false;
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const Bookify(),
  ));
}

class Bookify extends StatelessWidget {
  const Bookify({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserDataCubit(
            getIt.get<SharedRepoImp>(),
          )..fetchUserData(id: uId ?? ''),
        ),
        BlocProvider(
          create: (context) =>
              FetchNewArrivalBookCubit(getIt.get<HomeRepoImp>())
                ..fetchNewArrivalBook(),
        ),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        color: kPrimaryColor,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(primary: kPrimaryColor),
          unselectedWidgetColor: AppColors.lightTeal.withOpacity(0.6),
          disabledColor: AppColors.lightGrey,
          indicatorColor: kPrimaryColor,
          hoverColor: AppColors.lightGrey,
          shadowColor: AppColors.lightGrey,
          focusColor: AppColors.lightGrey,
          splashColor: AppColors.lightGrey,
          dialogBackgroundColor: Colors.white,
          secondaryHeaderColor: AppColors.lightGrey,
          canvasColor: Colors.white,
          highlightColor: AppColors.lightGrey,
          cardColor: AppColors.lightGrey,
          primaryColorLight: AppColors.lightTeal,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: kPrimaryColor, // Matches main theme
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold), // Enhances visibility
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
