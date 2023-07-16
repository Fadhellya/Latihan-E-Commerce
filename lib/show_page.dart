import 'package:flutter/material.dart';
import 'package:storefadhellya/detailpage.dart';
import 'items.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share, color: Colors.black, size: 30)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart,
                  color: Colors.black, size: 30)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.black, size: 30)),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Products List",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: (1 / 1.2),
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(
                      selfIndex: index,
                    ),
                  ));
                },
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(items[index][1], scale: 0.7),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          items[index][0],
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade800),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            items[index][3],
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          items[index][2],
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
