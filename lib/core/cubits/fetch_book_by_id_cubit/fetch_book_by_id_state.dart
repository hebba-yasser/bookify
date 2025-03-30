import '../../data/models/book_model/book_model.dart';

sealed class FetchBookByIdState {}

final class FetchBookByIdInitial extends FetchBookByIdState {}

final class FetchBookByIdLoading extends FetchBookByIdState {}

final class FetchBookByIdSuccess extends FetchBookByIdState {
  final BookModel books;
  FetchBookByIdSuccess(this.books);
}

final class FetchBookByIdFailure extends FetchBookByIdState {
  final String errMessage;
  FetchBookByIdFailure(this.errMessage);
}
