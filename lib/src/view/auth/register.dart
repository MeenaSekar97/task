import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/src/config/extension.dart';

import '../../config/style.dart';
import '../home/home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String profileImage = '';
  final TextEditingController usernmae = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.wp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.hp),
            Stack(
              alignment: Alignment.center,
              children: [
                profileImage == ''
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuxOD947yarQlQxk3janeD2er_Jnyqz8UvA0_QytamqNhtylFNYbA-FdaKCt88-vAqpys&usqp=CAU"),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File(profileImage))),
                Positioned(
                    bottom: -4,
                    right: -4,
                    child: IconButton.filled(
                        onPressed: () async {
                          var filepicker = ImagePicker();
                          var image = await filepicker.pickImage(
                              source: ImageSource.gallery);

                          if (image != null) {
                            if (!mounted) {
                              return;
                            }

                            profileImage = image.path;

                            setState(() {});
                          }
                        },
                        icon: Icon(Icons.add)))
              ],
            ),
            SizedBox(height: 4.hp),
            TextFormField(
              controller: usernmae,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 2.hp),
            TextFormField(
              controller: mobile,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Mobile',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 6.hp),
            SizedBox(
                width: 70.wp,
                child: ElevatedButton(
                    onPressed: () async {
                      if (profileImage == '') {
                        Fluttertoast.showToast(
                            msg: "Please upload the profile image");
                      } else {
                        if (usernmae.text == '') {
                          Fluttertoast.showToast(
                              msg: "Please enter the username");
                        } else {
                          if (mobile.text == '') {
                            Fluttertoast.showToast(
                                msg: "Please enter the mobile");
                          } else {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setString("profile", profileImage);
                            Get.offAll(HomeScreen());
                          }
                        }
                      }
                    },
                    child: Text("SignUp")))
          ],
        ),
      ),
    );
  }
}
