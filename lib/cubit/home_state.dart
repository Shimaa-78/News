part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeCubetInitial extends HomeState {}
final class HomeBannerLoading extends HomeState {}

final class HomeBannerSuccess extends HomeState {}

final class HomeBannerError extends HomeState {
  final String msg;
  HomeBannerError(this.msg);
}



