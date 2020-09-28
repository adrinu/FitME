import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/functions.dart';
import 'package:flushbar/flushbar.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;

  final signUpEmail = TextEditingController();
  final signUpPassword = TextEditingController();
  final signUpConfirmPassword = TextEditingController();

  String errorMessage;

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
              child: Image.asset('assets/images/Auth/signup.png'),
            ),
            // Motto
            Text(
              "we all start from somwhere.",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
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
                child: Container(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        //Email input
                        TextFormField(
                          controller: signUpEmail,
                          onSaved: (value) {
                            email = value;
                          },
                          validator: emailValidator,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'E-mail',
                            border: InputBorder.none,
                          ),
                        ),
                        //Password  input
                        TextFormField(
                          controller: signUpPassword,
                          validator: passwordValidator,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                        //Password confirm input
                        TextFormField(
                          controller: signUpConfirmPassword,
                          validator: confirmPasswordValidator,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.check_circle_outline),
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            print('User pressed -> Has account');
                            Navigator.pop(context);
                          },
                          child: Text('Already have an account? Click here'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //Sign in button
            Padding(
              padding: const EdgeInsets.all(75.0),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(75, 15, 75, 15),
                elevation: 10,
                color: Colors.lightBlue[500],
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  print("User pressed -> Sign Up");
                  if (formKey.currentState.validate()) {
                    createAccount(
                      formatString(signUpEmail.text),
                      formatString(signUpPassword.text),
                    );
                  }
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

  void createAccount(email, password) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then(
          (value) => {
            Navigator.pop(context),
            Flushbar(
              margin: EdgeInsets.all(8),
              borderRadius: 8,
              backgroundColor: Colors.lightBlue[500],
              duration: Duration(seconds: 5),
              message: "Created Account! You can login now.",
            ).show(context),
            //dispose(),
          },
        )
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
                  signUpPassword.clear();
                  signUpEmail.clear();
                  signUpConfirmPassword.clear();
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
    signUpEmail.dispose();
    signUpPassword.dispose();
    signUpConfirmPassword.dispose();
  }

  String confirmPasswordValidator(String password) {
    if (formatString(signUpPassword.text) !=
        formatString(signUpConfirmPassword.text)) {
      return 'Passwords do not match';
    }
    return null;
  }
}
