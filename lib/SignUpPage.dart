import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              child: Image.asset('assets/images/signup.png'),
            ),
            // Motto
            Text(
              "we all start from somwhere.",
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
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      //Email input
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'E-mail',
                          border: InputBorder.none,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                      //Password input
                      TextField(
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
                          child: Text('Already have an account? Click here'))
                    ],
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
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  print("User pressed -> Sign In");
                },
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}