import 'dart:ui';
import 'package:digimed/main.dart';
import 'package:digimed/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // ignore: unused_field
  String _email, _password, _confirmpassword;

  var _formKey = GlobalKey<FormState>();
  bool isloading = false;
  bool autoValidate = false;
  User firebaseUser;
  bool isUserVerified;
  String imageURL;
  bool isEmailVerified;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Center(
            child: isloading
                ? CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                'DigiMed',
                                style:
                                    mystyle(30, Colors.black, FontWeight.w900),
                              ),
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                height: size.height - 200,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          TextFormField(
                                            controller: _emailController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Email',
                                              prefixIcon: Icon(
                                                Icons.lock_outline,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                            ),

                                            onChanged: (item) {
                                              setState(() {
                                                _email = item;
                                              });
                                            },
                                            // validator: (_email) {
                                            //   return _email.contains('@')
                                            //       ? null
                                            //       : 'Enter valid Email';
                                            // },
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            controller: _username,
                                            keyboardType: TextInputType.text,
                                            obscureText: false,

                                            decoration: InputDecoration(
                                              hintText: 'Enter Username',
                                              prefixIcon: Icon(
                                                Icons.person,
                                              ),
                                              // suffixIcon: Icon(
                                              //   model.isValid ? Icons.check : null,
                                              // ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                            ),
                                            onChanged: (item) {
                                              setState(() {
                                                _email = item;
                                              });
                                            },
                                            // validator: (_email) {
                                            //   return _email.contains('@')
                                            //       ? null
                                            //       : 'Enter valid Email';
                                            // },
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              hintText: 'Password',
                                              prefixIcon: Icon(
                                                Icons.lock_outline,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                            ),
                                            validator: (_password) {
                                              return _password.length > 6
                                                  ? null
                                                  : "Password must be atleast 6 letters";
                                            },
                                            onChanged: (item) {
                                              setState(() {
                                                _password = item;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              hintText: 'Confirm Password',
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                              prefixIcon: Icon(
                                                Icons.lock_outline,
                                              ),
                                            ),
                                            validator: (_confirmpassword) {
                                              return _confirmpassword ==
                                                      _password
                                                  ? null
                                                  : "Password didin't match";
                                            },
                                            onChanged: (item) {
                                              setState(() {
                                                _confirmpassword = _password;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          signup();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      MyHomePage()));
                                        },
                                        child: Container(
                                          //left,top,right,bottom
                                          margin: EdgeInsets.fromLTRB(
                                              50.0, 20.0, 50.0, 0.0),
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              color: Color(0xff2f2d60)),

                                          child: Center(
                                            child: Text(
                                              'Register',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Color(0xffffffff),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      child: GestureDetector(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Already had an account ?  ",
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              " Login ",
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      MyHomePage()));
                                        },
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ));
  }

  void signup() {
    if (_formKey.currentState.validate()) {
      setState(() {
        isloading = true;
      });
      setState(() {
        autoValidate = false;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _password)
          .then((user) {
        sendVerificationEmail(context);
        usercollection.doc(user.user.uid).set({
          'username': _username.text,
          'email': _emailController.text,
          'uid': user.user.uid,
        });
      }).catchError((onError) {
        setState(() {
          isloading = false;
        });
        Fluttertoast.showToast(msg: "error" + onError.toString());
      });
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

// void postUserDataToDb() async {
//   setState(() {
//     isloading = true;
//   });
//
//   //FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
//   User firebaseUser = FirebaseAuth.instance.currentUser;
//
//   UserModel userModel = new UserModel();
//   userModel.email = _email;
//   userModel.uid = firebaseUser.uid;
//
//   // await FireStore.instance
//   //     .collection("user")
//   //     .document(firebaseUser.uid)
//   //     .setData(userModel.toMap());
//
//   await FirebaseFirestore.instance
//       .collection("user")
//       .doc(firebaseUser.uid)
//       .set(userModel.toMap());
//
//   Fluttertoast.showToast(msg: "Register Success");
//
//   sendVerificationEmail();
//
//   setState(() {
//     isloading = false;
//   });
// }

  void sendVerificationEmail(BuildContext context) async {
    //FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    User firebaseUser;
    firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser.sendEmailVerification();

    Fluttertoast.showToast(msg: "Verifcation link has sent to your e-mail.");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => MyHomePage()),
        (Route<dynamic> route) => false);
  }
}
