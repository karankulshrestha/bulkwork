import 'package:bulkwork/src/pages/diet/metric_widget.dart';
import 'package:bulkwork/src/widgets/muscle_btn.dart';
import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  final String image, title;
  const RecipeWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 120,
      width: 350,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 18, 18, 155),
              Color.fromARGB(255, 134, 19, 138),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image,
              height: image == 'assets/logo/d1.png' ? 100 : 150, width: 150),
          Container(
            height: 50,
            width: 180,
            child: MuscleBtn(muscle: title, Btn: () {}),
          ),
        ],
      ),
    );
  }
}

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 50),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 32, 32, 249),
                        Color.fromARGB(255, 246, 36, 253),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    MetricWidget(
                      name: "Calories",
                      current: 2100,
                      total: 3000,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MetricWidget(
                      name: "Protein",
                      current: 36,
                      total: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: 120,
            width: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 32, 32, 249),
                    Color.fromARGB(255, 246, 36, 253),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/recipe.png',
                  height: 150,
                  width: 150,
                ),
                MuscleBtn(
                    muscle: "Show Recipes",
                    Btn: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor:
                            const Color.fromARGB(255, 253, 253, 252),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 500,
                            child: Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    RecipeWidget(
                                      image: 'assets/logo/d1.png',
                                      title: "Bulking Recipes",
                                    ),
                                    RecipeWidget(
                                      image: 'assets/logo/d2.png',
                                      title: "Cutting Recipes",
                                    ),
                                    RecipeWidget(
                                      image: 'assets/logo/d3.png',
                                      title: "Research Articles",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
