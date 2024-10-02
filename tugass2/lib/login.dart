import 'package:flutter/material.dart';
import 'package:tugass2/home.dart';
import 'package:tugass2/profil.dart';

bool isLoginSuccess = true;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String username = "";  // This will hold the username
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              const SizedBox(height: 50),
              _username(),  // Call the username input widget
              _password(),  // Call the password input widget
              _loginButton(context),  // Call the login button
            ],
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value; // Capture the input from the username field
        },
        decoration: const InputDecoration(
          hintText: 'Username',
          labelText: 'Masukkan Username',
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.lightGreenAccent),
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: const InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.lightGreenAccent),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red),
      onPressed: (){
      String text = "";
      if ( password == "123") {
        setState(() {
          text = "LoginSuccess";
          isLoginSuccess = true;
          print(password);
        });
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context){
          return Home(username: username);
        }));
      } else {
        setState(() {
          text = "LoginFailed";
          isLoginSuccess = false;
        });
        print(password);
      }
      SnackBar snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    child: const Text('Login'),
    ),
  );
}
}
