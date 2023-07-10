import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:task/src/config/extension.dart';
import 'package:task/src/config/style.dart';

import '../../bloc/home/home_bloc.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(RequestDetailEvent(id)),
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is DetailsFailedState) {
              Fluttertoast.showToast(msg: state.messge);
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return state is LoadingState
                  ? Center(child: CircularProgressIndicator())
                  : state is DetailSuccessState
                      ? CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              pinned: true,

                              flexibleSpace: FlexibleSpaceBar(
                                background: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  child: Image.network(
                                    state.data.thumbnail!,
                                    width: 100.wp,
                                    height: 50.hp,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ), //Text
                              //FlexibleSpaceBar
                              expandedHeight: 50.hp,

                              leading: IconButton(
                                icon: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        color: const Color.fromARGB(
                                            255, 207, 203, 203),
                                        height: 50,
                                        width: 50,
                                        child: const Icon(Icons.arrow_back))),
                                tooltip: 'Menu',
                                onPressed: () {
                                  Get.back();
                                },
                              ), //IconButton
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                width: 100.wp,
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.hp, horizontal: 4.wp),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        state.data.title!,
                                        style: headerStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.5.hp,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "Price \$${state.data.price}",
                                        style: subheader_01Style,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.5.hp,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        state.data.description!,
                                        style: subheader_02Style,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
