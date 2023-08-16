import 'package:bulkwork/src/pages/screens/diet_screen.dart';
import 'package:bulkwork/src/pages/screens/exercise_screen.dart';
import 'package:bulkwork/src/pages/screens/progress_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 1;

  List<Widget> pages = const [DietScreen(), ExerciseScreen(), ProgressScreen()];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Exit the App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                //<-- SEE HERE
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                // <-- SEE HERE
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text("Welcome User"),
          backgroundColor: Color.fromARGB(255, 9, 18, 145),
        ),
        backgroundColor: Colors.white,
        endDrawer: Drawer(),
        body: SafeArea(child: pages[myIndex]),
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 208, 16, 225),
                Color.fromARGB(255, 11, 36, 197)
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.8],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 3, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  myIndex = index;
                });
              },
              currentIndex: myIndex,
              backgroundColor: Colors.transparent,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor: Colors.white,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/logo/diet.png",
                    width: 50,
                    height: 50,
                  ),
                  label: 'Diet',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/logo/dumbell.png",
                    width: 50,
                    height: 50,
                  ),
                  label: 'exercise',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/logo/progress.png",
                    width: 40,
                    height: 40,
                  ),
                  label: 'progress',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
