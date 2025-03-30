import 'package:bookify/core/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../failure/failure.dart';

abstract class SharedRepo {
  Future<Either<Failure, BookModel>> fetchBookById({required String id});

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(String? bookId);
}
