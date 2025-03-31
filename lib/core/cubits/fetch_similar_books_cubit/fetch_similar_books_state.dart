import '../../data/models/book_model/book_model.dart';

sealed class FetchSimilarBooksState {}

final class FetchSimilarBooksInitial extends FetchSimilarBooksState {}

final class FetchSimilarBooksLoading extends FetchSimilarBooksState {}

final class FetchSimilarBooksSuccess extends FetchSimilarBooksState {
  final List<BookModel> books;
  FetchSimilarBooksSuccess(this.books);
}

final class FetchSimilarBooksFailure extends FetchSimilarBooksState {
  final String errMessage;
  FetchSimilarBooksFailure(this.errMessage);
}
