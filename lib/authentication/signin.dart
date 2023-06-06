import 'package:flutter/material.dart';
import 'package:pash_app/authentication/signup.dart';
import 'package:pash_app/reusable_widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pash_app/whatsapp_pages/tab.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextcontroller = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
     
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(244, 23, 44, 32), Color.fromARGB(255, 26, 58, 34)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logowidget("images/whatsapp.png"),
                const SizedBox(height: 20.0),
                reusabletextfield("Enter the email", Icons.person_2_rounded,
                    false, _emailTextcontroller),
                const SizedBox(height: 20.0),
                reusabletextfield("Enter your password", Icons.lock_outline,
                    true, _passwordTextController),
                    const SizedBox(height: 15.0),
                reusableButton(
                  context,
                  true,
                  () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextcontroller.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WhatsAppTab()));
                    }).onError(
                      (error, stackTrace) {
                        print("Error ${error.toString()}");
                      },
                    );
                  },
                ),
                signUpOption(),
                const SizedBox(height: 15.0),
                ForgotPass(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
          child: const Text(
            "Sign up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Row ForgotPass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
          child: const Text(
            "Sign up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
