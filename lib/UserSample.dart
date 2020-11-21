import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimed/Status.dart';
import 'package:digimed/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';

class Dummy extends StatefulWidget {
  Dummy({this.storage});
  final FirebaseStorage storage;

  @override
  _DummyState createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  File imageURL;

  var _formKey = GlobalKey<FormState>();

  bool autoValidate;
  bool isloading = false;
  final picker = ImagePicker();
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _messagingController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;

  get map => null;

  @override
  void initState() {

    super.initState();
    getuserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body:  isloading ? CircularProgressIndicator():SingleChildScrollView(child: Column(
          children: <Widget>[
            Container(margin: EdgeInsets.all(30.0),
              child: imageURL == null
                  ? Text('No image selected.')
                  : Image.file(imageURL),


            ),
            TextFormField(
              controller: _titleEditingController,
              decoration: InputDecoration(
                  hintText: "Enter Tiltle",
                  labelText: "Title",
                  border: OutlineInputBorder()
              ),
            ),
            TextFormField(
              controller: _messagingController,
              decoration: InputDecoration(
                  hintText: " Description",
                  labelText: "Message",
                  border: OutlineInputBorder()
              ),
            ),
            RaisedButton(onPressed: (){
              uploadStatus();
            },child: Text('Upload Status'),
            )
          ]

      ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: getImage,

        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),


    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imageURL = File(pickedFile.path);



      } else {
        print('No image selected.');
      }
    });
  }
//   Future<void> _cropImage() async {
//     final scale = cropKey.currentState.scale;
//     final area = cropKey.currentState.area;
//     if (area == null) {
//       // cannot crop, widget is not setup
//       return;
//     }

//     // scale up to use maximum possible number of pixels
//     // this will sample image in higher resolution to make cropped image larger
//     final sample = await ImageCrop.sampleImage(
//       file: _file,
//       preferredSize: (2000 / scale).round(),
//     );

//     final file = await ImageCrop.cropImage(
//       file: sample,
//       area: area,
//     );

//     sample.delete();

//     _lastCropped?.delete();
//     _lastCropped = file;

//     debugPrint('$file');
//   }
// }
  uploadStatus() async {
    setState(() {
      isloading = true;
    });
    var imageUpload = await uploadImage();
    Post statusModel = new Post();
    statusModel.imageURL = imageUpload.toString();
    statusModel.title = _titleEditingController.text;
    statusModel.message = _messagingController.text;



    String docUID =
        usercollection.doc(FirebaseAuth.instance.currentUser.uid).id;
    statusModel.doc = docUID;
    usercollection
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set(statusModel.toMap());

    // Fluttertoast.showToast(msg: "Picture uploaded");
    // Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
    // setState(() {
    //   isloading = false;
    // });
  }

  Future<dynamic> uploadImage() async {
    setState(() {
      isloading = true;
    });

    // ignore: unused_local_variable
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child('user');

    StorageUploadTask storageUploadTask = FirebaseStorage()
        .ref()
        .child("stat_" + DateTime.now().toIso8601String())
        .putFile(imageURL);
    StorageTaskSnapshot snapshot = await storageUploadTask.onComplete;
    var downloadURL = await snapshot.ref.getDownloadURL();
    print("downloadURL $downloadURL");
    return downloadURL;
  }
  getuserdata() async {
    DocumentSnapshot userdoc =
    await usercollection.doc(FirebaseAuth.instance.currentUser.uid).get();
  }
}

