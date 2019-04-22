import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_candraprasetya/Pages/Setup/signIn.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: new Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1525535072547-33304e6a1aef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "KardusApp",
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Register new user",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 80.0),
                  child: Text(
                    "Email",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      new Expanded(
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please type an email';
                            }
                          },
                          onSaved: (input) => _email = input,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Password",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.lock_open,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      new Expanded(
                        child: TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Your password needs to be atleast 6 characters';
                            }
                          },
                          onSaved: (input) => _password = input,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  //Button
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 100.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          splashColor: Colors.blue,
                          color: Colors.blue,
                          child: new Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              new Expanded(
                                child: Container(),
                              ),
                              new Transform.translate(
                                offset: Offset(10.0, 0.0),
                                child: new Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: FlatButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(28.0)),
                                    splashColor: Colors.white,
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.blue,
                                    ),
                                    onPressed: signUp,
                                  ),
                                ),
                              )
                            ],
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    final formState = _formKey.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage(), fullscreenDialog: true));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
