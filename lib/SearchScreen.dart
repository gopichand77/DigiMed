import 'package:digimed/ViewUser.dart';
import 'package:digimed/variables.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class SearchProfile extends StatefulWidget {
  _SearchProfileState createState() => _SearchProfileState();
}

class _SearchProfileState extends State<SearchProfile> {
  Future<QuerySnapshot> searchresult;
  searchuser(String typeduser) {
    var users = usercollection
        .where('username', isGreaterThanOrEqualTo: typeduser)
        .get();
    setState(() {
      searchresult = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            filled: true,
            hintText: 'Search For User ',
          ),
          onFieldSubmitted: searchuser,
        ),
      ),
      body: searchresult == null
          ? Center(
        child: Text("Search For Users"),
      )
          : FutureBuilder(
          future: searchresult,
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot users = snapshot.data.documents[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewUser(users.data()['uid'])));
                    },
                    child: ListTile(
                        leading: Icon(Icons.search),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                          NetworkImage(users.data()['imageURL']),
                        ),
                        title: Text(
                          users.data()['username'],
                        )),
                  );
                });
          }
      ),

    );
  }
}

