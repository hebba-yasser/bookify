import 'package:bookify/core/data/models/book_model/book_model.dart';
import 'package:bookify/core/failure/failure.dart';
import 'package:bookify/core/utils/api_service.dart';
import 'package:bookify/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;
  SearchRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> SearchBooks(
      {required String? query,
      String? language,
      String? orderBy,
      String? filter}) async {
    try {
      Map<String, dynamic> queryParams = {
        "q": query,
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
  Future<Either<Failure, void>> updateUserSearchList({required String search}) {
    // TODO: implement updateUserSearchList
    throw UnimplementedError();
  }
}
