import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/functions.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var forgotPassword = TextEditingController();
  String message;
  final successSnackBar = SnackBar(content: Text("Email sent!"));
  final failSnackBar =
      SnackBar(content: Text("Something went wrong! Try again in a few!"));
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email).then((value) => {
          Navigator.pop(context),
          dispose(),
        });
  }

  @override
  void dispose() {
    super.dispose();
    forgotPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: Image.asset('assets/images/forgot.png'),
              ),
              // Motto
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Forgot Password? No worries.",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Varela',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: emailValidator,
                    controller: forgotPassword,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(75, 15, 75, 15),
                  elevation: 10,
                  color: Colors.lightBlue[500],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'SEND EMAIL',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      letterSpacing: 1.5,
                    ),
                  ),
                  onPressed: () {
                    sendPasswordResetEmail(formatString(forgotPassword.text));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
