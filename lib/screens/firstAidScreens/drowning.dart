import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Drowning extends StatefulWidget {
  const Drowning({Key? key}) : super(key: key);

  @override
  State<Drowning> createState() => _DrowningState();
}

class _DrowningState extends State<Drowning> {
  launchURL(String URL) async {
    final Uri url = Uri.parse(URL);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFFBEAEA),
      body: Column(
        children: [
          Image(image: AssetImage("images/drowning.png")),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
              ),
              // padding: const EdgeInsets.all(16.0),
              // width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,

              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: ListView(
                  children: [
                    Text(
                      "Drowning",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFB32525),
                          fontWeight: FontWeight.bold),
                    ),
                    Text("\n"),
                    Text(
                      "Drowning is a type of suffocation induced by the submersion or immersion of the mouth and nose in a liquid. Most instances of fatal drowning occur alone or in situations where others present are either unaware of the victim's situation or unable to offer assistance ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("\n"),
                    Text("Symptoms",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFB32525),
                            fontWeight: FontWeight.bold)),
                    Text("\n"),
                    Text("*  Unconsciousness", style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("*  Cold or bluish skin",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("* Shortness or lack of breath",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Immediate steps to be taken",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFB32525),
                            fontWeight: FontWeight.bold)),
                    Text("\n"),
                    Text("Step 1",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Place the heel of your hand on the breastbone at the centre of the person’s chest. Place your other hand on top of your first hand and interlock your fingers",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 2",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Position yourself with your shoulders above your hands",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 3",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Using your body weight (not just your arms), press straight down by 5-6cm (2-2.5 inches) on their chest",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 4",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Keeping your hands on their chest, release the compression and allow the chest to return to its original position",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 5",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Repeat these compressions at a rate of 100 to 120 times per minute until an ambulance arrives or you become exhausted",
                        style: TextStyle(fontSize: 18)),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                      child: ElevatedButton(
                          onPressed: () {
                            const url =
                                "https://www.youtube.com/watch?v=-Yqk5cHXsko";
                            launchURL(url);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFFF2626)),
                          ),
                          child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Center(
                                  child: Text(
                                "Watch Video here",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              )))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
