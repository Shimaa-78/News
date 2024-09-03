part of 'all_news_cubit.dart';

@immutable
sealed class AllNewsState {}

final class AllNewsInitial extends AllNewsState {}
final class AllLoading extends AllNewsState {}

final class AllSuccess extends AllNewsState {}

final class AllError extends AllNewsState {
  final String msg;
  AllError(this.msg);
}

