// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: unused_import
import 'package:flutter/material.dart';


class Post {
  String doc;
  String imageURL;
  String title;
  String message;
  String uid;

  // Timestamp timestamp;

  Post({this.doc, this.imageURL, this.title, this.message,this.uid});

  factory Post.fromJSON(Map<String, dynamic> map) {
    return Post(
      doc: map["doc"],
      imageURL: map["imageURL"],
      message: map["message"],
      title: map["title"],
      uid: map["uid"],
      // likes: map["likes"],
      //
    );
  }

  set author(String author) {}



  toMap() {
    Map<String, dynamic> map = Map();
    map['doc'] = doc;
    map['imageURL'] = imageURL;
    map['title'] = title;
    map['message'] = message;
     map["uid"]= uid;
    // map["timestamp"] = FieldValue.serverTimestamp();
    return map;
  }
}
