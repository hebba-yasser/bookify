import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../constants.dart';
import '../../../../core/data/models/user_model/user_model.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/utils/cache_helper.dart';
import 'auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  @override
  Future<Either<Failure, UserModel>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return await createUser(
            email: email,
            name: name,
            phone: phone,
            uId: userCredential.user!.uid);
      }
      return left(FirebaseFailure('User credential is null'));
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> createUser({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) async {
    try {
      UserModel newUser = UserModel(
        uId: uId,
        name: name,
        email: email,
        phone: phone,
        preferences: null,
        recentSearch: null,
        imgUrl: null,
        likedBooks: null,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(newUser.toMap());
      await CacheHelper.setString(key: 'uid', value: uId);
      return right(newUser);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> updateUserPreferences({
    required UserModel user,
  }) async {
    try {
      var uId = CacheHelper.getString(key: 'uid');
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uId);
      await userDoc.update({'preferences': user.preferences?.toJson()});
      final updatedData = await userDoc.get();
      final updatedUser = UserModel.fromMap(updatedData.data()!);
      return Right(updatedUser);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
        if (userData.exists) {
          await CacheHelper.setString(
              key: 'uid', value: userCredential.user!.uid);
          await CacheHelper.setBoolean(key: 'islogged', value: true);
          uId = CacheHelper.getString(key: 'uid');
          isLogged = CacheHelper.getBoolean(key: 'islogged') ?? false;
          return Right(
              UserModel.fromMap(userData.data() as Map<String, dynamic>));
        }
      }
      return left(FirebaseFailure('User credential is null'));
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(
      {required String currentPassword, required String newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
