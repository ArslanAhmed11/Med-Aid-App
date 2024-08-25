import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_connect/networking.dart';
import 'package:health_connect/personal_chat.dart';
import 'package:health_connect/screens/profile_screen.dart';

class ChatScreen extends StatefulWidget {
  String userEmail, userPassword;

  ChatScreen({required this.userEmail, required this.userPassword});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<dynamic> data = [];

  Future sol(String email, String password) async {
    await log_in(email, password);
    data = await get_user_chat();
  }

  var userData;
  Future get_user_data(String email, String password) async {
    userData = await log_in(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await get_user_data(widget.userEmail, widget.userPassword);
                  String userName = userData[1]["userObject"]["name"];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(
                              name: userName, email: widget.userEmail)));
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/img2.jpg"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Chat Room",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFE8383),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalChat(
                                          id: data[index]["chatId"],
                                          user_id: data[index]["toId"],
                                          user_name: data[index]["name"],
                                        )));
                          },
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("images/img2.jpg"),
                          ),
                          title: Text(data[index]["name"]),
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            print(snapshot.connectionState);
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          future: sol(widget.userEmail, widget.userPassword),
        ),
      ),
    );
  }
}
