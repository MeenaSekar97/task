import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:task/src/bloc/auth/auth_bloc.dart';
import 'package:task/src/config/extension.dart';
import 'package:task/src/view/auth/register.dart';

import '../../config/style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => AuthBloc(),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailedState) {
                Fluttertoast.showToast(msg: state.message);
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: Text(
                      "WELCOME! Let's Login",
                      style: headerStyle,
                    )),
                    SizedBox(child: Image.asset("assets/login_icon.jpg")),
                    state is LoadingState
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: 70.wp,
                            child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(RequestLoginEvent());
                                },
                                child: Text("Login with social media")),
                          ),
                    SizedBox(height: 1.hp),
                    SizedBox(
                        width: 70.wp,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(RegisterScreen());
                            },
                            child: Text("SignUp")))
                  ],
                );
              },
            ),
          ),
        ));
  }
}
