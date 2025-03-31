import 'package:bookify/core/data/models/book_model/book_model.dart';
import 'package:bookify/core/data/repos/shared_repo.dart';
import 'package:bookify/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/api_service.dart';
import '../models/user_model/user_model.dart';

class SharedRepoImp implements SharedRepo {
  final ApiService apiService;

  SharedRepoImp(this.apiService);
  @override
  Future<Either<Failure, BookModel>> fetchBookById({required String id}) async {
    try {
      var data = await apiService.get(endPoint: 'volumes/$id');
      BookModel books = BookModel.fromJson(data);

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=subject:$category&filter=free-ebooks');
      List<BookModel> books = [];
      if (data.isNotEmpty) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
        return Right(books);
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Stream<Either<Failure, UserModel>> fetchUserData(
      {required String id}) async* {
    try {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(id).snapshots();
      await for (var snapshot in userDoc) {
        if (snapshot.exists) {
          final userData = UserModel.fromMap(snapshot.data()!);
          yield Right(userData);
        } else {
          yield Left(FirebaseFailure('There is no data available'));
        }
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        yield Left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        yield Left(FirebaseFailure(e.toString()));
      }
    }
  }
}
