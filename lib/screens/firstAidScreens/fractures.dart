import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Fractures extends StatefulWidget {
  const Fractures({Key? key}) : super(key: key);

  @override
  State<Fractures> createState() => _FracturesState();
}

class _FracturesState extends State<Fractures> {
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
          Image(image: AssetImage("images/fracture.png")),
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
                      "Fractures",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFB32525),
                          fontWeight: FontWeight.bold),
                    ),
                    Text("\n"),
                    Text(
                      "It can be difficult to tell if a person has a broken bone or a joint, as opposed to a simple muscular injury. If you're in any doubt, treat the injury as a broken bone ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("\n"),
                    Text("Symptoms",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFB32525),
                            fontWeight: FontWeight.bold)),
                    Text("\n"),
                    Text("*  Sudden pain", style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("*  Unable to bear weight",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("* Swelling", style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("* Obvious deformity", style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("* Warmth, bruising, or redness",
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
                        "Support the injured part of the patient (use padding for extra support",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 2",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Apply pressure around the wound and not over the bone",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 3",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Apply pressure around the wound and not over the bone",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                      child: ElevatedButton(
                          onPressed: () {
                            const url = "https://youtu.be/BDrdDbHsalQ";
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
