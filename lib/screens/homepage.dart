import 'package:flutter/material.dart';

import 'global.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade900,
          title: Text(
            'Firebase',
            style: TextStyle(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('user_page');
                    setState(() {
                      Global.all = Global.admin;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: h / 5,
                    width: w / 2.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo.shade900,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Admin",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey.shade200,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('user_page');
                    setState(() {
                      Global.all = Global.manager;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: h / 5,
                    width: w / 2.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo.shade900,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Manager",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey.shade200,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('user_page');
                    setState(() {
                      Global.all = Global.clerk;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: h / 5,
                    width: w / 2.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo.shade900,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Clerk",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey.shade200,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('user_page');
                    setState(() {
                      Global.all = Global.employee;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: h / 5,
                    width: w / 2.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo.shade900,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Employee",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey.shade200,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
        // SafeArea(
        //   child: Align(
        //     alignment: Alignment.center,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         ElevatedButton(onPressed: (){
        //           Navigator.of(context).pushNamed('admin1');
        //           setState(() {
        //             Global.all=Global.admin;
        //           });
        //         }, child: Text("Admin"),),
        //         ElevatedButton(onPressed: (){
        //           Navigator.of(context).pushNamed('admin1');
        //           setState(() {
        //             Global.all=Global.manager;
        //           });
        //         }, child: Text("Manager"),),
        //         ElevatedButton(onPressed: (){
        //           Navigator.of(context).pushNamed('admin1');
        //           setState(() {
        //             Global.all=Global.clerk;
        //           });
        //         }, child: Text("Clerk"),),
        //         ElevatedButton(onPressed: (){
        //           Navigator.of(context).pushNamed('admin1');
        //           setState(() {
        //             Global.all=Global.employee;
        //           });
        //         }, child: Text("Employee"),),
        //       ],
        //     ),
        //   ),),
        );
  }
}
