import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../heper/firestore_helper.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({Key? key}) : super(key: key);

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  Map<Object, Object> newData = {};


  final GlobalKey<FormState> userKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    QueryDocumentSnapshot data =
        ModalRoute.of(context)!.settings.arguments as QueryDocumentSnapshot;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade900,
        ),
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
          child: Form(
            key: userKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade900,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (val) {
                            newData['name'] = val;
                          },
                          initialValue: data['name'],
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.indigo.shade900,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Name",
                            prefixIcon: Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade900,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          onChanged: (val) {
                            newData['age'] = val;
                          },
                          initialValue: data['age'].toString(),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.indigo.shade900,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Age",
                            prefixIcon: Icon(
                              Icons.cake,
                              size: 30,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade900,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          // onSaved: (val) {
                          //   position = val;
                          // },
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.indigo.shade900,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Position",
                            prefixIcon: Icon(
                              Icons.manage_accounts,
                              size: 30,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade900,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          // onSaved: (val) {
                          //   experience = int.parse(val!);
                          // },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.indigo.shade900,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(7),
                            border: const OutlineInputBorder(),
                            suffixText: "Year",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Experience",
                            prefixIcon: Icon(
                              Icons.person_add,
                              size: 30,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade900,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          // onSaved: (val) {
                          //   number = val;
                          // },
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.indigo.shade900,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Contact Number",
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 30,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (userKey.currentState!.validate()) {
                              userKey.currentState!.save();

                              await FireStoreHelper.fireStoreHelper.editUser(
                                id: data['id'].toString(),
                                data: newData,
                              );
                              print("==================================");
                              print(data);
                              print("==================================");

                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
