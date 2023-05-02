import 'package:flutter/material.dart';
import '../heper/firestore_helper.dart';

class UserAdd extends StatefulWidget {
  const UserAdd({Key? key}) : super(key: key);

  @override
  State<UserAdd> createState() => _UserAddState();
}

class _UserAddState extends State<UserAdd> {
  String? name, position, number,experience;
  int? age;

  final GlobalKey<FormState> userKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController expController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.indigo.shade900,
          elevation: 0,
          title: const Text(""),
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
                  padding: EdgeInsets.all(20),
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
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: nameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please enter this name";
                            }
                          },
                          onSaved: (val) {
                            name = val;
                          },
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
                          controller: ageController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please enter this name";
                            }
                          },
                          onSaved: (val) {
                            age = int.parse(val!);
                          },
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
                          controller: positionController,
                          onSaved: (val) {
                            position = val;
                          },
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
                          controller: expController,
                          onSaved: (val) {
                            experience = val;
                          },
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
                          controller: numberController,
                          onSaved: (val) {
                            number = val;
                          },
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

                              await FireStoreHelper.fireStoreHelper.addUser(
                                  name: name!,
                                  age: age!,
                                  experience: experience!,
                                  number: number!,
                                  position: position!);

                              Navigator.of(context).pop();

                              nameController.clear();
                              ageController.clear();
                              positionController.clear();
                              expController.clear();
                              numberController.clear();

                              setState(() {
                                name = null;
                                age = null;
                                position = null;
                                experience = null;
                                number = null;
                              });
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
        )
        // Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: Form(
        //     key: notesKey,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Row(
        //           children: [
        //             Text(
        //               currentDate = "${date.day}/${date.month}/${date.year}",
        //               style: const TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 20,
        //               ),
        //             ),
        //             const Text(
        //               " - ",
        //               style: TextStyle(
        //                 fontSize: 20,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             Text(
        //               currentTime = "${date.hour} : ${date.minute}",
        //               style: const TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 20,
        //               ),
        //             ),
        //           ],
        //         ),
        //         TextFormField(
        //           controller: titleController,
        //           onSaved: (val) {
        //             name = val;
        //           },
        //           style: const TextStyle(
        //             fontSize: 25,
        //             color: Colors.white,
        //           ),
        //           textInputAction: TextInputAction.next,
        //           cursorColor: Colors.white,
        //           decoration: const InputDecoration(
        //             border: InputBorder.none,
        //             hintText: "Name",
        //             hintStyle: TextStyle(
        //               fontSize: 30,
        //               color: Color(
        //                 0xff8F9398,
        //               ),
        //             ),
        //           ),
        //         ),
        //         TextFormField(
        //           controller: subTitleController,
        //           validator: (val) {
        //             if (val!.isEmpty) {
        //               return "please enter notes";
        //             }
        //           },
        //           onSaved: (val) {
        //             age = int.parse(val!);
        //           },
        //           style: const TextStyle(
        //             fontSize: 20,
        //             color: Colors.white,
        //           ),
        //           cursorColor: Colors.white,
        //           maxLines: null,
        //           // expands: true,
        //           keyboardType: TextInputType.multiline,
        //           decoration: const InputDecoration(
        //             border: InputBorder.none,
        //             errorBorder: InputBorder.none,
        //             hintText: "Age",
        //             hintStyle: TextStyle(
        //               fontSize: 25,
        //               color: Color(
        //                 0xff8F9398,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
