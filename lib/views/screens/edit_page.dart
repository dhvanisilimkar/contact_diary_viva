import 'dart:io';
import 'package:contact_diary_viva/views/components/myBackebatton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../modals/globals.dart';
import '../../modals/modals.dart';

class EditContact extends StatefulWidget {
  const EditContact({Key? key}) : super(key: key);

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
        title: const Text(
          "Add",
          style: TextStyle(
            color: Color(0xff7d8c93),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment(0.35, 0.40),
                  children: [
                    Container(
                      height: s.height * 0.2,
                      width: s.width,
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60,
                        foregroundImage: Globals.allContacts[i].image != null
                            ? FileImage(Globals.allContacts[i].image!)
                            : null,
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton.small(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Select Method !!"),
                            actions: [
                              TextButton.icon(
                                onPressed: () async {
                                  Navigator.of(context).pop();

                                  XFile? img = await picker.pickImage(
                                      source: ImageSource.camera);

                                  if (img != null) {
                                    setState(() {
                                      Globals.allContacts[i].image =
                                          File(img.path);
                                    });
                                  }
                                },
                                label: Text("Camera"),
                                icon: Icon(Icons.camera_alt),
                              ),
                              TextButton.icon(
                                onPressed: () async {
                                  Navigator.of(context).pop();

                                  XFile? img = await picker.pickImage(
                                      source: ImageSource.gallery);

                                  if (img != null) {
                                    setState(() {
                                      Globals.allContacts[i].image =
                                          File(img.path);
                                    });
                                  }
                                },
                                label: Text("Gallery"),
                                icon: Icon(Icons.image),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: s.height * 0.02,
                    ),
                    Text(
                      "First Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: s.height * 0.01,
                    ),
                    TextFormField(
                      initialValue: Globals.allContacts[i].firstName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        hintText: "Enter First Name",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      onChanged: (val) {
                        Globals.allContacts[i].firstName = val;
                      },
                    ),
                    SizedBox(
                      height: s.height * 0.02,
                    ),
                    Text(
                      "Last Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: s.height * 0.01,
                    ),
                    TextFormField(
                      initialValue: Globals.allContacts[i].lastName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        hintText: "Enter Last Name",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      onChanged: (val) {
                        Globals.allContacts[i].lastName = val;
                      },
                    ),
                    SizedBox(
                      height: s.height * 0.02,
                    ),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: s.height * 0.01,
                    ),
                    TextFormField(
                      initialValue: Globals.allContacts[i].contact,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        hintText: "+91 8160840581",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      onChanged: (val) {
                        Globals.allContacts[i].contact = val;
                      },
                    ),
                    SizedBox(
                      height: s.height * 0.02,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: s.height * 0.01,
                    ),
                    TextFormField(
                      initialValue: Globals.allContacts[i].email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        hintText: "samir@gmail.com",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      onChanged: (val) {
                        Globals.allContacts[i].email = val;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
