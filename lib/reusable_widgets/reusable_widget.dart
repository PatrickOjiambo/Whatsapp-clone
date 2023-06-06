import 'package:flutter/material.dart';

Image logowidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 120,
    height: 120,
    color: Colors.white,
  );
}

TextField reusabletextfield(String text, IconData icon, bool isPasswordtype,
    TextEditingController controller) {
  return TextField(
    autocorrect: !isPasswordtype,
    obscureText: isPasswordtype,
    enableSuggestions: !isPasswordtype,
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(255, 37, 37, 37),
      ),
      filled: true,
      labelText: text,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.9),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordtype
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

//Reusable button for all the tasks
Container reusableButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(5, 10, 5, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              } else {
                return Colors.white;
              }
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)))),
      child: Text(isLogin ? 'LOGIN' : 'SIGN UP',
          style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16)),
    ),
  );
}

//forgot Pass
Container passbutton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(5, 10, 5, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              } else {
                return Colors.white;
              }
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)))),
      child: Text(isLogin ? 'Reset Password' : 'Reset Password',
          style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16)),
    ),
  );
}



//Reusable appbar
Scaffold reusablePage(
    BuildContext context, String title, IconData icon, Container body) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          decorationStyle: TextDecorationStyle.dotted,
        ),
      ),
    ),
    body: Container(),
  );
}
