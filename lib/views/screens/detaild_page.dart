import 'package:contact_diary_viva/utils/rautes_page.dart';
import 'package:contact_diary_viva/views/components/myBackebatton.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modals/globals.dart';

class Details_page extends StatefulWidget {
  const Details_page({Key? key}) : super(key: key);

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(),
        title: const Text(
          "Contacts",
          style: TextStyle(
            color: Color(0xff7d8c93),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: s.height * 0.08,
            ),
            Container(
              height: s.height * 0.2,
              width: s.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 70,
                    foregroundImage: FileImage(Globals.allContacts[i].image!),
                  ),
                  SizedBox(
                    width: s.width * 0.03,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                        Globals.allContacts.removeAt(i);
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 35,
                        color: Color(0xff7d8c93),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(MyRoutes.details_page, arguments: i);
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 25,
                        color: Color(0xff7d8c93),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Text(
              "${Globals.allContacts[i].firstName} ${Globals.allContacts[i].lastName}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "+91 ${Globals.allContacts[i].contact}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            Divider(),
            SizedBox(
              height: s.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    Uri uri = Uri(
                      scheme: 'tel',
                      path: Globals.allContacts[i].contact,
                    );
                    await launchUrl(uri);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.green,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    Uri uri = Uri(
                      scheme: 'sms',
                      path: Globals.allContacts[i].contact,
                    );
                    await launchUrl(uri);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.sms,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.amber,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    Uri uri = Uri(
                      scheme: 'mailto',
                      path: Globals.allContacts[i].email,
                    );
                    await launchUrl(uri);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.blue,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Share.share(
                        "Name: ${Globals.allContacts[i].firstName}\nContact: ${Globals.allContacts[i].contact}");
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xff7d8c93),
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
