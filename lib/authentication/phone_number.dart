import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../reusable_widgets/reusable_widget.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phone_number = TextEditingController()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text("Login"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
body: Container(
  padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.2, 20, 20),
  child: Column(
    children: [reusabletextfield("Phone number", Icons.phone, false, phone_number),
    const SizedBox(height: 16.0),
    reusableButton(context, false, (){
      FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
    })
    ],
      
  )
)


    );
  }
}