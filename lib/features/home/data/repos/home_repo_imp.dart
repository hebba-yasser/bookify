import 'package:bookify/core/data/models/book_model/book_model.dart';
import 'package:bookify/core/failure/failure.dart';
import 'package:bookify/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;
  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewArrivalsBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=subject:education&orderBy=newest&filter=free-ebooks');
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
  Future<Either<Failure, List<BookModel>>> fetchBooksByAuthorName() {
    // TODO: implement fetchBooksByAuthorName
    throw UnimplementedError();
  }
}
