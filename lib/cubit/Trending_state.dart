part of 'Trending.dart';

@immutable
sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}
final class HomeTrendingLoading extends TrendingState {}

final class HomeTrendingSuccess extends TrendingState {}

final class HomeTrindingError extends TrendingState {
  final String msg;
  HomeTrindingError(this.msg);
}
