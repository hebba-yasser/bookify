import '../../../../../core/data/models/book_model/book_model.dart';

sealed class FetchBooksByAuthorNameStates {}

final class FetchBooksByAuthorNameInitial
    extends FetchBooksByAuthorNameStates {}

final class FetchBooksByAuthorNameLoading
    extends FetchBooksByAuthorNameStates {}

final class FetchBooksByAuthorNameSuccess extends FetchBooksByAuthorNameStates {
  final List<BookModel> books;
  FetchBooksByAuthorNameSuccess(this.books);
}

final class FetchBooksByAuthorNameFailure extends FetchBooksByAuthorNameStates {
  final String errMessage;
  FetchBooksByAuthorNameFailure(this.errMessage);
}

class FetchBooksByAuthorNameLoadingPagination
    extends FetchBooksByAuthorNameStates {
  final List<BookModel> books;

  FetchBooksByAuthorNameLoadingPagination(this.books);
}

class FetchBooksByAuthorNameFailurePagination
    extends FetchBooksByAuthorNameStates {
  final List<BookModel> books;
  final String errMessage;
  FetchBooksByAuthorNameFailurePagination(this.errMessage, this.books);
}
