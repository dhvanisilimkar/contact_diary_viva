import 'dart:ui';
import 'package:contact_diary_viva/utils/rautes_page.dart';
import 'package:contact_diary_viva/views/screens/add_contact_page.dart';
import 'package:contact_diary_viva/views/screens/splesh_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

import 'modals/globals.dart';
import 'modals/modals.dart';

void main() => runApp(
      Myapp(),
    );

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool isGrid = false;
  bool isdark = false;
  bool black = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              // color: Colors.grey.shade300,
              fontWeight: FontWeight.bold,
            ),
          ),
          brightness: Brightness.dark,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        themeMode: isdark ? ThemeMode.dark : ThemeMode.light,
        darkTheme: ThemeData(
          useMaterial3: true,
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Colors.grey,
            ),
          ),
        ),
        initialRoute: MyRoutes.splashScreen,
        routes: {
          MyRoutes.add_contact_page: (context) => AddContact(),
          MyRoutes.splashScreen: (contact) => SplashScreen(),
          // MyRoutes.splashScreen : (contact) => (),
          MyRoutes.home: (context) => Builder(builder: (contact) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      "Your  Contact ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 34,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isdark = !isdark;
                          });
                        },
                        icon: Icon(
                          isdark
                              ? Icons.lightbulb_circle_outlined
                              : Icons.dark_mode_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(Icons.more_vert_sharp),
                      ),
                    ],
                    centerTitle: true,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: Globals.allContacts.length,
                      itemBuilder: (context, index) => Slidable(
                        closeOnScroll: true,
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (val) async {
                                Uri uri = Uri(
                                  scheme: 'tel',
                                  path: Globals.allContacts[index].contact,
                                );
                                await launchUrl(uri);
                              },
                              icon: Icons.call,
                              backgroundColor: Colors.green,
                            ),
                            SlidableAction(
                              onPressed: (val) async {
                                await Navigator.of(context).pushNamed(
                                    MyRoutes.edit_page,
                                    arguments: index);
                                setState(() {});
                              },
                              icon: Icons.edit,
                              backgroundColor: Colors.blue,
                            ),
                          ],
                        ),
                        child: ListTile(
                          onTap: () async {
                            await Navigator.of(context).pushNamed(
                                MyRoutes.details_page,
                                arguments: index);
                            setState(() {});
                          },
                          title: Text(
                            "${Globals.allContacts[index].firstName} ${Globals.allContacts[index].lastName}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: CircleAvatar(
                            foregroundImage:
                                FileImage(Globals.allContacts[index].image!),
                          ),
                          subtitle:
                              Text("${Globals.allContacts[index].contact}"),
                          trailing: IconButton(
                            onPressed: () async {
                              Uri uri = Uri(
                                scheme: 'tel',
                                path: Globals.allContacts[index].contact,
                              );
                              await launchUrl(uri);
                            },
                            icon: Icon(Icons.phone),
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () async {
                      await Navigator.of(context).pushNamed(
                        MyRoutes.add_contact_page,
                      );
                      setState(() {});
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                );
              }),
        });
  }
}
