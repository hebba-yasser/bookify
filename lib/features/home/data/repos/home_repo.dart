import 'package:bookify/core/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewArrivalsBooks();
  Future<Either<Failure, List<BookModel>>> fetchBooksByAuthorName();
}
