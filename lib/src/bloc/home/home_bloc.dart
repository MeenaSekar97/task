import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/cart_model.dart';
import '../../repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchItemsEvent>((event, emit) async {
      emit(LoadingState());
      var response = await HomeRepository.getItems();
      if (response != null) {
        if (response.statusCode == 200) {
          var output = cartModelFromJson(response.body);
          emit(FetchSuccessState(output));
        } else {
          emit(FetchFailedState(response.reasonPhrase!));
        }
      } else {
        emit(FetchFailedState("Something went worong!"));
      }
    });

    on<RequestDetailEvent>((event, emit) async {
      emit(LoadingState());
      var response = await HomeRepository.getDetail(event.id);
      if (response != null) {
        if (response.statusCode == 200) {
          var output = Product.fromJson(json.decode(response.body));
          emit(DetailSuccessState(output));
        } else {
          emit(DetailsFailedState(response.reasonPhrase!));
        }
      } else {
        emit(DetailsFailedState("Something went worong!"));
      }
    });
  }
}
