import 'package:dartz/dartz.dart';

import '../../../../core/data/models/book_model/book_model.dart';
import '../../../../core/failure/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> SearchBooks({
    required String? query,
    String? language,
    String? orderBy,
    String? filter,
  });
  Future<Either<Failure, void>> updateUserSearchList({
    required String search,
  });
}
