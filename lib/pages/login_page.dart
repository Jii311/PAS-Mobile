import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/login_controller.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/username_controller.dart';
import 'package:pas1_mobile_11pplg2_11/widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;

  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff577EE1),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MyTextField(
                controller: usernameController,
                isObscure: false,
                hintText: 'Username',
                labelText: '',
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                icon: Icons.person,
                width: MediaQuery.of(context).size.width),
            MyTextField(
                controller: passwordController,
                isObscure: true,
                hintText: 'Password',
                labelText: '',
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                icon: Icons.shield,
                width: MediaQuery.of(context).size.width),
            SizedBox(
              height: 20,
            ),
            Obx(() => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff577EE1))),
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            if (usernameController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Nama dan password harus diisi!",
                                  ),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            } else {
                              await controller.login(usernameController.text,
                                  passwordController.text);
                              if (controller.loginStatus.value ==
                                  "Login success") {
                                Get.snackbar(controller.loginStatus.value,
                                    controller.token.value);
                                Get.put(UserController())
                                    .setUsername(usernameController.text);
                                Get.toNamed('/dashboard');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      controller.loginStatus.value,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                )),
            TextButton(
                onPressed: () {
                  Get.toNamed('/register');
                },
                child: Text(
                  'Dont Have Account? Register',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
