import '../../../../../core/data/models/book_model/book_model.dart';

sealed class FetchSearchBookStates {}

final class FetchSearchInitial extends FetchSearchBookStates {}

final class FetchSearchLoading extends FetchSearchBookStates {}

final class FetchSearchSuccess extends FetchSearchBookStates {
  final List<BookModel> books;
  FetchSearchSuccess(this.books);
}

final class FetchSearchFailure extends FetchSearchBookStates {
  final String errMessage;
  FetchSearchFailure(this.errMessage);
}
