import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:storefadhellya/listuser.dart';

class UpdateData extends StatefulWidget {
  final String id;
  final String username;
  final String email;
  final String phone;
  final String password;

  const UpdateData({
    Key? key,
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  }) : super(key: key);

  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.username;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    _passwordController.text = widget.password;
  }

  Future<void> _updateDataUser() async {
    String url = "https://fadhellya.000webhostapp.com/updateuser.php";

    try {
      var response = await http.post(Uri.parse(url), body: {
        "id": widget.id,
        "username": _usernameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "password": _passwordController.text
      });

      // Tambahkan penanganan respons dari server sesuai kebutuhan Anda

      // Setelah berhasil memperbarui data, kembali ke halaman sebelumnya (listuser.dart)
      Navigator.pop(context);
    } catch (exc) {
      print(exc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update User", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  "Form Update User",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.person),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Masukkan Username",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.lock),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Masukkan Password Baru",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: TextField(
                  controller: _emailController,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.mail),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Email Address",
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Masukkan Email",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    prefixIcon: Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.phone),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Phone",
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Masukkan Nomor Telepon",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _updateDataUser();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                      (route) => false);
                },
                child: Text(
                  "UPDATE USER",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
