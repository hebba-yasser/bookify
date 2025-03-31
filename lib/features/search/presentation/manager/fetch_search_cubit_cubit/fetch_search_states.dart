import '../../../../../core/data/models/book_model/book_model.dart';

sealed class FetchSearchBookStates {}

class FetchSearchInitial extends FetchSearchBookStates {}

class FetchSearchLoading extends FetchSearchBookStates {}

class FetchSearchSuccess extends FetchSearchBookStates {
  final List<BookModel> books;
  FetchSearchSuccess(this.books);
}

class FetchSearchFailure extends FetchSearchBookStates {
  final String errMessage;
  FetchSearchFailure(this.errMessage);
}

class FetchSearchLoadingPagination extends FetchSearchBookStates {
  final List<BookModel> books;

  FetchSearchLoadingPagination(this.books);
}

class FetchSearchFailurePagination extends FetchSearchBookStates {
  final List<BookModel> books;
  final String errMessage;
  FetchSearchFailurePagination(this.errMessage, this.books);
}
