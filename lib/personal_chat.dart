import 'package:flutter/material.dart';
import 'package:health_connect/networking.dart';

class PersonalChat extends StatefulWidget {
  PersonalChat(
      {required this.id, required this.user_id, required this.user_name});

  String id;
  String user_id;
  String user_name;

  @override
  _PersonalChatState createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  List<dynamic> data = [];
  String message = "";

  Future sol() async {
    data = await get_chat(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFDD3E3E),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/img2.jpg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.user_name,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)),
                child: FutureBuilder(
                  builder: (context, snapshots) {
                    if (snapshots.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        (data[index]["byId"] == widget.user_id)
                                            ? Colors.blue
                                            : Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  child: Text(
                                    data[index]["text"],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            );
                          });
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  future: sol(),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  onChanged: (value) {
                    message = value;
                  },
                  style: TextStyle(color: Colors.white),
                  controller: fieldText,
                  decoration: InputDecoration(
                    hintText: "Type text here ...",
                    filled: true,
                    fillColor: Color(0xFFDD3E3E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () async {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      super.widget));
                          await send_chat(widget.user_id, message);
                        }),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
