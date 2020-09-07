import 'package:fitness_app/Authencation/SignUpPage.dart';
import 'package:fitness_app/Pages/NavigatePages.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/functions.dart';
import 'forgotPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();

  final signInEmail = TextEditingController();
  final signInPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image
            Container(
              height: 300,
              child: Image.asset('assets/images/workout.png'),
            ),
            // Motto
            Text(
              "lets reach that goal.",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            // Email and Password Area
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
              child: Material(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                elevation: 10,
                child: Form(
                  key: formKey,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        //Email input
                        TextFormField(
                          controller: signInEmail,
                          validator: emailValidator,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'E-mail',
                            border: InputBorder.none,
                          ),
                        ),
                        //Password input
                        TextFormField(
                          controller: signInPassword,
                          obscureText: true,
                          validator: passwordValidator,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              print('User pressed -> Forgot Password');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()));
                            },
                            child: Text('Forgot Password?'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //Sign in button
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(75, 15, 75, 15),
                elevation: 10,
                color: Colors.lightBlue[500],
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    signIn(formatString(signInEmail.text),
                        formatString(signInPassword.text));
                  }
                  print("User pressed -> Sign In");
                },
              ),
            ),
            //Create a new account
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(75, 15, 75, 15),
                elevation: 10,
                color: Colors.lightBlue[500],
                child: Text(
                  "CREATE ACCOUNT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  print('User pressed -> Create account');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  /// ----------------------------------------
  ///             AUTHENICATION
  /// ----------------------------------------

  void signIn(email, password) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => {
              dispose(),
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => NavigatePages()))
            })
        .catchError((onError) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Uh oh!"),
            content: Text(onError.message),
            actions: [
              RaisedButton(
                child: Text("O K"),
                onPressed: () {
                  Navigator.pop(context);
                  signInPassword.clear();
                  signInEmail.clear();
                },
              )
            ],
          );
        },
      );
    });
  }

  void dispose() {
    super.dispose();
    signInEmail.dispose();
    signInPassword.dispose();
  }
}
