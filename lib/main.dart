import 'package:digimed/home.dart';
import 'package:digimed/intro/intro.dart';
import 'package:digimed/variables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

// void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Intro(),
      // home: MyHomePage(title: 'Motion Tab Bar Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Global.blue,
        title: Text(
          'DigiMed',
          style: mystyle(
            26,
            Colors.black,
            FontWeight.w900,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                //   Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => ReportProblem()));
                },
                child: Icon(
                  Icons.search_outlined,
                  size: 26.0,
                ),
              )),
        ]
      ),
      body: MotionTabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            child: Center(
              child: Text("Account"),
            ),
          ),
          Container(
            child: Center(
              child: Home(),
              // child: Text(
              //   "Home",
              //   style: mystyle(
              //     18,
              //   ),
              // ),
            ),
          ),
          Container(
            child: Center(
              child: Text("Dashboard"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: MotionTabBar(
          labels: ["Account", "Home", "Dashboard"],
          initialSelectedTab: "Home",
          tabIconColor: Colors.green,
          tabSelectedColor: Colors.red,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.account_box, Icons.home, Icons.menu],
          textStyle: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
