import 'package:bulkwork/src/pages/progress/graph_btn.dart';
import 'package:bulkwork/src/pages/progress/line_chart.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final VoidCallback addy;
  const CustomDialog({super.key, required this.title, required this.addy});

  @override
  Widget build(BuildContext context) {
    TextEditingController _exController = new TextEditingController();
    TextEditingController dateController = new TextEditingController();

    return AlertDialog(
      scrollable: true,
      title: Text(title),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _exController,
                decoration: InputDecoration(
                  labelText: 'Metric',
                ),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  print(pickedDate!.day);
                },
              )
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(child: Text("Submit"), onPressed: () => {}),
      ],
    );
  }
}

class GraphScreen extends StatefulWidget {
  final String name;
  GraphScreen({super.key, required this.name});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 32, 79, 221),
              Color.fromARGB(255, 236, 65, 211),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
        children: [
          LineChartWidget(),
          SizedBox(
            height: 40,
          ),
          GraphButton(
              title: "Add New Point",
              func: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog(title: "Add the Metric", addy: () {});
                    });
              })
        ],
      ),
    )));
  }
}
