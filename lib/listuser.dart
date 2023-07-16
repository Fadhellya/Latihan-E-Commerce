import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storefadhellya/insertuser.dart';
import 'package:storefadhellya/updateuser.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listDataUser = [];

  Future<void> getDataUser() async {
    String url = "https://fadhellya.000webhostapp.com/viewuser.php";
    try {
      var response = await http.get(Uri.parse(url));
      listDataUser = jsonDecode(response.body);
      setState(() {
        listDataUser = jsonDecode(response.body);
      });
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> deleteDataUser(String id) async {
    String url = "https://fadhellya.000webhostapp.com/deleteuser.php";

    try {
      var uriparam = await http.post(Uri.parse(url), body: {"id": id});
      var response = jsonDecode(uriparam.body);
      if (response["succes"] == "true") {
        print("Delete data user berhasil");
        getDataUser();
      } else {
        print("Delete data user gagal");
      }
    } catch (exc) {
      print(exc);
    }
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data User"),
      ),
      body: ListView.builder(
        itemCount: listDataUser.length,
        itemBuilder: ((context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(
                CupertinoIcons.person_2_alt,
                color: Colors.orangeAccent,
                size: 18,
              ),
              title: Text(listDataUser[index]["username"],
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              subtitle: Text(listDataUser[index]["email"],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.delete_solid),
                    onPressed: () {
                      deleteDataUser(listDataUser[index]["id"]);
                    },
                    iconSize: 18,
                    color: Colors.orange,
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.arrow_down_circle_fill),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdateData(
                          id: listDataUser[index]["id"],
                          username: listDataUser[index]["username"],
                          email: listDataUser[index]["email"],
                          phone: listDataUser[index]["phone"],
                          password: listDataUser[index]["password"],
                        ),
                      ));
                    },
                    iconSize: 18,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => InsertData()));
        },
        splashColor: Colors.red,
        backgroundColor: Colors.red.shade200,
        mini: true,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
