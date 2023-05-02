import 'package:flutter/material.dart';

import '../heper/firestore_helper.dart';
import 'global.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List data = [];
  Map<Object, Object> editValue = {};

  String? title;
  String? subTitle;

  // final GlobalKey<FormState> notesKey = GlobalKey<FormState>();
  //
  // final TextEditingController titleController = TextEditingController();
  // final TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "${Global.all} Detail",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade200,
            fontFamily: "Poppins",
          ),
        ),
        backgroundColor: Colors.indigo.shade900,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: StreamBuilder(
            stream: FireStoreHelper.fireStoreHelper.getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error :- ${snapshot.error} ",
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              } else if (snapshot.hasData) {
                data = snapshot.data!.docs;

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    print("=======================================");

                    return Card(
                      elevation: 3,
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.all(5),
                        title: Text(
                          data[i]['name'],
                        ),
                        subtitle: Text(
                          "Age : ${data[i]['age']}".toString(),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('user_edit', arguments: data[i]);
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue.shade800,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Are You Sure Delete this User??",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.indigo.shade800,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigo.shade800,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.indigo.shade900),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              FireStoreHelper.fireStoreHelper
                                                  .removeUser(
                                                      id: data[i]['id']);
                                            },
                                            child: const Text(
                                              "Delete",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red.shade800,
                              ),
                            ),
                          ],
                        ),
                        children: [
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Number : ${data[i]['number']}"),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Position : ${data[i]['position']}"),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo.shade200,
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed('user_add');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
