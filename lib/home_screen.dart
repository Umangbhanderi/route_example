import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:route_example/Utils/routes_name.dart';
import 'package:http/http.dart' as http;

import 'models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data;
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    print('ResponseOf API$response');
    data = jsonDecode(response.body.toString());

    //  print(data);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.secondScreen,
                    arguments: {
                      "Node": data,
                      "Flutter": "good for App",
                    });
              },
              icon: const Icon(Icons.next_plan))
        ],
        title: const Text("Home Screen"),
      ),
      body: FutureBuilder(
        future: getPostApi(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ID : ${postList[index].title}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Body :  ${postList[index].body}",
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RoutesName.secondScreen,
                                arguments: {
                                  "Node": data,
                                  "Flutter": "good for App",
                                });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          child: const Text("Second Screen"),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
