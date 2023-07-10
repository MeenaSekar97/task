import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:task/src/repository/auth_repository.dart';
import 'package:task/src/view/home/home.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RequestLoginEvent>((event, emit) async {
      emit(LoadingState());
      var response = await AuthRepository().signInWithGoogle();

      if (response != null) {
        if (response.user != null) {
          await GoogleSignIn().signOut();
          Get.offAll(HomeScreen());
        } else {
          emit(AuthFailedState("Invalid"));
        }
      } else {
        emit(AuthFailedState("Something went wrong!"));
      }
    });
  }
}
