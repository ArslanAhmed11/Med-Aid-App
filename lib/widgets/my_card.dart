import 'package:flutter/material.dart';
import 'package:health_connect/networking.dart';
import 'package:health_connect/personal_chat.dart';

class MyCard extends StatelessWidget {
  MyCard({required this.data, required this.show});

  Map<dynamic, dynamic> data;
  int show;

  @override
  Widget build(BuildContext context) {
    String duration;
    print(data);
    DateTime createdAt = DateTime.parse(data['createdAt']);
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(createdAt);
    if (difference.inDays > 0) {
      duration = '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      duration = '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      duration = '${difference.inMinutes} minutes ago';
    } else {
      duration = '${difference.inSeconds} seconds ago';
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          if (show == 1)
            showDialog(
                builder: (context) => AlertBox(
                      data: data,
                    ),
                context: context);
          else {
            showDialog(
                builder: (context) => AlertBox2(
                      data: data,
                    ),
                context: context);
          }
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 8,
          child: Container(
            height: MediaQuery.of(context).size.height / 3.75,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/img2.jpg"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data["name"],
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xFFB32525)),
                      ),
                      Expanded(
                        child: Text(
                          duration,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFFB32525)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Row(
                        children: [
                          Image(image: AssetImage("images/2.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            data["location"],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xFFB32525)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Row(
                        children: [
                          Image(image: AssetImage("images/3.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            data["description"],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xFFB32525)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Row(
                        children: [
                          Image(image: AssetImage("images/1.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            data["quantity"],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xFFB32525)),
                          ),
                        ],
                      ),
                    ),
                    data["bType"] == "Type"
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            child: Row(
                              children: [
                                Image(image: AssetImage("images/4.png")),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  data["bType"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(0xFFB32525)),
                                ),
                              ],
                            ),
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlertBox extends StatelessWidget {
  AlertBox({required this.data});

  Map<dynamic, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Do you want to respond to this request? "),
      content: Container(
        height: MediaQuery.of(context).size.height / 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                String id = await start_chat(data["createdBy"]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonalChat(
                              id: id,
                              user_id: data["createdBy"],
                              user_name: data["name"],
                            )));
                // await create_request(location, need, type, count.toString(), description);
                // Navigator.push(context, MaterialPageRoute(builder: (context)  => HomePage()));
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                        child: Text(
                      "Yes, I want to",
                      style: TextStyle(fontSize: 20),
                    )),
                  )),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
                backgroundColor: MaterialStateProperty.all(Color(0xFFFB4B4B)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // await create_request(location, need, type, count.toString(), description);
                // Navigator.push(context, MaterialPageRoute(builder: (context)  => HomePage()));
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                        child: Text(
                      "No, Sorry I can't",
                      style: TextStyle(fontSize: 20, color: Color(0xFFB32525)),
                    )),
                  )),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Color(0xFFB32525))),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlertBox2 extends StatelessWidget {
  AlertBox2({required this.data});

  Map<dynamic, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Mark the Request Complete ? "),
      actions: [
        TextButton(
            onPressed: () async {
              await update_request(data["_id"]);
              Navigator.pop(context);
            },
            child: Text("YES")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("NO"))
      ],
    );
  }
}
