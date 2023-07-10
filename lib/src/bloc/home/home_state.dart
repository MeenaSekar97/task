part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class FetchSuccessState extends HomeState {
  final CartModel data;
  FetchSuccessState(this.data);
}

class FetchFailedState extends HomeState {
  final String message;
  FetchFailedState(this.message);
}

class DetailSuccessState extends HomeState {
  final Product data;
  DetailSuccessState(this.data);
}

class DetailsFailedState extends HomeState {
  final String messge;
  DetailsFailedState(this.messge);
}
