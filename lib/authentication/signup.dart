import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pash_app/authentication/signin.dart';
import 'package:pash_app/reusable_widgets/reusable_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTextcontroller = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
     
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(244, 0, 0, 0), Colors.grey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                logowidget("images/whatsapp.png"),
                const SizedBox(height: 20),
                reusabletextfield("Enter username", Icons.person_2_outlined,
                    false, _userNameTextController),
                const SizedBox(height: 20),
                reusabletextfield("Enter the email", Icons.person_2_outlined,
                    false, _emailTextcontroller),
                const SizedBox(height: 20.0),
                reusabletextfield("Enter the password",
                    Icons.lock_outline_rounded, true, _passwordTextController),
                const SizedBox(height: 20.0),
                reusableButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextcontroller.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created new account");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
