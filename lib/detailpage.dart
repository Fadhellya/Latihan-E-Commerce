import 'package:flutter/material.dart';
import 'package:storefadhellya/items.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, @required this.selfIndex});
  final selfIndex;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
        ],
      ),
      body: Column(children: [
        Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              items[widget.selfIndex][0],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Stack(
            children: [
              Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  items[widget.selfIndex][1],
                  scale: 0.2,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          items[widget.selfIndex][2],
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Size Options",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButton(
                items: const [
                  DropdownMenuItem(
                    value: 5,
                    child: Text(
                      "S",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 10,
                    child: Text(
                      "M",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 10,
                    child: Text(
                      "L",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {});
                },
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: const Text(
              "ADD TO CART",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
        )
      ]
      ),
    );
  }
}
