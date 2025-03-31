import 'package:bookify/core/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../failure/failure.dart';
import '../models/user_model/small_book_model.dart';
import '../models/user_model/user_model.dart';

abstract class SharedRepo {
  Future<Either<Failure, BookModel>> fetchBookById({required String id});

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
  Stream<Either<Failure, UserModel>> fetchUserData({required String id});
  Future<Either<Failure, void>> updateUserRecentlyViewedList({
    required SmallBookModel book,
  });
}
