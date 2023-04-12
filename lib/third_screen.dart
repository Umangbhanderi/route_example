import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  dynamic data;
  ThirdScreen({super.key, this.data});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.data['new'].toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.data['new'].toString()),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: const Text("back Screen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
