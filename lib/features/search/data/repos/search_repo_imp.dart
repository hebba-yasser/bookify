import 'package:bookify/core/data/models/book_model/book_model.dart';
import 'package:bookify/core/failure/failure.dart';
import 'package:bookify/core/utils/api_service.dart';
import 'package:bookify/features/search/data/repos/search_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../constants.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;
  SearchRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> SearchBooks(
      {required String? query,
      String? language,
      String? orderBy,
      String? filter,
      int pageNumber = 0}) async {
    try {
      print(pageNumber);
      Map<String, dynamic> queryParams = {
        "q": query,
        if (pageNumber > 0) "startIndex": pageNumber * 10,
        if (language != null) "langRestrict": language,
        if (orderBy != null) "orderBy": orderBy,
        if (filter != null) "filter": filter,
      };
      print(queryParams);
      var response = await apiService.getQuery(
        endPoint: 'volumes',
        query: queryParams,
      );

      var data = response.data;
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

  @override
  Future<Either<Failure, void>> updateUserSearchList(
      {required String search}) async {
    try {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uId);
      final snapshot = await userDoc.get();

      List<String> recentSearches = [];
      if (snapshot.exists && snapshot.data()!['recentSearch'] != null) {
        recentSearches = List<String>.from(snapshot.data()!['recentSearch']);
      }
      if (!recentSearches.contains(search)) {
        recentSearches.insert(0, search);
      }
      if (recentSearches.length > 10) {
        recentSearches = recentSearches.sublist(0, 10);
      }
      await userDoc.update({'recentSearch': recentSearches});
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } else {
        return left(FirebaseFailure(e.toString()));
      }
    }
  }
}
