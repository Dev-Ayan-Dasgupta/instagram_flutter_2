import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter_2/resources/auth_methods.dart';
import 'package:instagram_flutter_2/utils/colors.dart';
import 'package:instagram_flutter_2/utils/utils.dart';
import 'package:instagram_flutter_2/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            //svg image
            SvgPicture.asset(
              "assets/ic_instagram.svg",
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 64,
            ),
            //circular widget to accept and show our selected file
            Stack(children: [
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          "https://icon-library.com/images/default-profile-icon/default-profile-icon-24.jpg"),
                    ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: selectImage,
                  icon: const Icon(Icons.add_a_photo),
                ),
              )
            ]),
            const SizedBox(
              height: 24,
            ),
            //text field input username
            TextFieldInput(
              hintText: "Enter your username",
              textInputType: TextInputType.text,
              textEditingController: _usernameController,
            ),
            const SizedBox(
              height: 24,
            ),
            //text field input email
            TextFieldInput(
              hintText: "Enter your email",
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(
              height: 24,
            ),
            //text field input password
            TextFieldInput(
              hintText: "Enter your password",
              textInputType: TextInputType.visiblePassword,
              textEditingController: _passwordController,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            //text field input bio
            TextFieldInput(
              hintText: "Enter your bio",
              textInputType: TextInputType.text,
              textEditingController: _bioController,
            ),
            const SizedBox(
              height: 24,
            ),
            //signup button
            InkWell(
              onTap: () async {
                String res = await AuthMethods().signupUser(
                  username: _usernameController.text,
                  bio: _bioController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  file: _image!,
                );
                print(res);
              },
              child: Container(
                child: const Text("Signup"),
                width: double.infinity,
                height: 48,
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: blueColor),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: const Text("Already have an account?"),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                ),
              ),
            ])
            //transitioning to sign up
          ],
        ),
      )),
    );
  }
}
