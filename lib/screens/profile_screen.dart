import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_connect/screens/details.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({required this.name, required this.email});

  String name;
  String email;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String age = '', gender = '', bloodgroup = '', phoneNo = '';
  List<String> details = [];
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFFFB4B4B),
            child: FaIcon(FontAwesomeIcons.penToSquare),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () async {
              details = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Details()));
              print(details);

              setState(() {
                phoneNo = details[0];
                age = details[1];
                gender = details[2].trim();
                bloodgroup = details[3].trim();
                print(phoneNo);
                print(age);
                print(gender);
                print(bloodgroup);
              });
            },
          ),
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width / 8),
                        decoration: BoxDecoration(
                            color: Color(0xFFFB4B4B),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30))),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 11,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 8,
                          backgroundImage: AssetImage("images/img2.jpg"),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(
                      "Personal Info",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.user,
                            color: Colors.red,
                          ),
                          title: Text(widget.name),
                        ),
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.envelope,
                            color: Colors.red,
                          ),
                          title: Text(widget.email),
                        ),
                        ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.phone,
                            color: Colors.red,
                          ),
                          title: Text(phoneNo),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.male,
                            color: Colors.red,
                            size: 35,
                          ),
                          title: Text(gender),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.red,
                            size: 35,
                          ),
                          title: Text(age),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.water_drop,
                            color: Colors.red,
                            size: 35,
                          ),
                          title: Text(bloodgroup),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     children: [
                  //       FaIcon(FontAwesomeIcons.user,color: Colors.blue,),
                  //       Text(""),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ],
          )),
    );
  }
}
