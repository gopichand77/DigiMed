import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimed/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ViewUser extends StatefulWidget {
  final String uid;
  ViewUser(this.uid);
  @override
  _ViewUserState createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  String username = '';
  String email = '';
  bool dataisthere = false;
  bool dataemail = false;
  String imageURL = '';

  TextEditingController usernamecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getuserdata();
    // getuseremail();
  }

  getuserdata() async {
    DocumentSnapshot userdoc = await usercollection.doc(widget.uid).get();
    setState(() {
      username = userdoc.data()['username'];
      email = userdoc.data()['email'];

      dataisthere = true;
    });
  }

  getstream() async {
    setState(() {
      usercollection.where('uid', isEqualTo: widget.uid).snapshots();
    });
  }



  @override
  Widget build(BuildContext context) {
    return dataisthere == false
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    height: MediaQuery.of(context).size.height / 6,
                    width: double.infinity,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ), //profilepic will be here
                  Container(
                    child: Text(
                      username,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ), //name of the profile
                  Container(
                    child: Text(
                      email,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ), //text for the email address
                ]),
              ),
            ]),
      ),
    );
  }
}
