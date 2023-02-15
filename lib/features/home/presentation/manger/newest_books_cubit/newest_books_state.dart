part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class FeaturedBooksLoading extends NewestBooksState {}

class FeaturedBooksFailure extends NewestBooksState {
  final String errMessage;

  const FeaturedBooksFailure(this.errMessage);
}

class FeaturedBooksSuccess extends NewestBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccess(this.books);
}