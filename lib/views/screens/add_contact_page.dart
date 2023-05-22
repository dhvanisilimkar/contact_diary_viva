import 'dart:io';
import 'package:contact_diary_viva/modals/globals.dart';
import 'package:contact_diary_viva/views/components/myBackebatton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../modals/modals.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  String? firstName;
  String? lastName;
  String? contact;
  String? email;
  File? image;

  ImagePicker picker = ImagePicker();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(),
        actions: [
          IconButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                Globals.allContacts.add(
                  Contacts(
                    firstName: firstName!,
                    lastName: lastName!,
                    contact: contact!,
                    email: email!,
                    image: image!,
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  mySnackBar(text: "Successful!!", color: Colors.green),
                );

                Navigator.of(context).pop();
              }
            },
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
        title: const Text(
          "Add",
          style: TextStyle(
            color: Colors.grey,
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
            key: formkey,
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
                        foregroundImage:
                            image != null ? FileImage(image!) : null,
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
                                      image = File(img.path);
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
                                      image = File(img.path);
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
                        color: Colors.black,
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
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter the Name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        firstName = val!;
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
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter the Name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        lastName = val;
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        hintText: "+91 6352036854",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter the Name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        contact = val;
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        hintText: "dhvani@gmail.com",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter the Name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        email = val;
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
