import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter_2/utils/colors.dart';
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

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1592385672401-ab91fccb6fd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
              ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: () {},
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
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: const Text("Don't have an account?"),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: const Text(
                    "Sign Up",
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
