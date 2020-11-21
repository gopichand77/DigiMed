import 'package:digimed/profile.dart';
import 'package:digimed/variables.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // child: Column(
          //   children: [
          //     Container(
          //       child: Text(
          //         'Nearest Hospital',
          //         style: mystyle(20, Colors.black, FontWeight.w800),
          //       ),
          //     ),
          //     Container(
          //       padding: EdgeInsets.all(10),
          //       child: Row(
          //         children: [
          //           Container(
          //             height: MediaQuery.of(context).size.height / 10,
          //             width: MediaQuery.of(context).size.height / 8,
          //             child: Text('Hospital'),
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Profile()));
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 50,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Hospital-1',
                        style: mystyle(32, Colors.black, FontWeight.w600),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Address - 1',
                        style: mystyle(
                          18,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Profile()));
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 50,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Hospital-2',
                        style: mystyle(32, Colors.black, FontWeight.w600),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Address - 2',
                        style: mystyle(
                          18,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Profile()));
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 50,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Hospital-3',
                        style: mystyle(32, Colors.black, FontWeight.w600),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Address - 3',
                        style: mystyle(
                          18,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Profile()));
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 50,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Hospital-4',
                        style: mystyle(32, Colors.black, FontWeight.w600),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Address - 4',
                        style: mystyle(
                          18,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Profile()));
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 50,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Hospital-5',
                        style: mystyle(32, Colors.black, FontWeight.w600),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Address - 5',
                        style: mystyle(
                          18,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
