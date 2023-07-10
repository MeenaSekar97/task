import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/src/config/extension.dart';
import 'package:task/src/config/style.dart';
import 'package:task/src/view/auth/login.dart';

import '../../bloc/home/home_bloc.dart';
import 'detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String profile = '';
  @override
  void initState() {
    fetchProfile();
    super.initState();
  }

  void fetchProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    profile = pref.getString("profile") ?? '';
    setState(() {});
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Get.offAll(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          profile == ''
              ? CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuxOD947yarQlQxk3janeD2er_Jnyqz8UvA0_QytamqNhtylFNYbA-FdaKCt88-vAqpys&usqp=CAU"),
                )
              : CircleAvatar(
                  radius: 20, backgroundImage: FileImage(File(profile))),
          SizedBox(
            width: 1.wp,
          ),
          IconButton.filledTonal(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.logout)),
          SizedBox(
            width: 2.wp,
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => HomeBloc()..add(FetchItemsEvent()),
        child: Container(
          margin: EdgeInsets.only(top: 2.hp),
          child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is FetchFailedState) {
                Fluttertoast.showToast(msg: state.message);
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state is LoadingState
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : state is FetchSuccessState
                        ? ListView.builder(
                            itemCount: state.data.products!.length,
                            itemBuilder: (context, index) {
                              var data = state.data.products![index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 2.hp),
                                padding: EdgeInsets.symmetric(horizontal: 4.wp),
                                height: 10.hp,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        DetailScreen(id: data.id.toString()));
                                  },
                                  child: Card(
                                    child: Row(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            12.0), //or 15.0
                                        child: Container(
                                          height: 10.hp,
                                          width: 30.wp,
                                          color: Color(0xffFF0E58),
                                          child: Image.network(
                                            data.thumbnail!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 2.wp, top: 1.hp),
                                        width: 50.wp,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                data.title!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: subheader_01Style,
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                data.description!,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: subheader_02Style,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              );
                            })
                        : SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
