import 'package:bulkwork/src/features/authentication/screens/signin_screen.dart';
import 'package:bulkwork/src/methods/reset_full_gym_exercise.dart';
import 'package:bulkwork/src/pages/screens/diet_screen.dart';
import 'package:bulkwork/src/pages/screens/exercise_screen.dart';
import 'package:bulkwork/src/pages/screens/progress_screen.dart';
import 'package:bulkwork/src/widgets/muscle_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bulkwork/src/methods/get_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 1;
  late List user = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    user = [];
    getUser();
  }

  void getUser() async {
    try {
      setState(() {
        isLoading = true;
      });
      List temp = await UserData().getUserDetails();
      setState(() {
        user = temp;
      });
      setState(() {
        isLoading = false;
      });
      print(temp);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
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
    List<Widget> pages = [
      DietScreen(
        height: user.length == 0 ? "" : user[0]["height"]!,
        weight: user.length == 0 ? "" : user[0]["weight"]!,
        age: user.length == 0 ? "" : user[0]["age"]!,
        gender: user.length == 0 ? "" : user[0]["gender"]!,
      ),
      ExerciseScreen(),
      ProgressScreen()
    ];

    return SafeArea(
      child: WillPopScope(
        onWillPop: _onPop,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text("Welcome"),
            backgroundColor: Color.fromARGB(255, 9, 18, 145),
          ),
          backgroundColor: Colors.white,
          endDrawer: Drawer(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 8, 36, 120),
                    Color.fromARGB(255, 166, 14, 172),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.decal,
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 226, 226),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 75, 180, 236),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            FirebaseAuth.instance.currentUser?.email ?? "",
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Color.fromARGB(255, 75, 180, 236),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 249, 249),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: isLoading == true
                        ? CircularProgressIndicator(
                            color: Color.fromARGB(255, 233, 22, 244),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MuscleBtn(
                                muscle: user[0]["height"] + " cm",
                                Btn: () {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Age",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MuscleBtn(
                                muscle: user[0]["age"] + " years",
                                Btn: () {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Weight",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MuscleBtn(
                                muscle: user[0]["weight"] + " kg",
                                Btn: () {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Body fat",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                                width: 100,
                              ),
                              MuscleBtn(
                                muscle: user[0]["fat"],
                                Btn: () {},
                              ),
                            ],
                          ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MuscleBtn(
                      muscle: "Logout",
                      Btn: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SignIn(),
                            ),
                            (Route<dynamic> route) => false);
                      })
                ],
              ),
            ),
          ),
          body: isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                )
              : SafeArea(child: pages[myIndex]),
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
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 3, blurRadius: 10),
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
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: myIndex == 0
                        ? Opacity(
                            opacity: 0.7,
                            child: Image.asset(
                              "assets/logo/diet.png",
                              width: 50,
                              height: 50,
                              color: Color.fromARGB(255, 207, 209, 218),
                            ),
                          )
                        : Image.asset(
                            "assets/logo/diet.png",
                            width: 50,
                            height: 50,
                          ),
                    label: 'Diet',
                  ),
                  BottomNavigationBarItem(
                    icon: myIndex == 1
                        ? Opacity(
                            opacity: 0.7,
                            child: Image.asset(
                              "assets/logo/dumbell.png",
                              width: 50,
                              height: 50,
                            ),
                          )
                        : Image.asset(
                            "assets/logo/dumbell.png",
                            width: 50,
                            height: 50,
                          ),
                    label: 'exercise',
                  ),
                  BottomNavigationBarItem(
                    icon: myIndex == 2
                        ? Opacity(
                            opacity: 0.7,
                            child: Image.asset(
                              "assets/logo/progress.png",
                              width: 40,
                              height: 40,
                            ),
                          )
                        : Image.asset(
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
      ),
    );
  }
}
