import 'package:amzone/common/widgets/bottom_bar.dart';
import 'package:amzone/common/widgets/customTextFields.dart';
import 'package:amzone/common/widgets/custom_button.dart';
import 'package:amzone/constants/global_variables.dart';
import 'package:amzone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

// Selectiong pages between sign up and sign in screen option
enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  // Navigation Route constant
  static const String routName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Auth enum variable to change state or form view
  Auth _auth = Auth.signUp;

  //Key variable for sign up and login form
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authServicce = AuthService();

  //Controller variables for form parameters
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //Dispose funtion for form parameters
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authServicce.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authServicce.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

            //Form design starts here usin column
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  //Sign up ListTile
                  ListTile(
                    tileColor: _auth == Auth.signUp
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundCOlor,
                    title: const Text(
                      "Create Account",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signUp,
                      groupValue: _auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),

                  //Form navigation for form selection signup
                  if (_auth == Auth.signUp)
                    Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            CustomTextFields(
                                controller: _nameController,
                                hint: "Full Name",
                                icon: const Icon(Icons.person)),
                            const SizedBox(height: 10),
                            CustomTextFields(
                                controller: _emailController,
                                hint: "E mail",
                                icon: const Icon(Icons.email)),
                            const SizedBox(height: 10),
                            CustomTextFields(
                                controller: _passwordController,
                                hint: "Password",
                                icon: const Icon(Icons.password)),
                            const SizedBox(height: 10),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomButton(
                                text: "Sign up",
                                onTap: () {
                                  if (_signUpFormKey.currentState!.validate()) {
                                    signUpUser();
                                  }
                                }),
                          ],
                        )),
                  //Log in ListTile
                  ListTile(
                    tileColor: _auth == Auth.signIn
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundCOlor,
                    title: const Text(
                      "Sign in",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signIn,
                      groupValue: _auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),

                  //Form navigation for form selection signup
                  if (_auth == Auth.signIn)
                    Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            CustomTextFields(
                                controller: _emailController,
                                hint: "E mail",
                                icon: const Icon(Icons.email)),
                            const SizedBox(height: 10),
                            CustomTextFields(
                                controller: _passwordController,
                                hint: "Password",
                                icon: const Icon(Icons.password)),
                            const SizedBox(height: 10),
                            CustomButton(
                                text: "Sign in",
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      BottomBar.routName, (route) => false);
                                  // if (_signInFormKey.currentState!.validate()) {
                                  //   signInUser();
                                  // }
                                }),
                          ],
                        )),
                ],
              ),
            ),
          ),
        ));
  }
}
