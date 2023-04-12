import 'package:flutter/material.dart';
import 'package:route_example/Utils/routes_name.dart';

class SecondScreen extends StatefulWidget {
  dynamic data;
  SecondScreen({
    super.key,
    required this.data,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // print(widget.data['Node']);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.thirdScreen,
                    arguments: {
                      "new": widget.data.toString(),
                    });
              },
              icon: const Icon(Icons.next_plan))
        ],
        title: Text(widget.data["Flutter"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.data['Node'].toString()),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.thirdScreen,
                      arguments: {
                        "new": widget.data.toString(),
                      });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: const Text("Third Screen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
