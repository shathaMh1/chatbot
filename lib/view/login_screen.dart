import 'package:newchatbot/constants/constants.dart';
import 'package:newchatbot/controller/login_controller.dart';
import 'package:newchatbot/view/bottom_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 130),
                    const Text(
                      'Login by',
                      style: TextStyle(color: kGreyColor),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          height: MediaQuery.of(context).size.width / 6.7,
                          decoration: BoxDecoration(
                            color: kRedColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png'),
                              const SizedBox(width: 8),
                              const Text(
                                'with Google',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          height: MediaQuery.of(context).size.width / 6.7,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png'),
                              const SizedBox(width: 8),
                              const Text(
                                'with Apple',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'or',
                      style: TextStyle(color: kGreyColor),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'User Name',
                              style: TextStyle(color: kGreyColor),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _userController,
                              validator: (value) {
                                bool _isEmailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!);
                                if (!_isEmailValid) {
                                  return 'Invalid email.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
                                prefixIcon:
                                    Image.asset('assets/images/user.png'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: kGreyColor,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: kGreyColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Password',
                              style: TextStyle(color: kGreyColor),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters.';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                prefixIcon:
                                    Image.asset('assets/images/lock.png'),
                                suffixIcon: const Icon(
                                  Icons.visibility_off,
                                  color: kGreyColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: kGreyColor,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: kGreyColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: kGreyColor,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(
                                    color: kGreyColor,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  'Don\'t remember the password ?',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: kGreyColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 8.5,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kGreyColor2),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.signIn(
                                        _userController.text.trim(),
                                        _passwordController.text.trim(),
                                      );
                                      if (controller.loggedIn == true) {
                                        Get.to(const BottomBarScreen());
                                      }
                                    } else {
                                      return null;
                                    }
                                  },
                                  child: const Text('Login'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Dont have account ?',
                                  style: TextStyle(color: kGreyColor),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Sing Up',
                                    style: TextStyle(
                                      color: kGreyColor2,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
