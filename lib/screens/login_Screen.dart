import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/resources/auth_method.dart';
import 'package:insta_clone/responsive/mobile_Screen_layout.dart';
import 'package:insta_clone/responsive/responsive_layout_screen.dart';
import 'package:insta_clone/responsive/web_screen_layout.dart';
import 'package:insta_clone/screens/signup_screen.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/utils/global_variable.dart';
import 'package:insta_clone/utils/utils.dart';
import 'package:insta_clone/widgets/text_field_input.dart';

class LoginSreen extends StatefulWidget {
  const LoginSreen({super.key});

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: MediaQuery.of(context).size.width>webScreenSize?EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width/3 ):const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              height: 64,
            ),
            const SizedBox(
              height: 64,
            ),
            //textfield for email
            TextFieldInput(
              textEditingController: _emailController,
              hintText: "Enter your email",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Enter your password",
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(height: 24),

            InkWell(
              onTap: loginUser,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  color: blueColor,
                ),
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : const Text("Log In"),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    child: const Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpSreen()));
                  },
                  child: Container(
                    child: const Text(
                      "Sign Up.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: mobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }
}
