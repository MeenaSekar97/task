part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchItemsEvent extends HomeEvent {}

class RequestDetailEvent extends HomeEvent {
  final String id;
  RequestDetailEvent(this.id);
}
