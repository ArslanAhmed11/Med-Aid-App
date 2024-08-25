import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BeeSting extends StatefulWidget {
  const BeeSting({Key? key}) : super(key: key);

  @override
  State<BeeSting> createState() => _BeeStingState();
}

class _BeeStingState extends State<BeeSting> {
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
          Image(image: AssetImage("images/beesting.png")),
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
                      "Bee Sting",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFB32525),
                          fontWeight: FontWeight.bold),
                    ),
                    Text("\n"),
                    Text(
                      "A bee sting is the wound and pain caused by the stinger of a female bee puncturing skin. Bee stings differ from insect bites, with the venom of stinging insects having considerable chemical variation. The reaction of a person to a bee sting may vary according to the bee species ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("\n"),
                    Text("Symptoms",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFB32525),
                            fontWeight: FontWeight.bold)),
                    Text("\n"),
                    Text("*  Instant, sharp burning pain at the sting site",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("*  A red welt at the sting area",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("* Slight swelling around the sting area",
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
                        "Take the stinger out as fast as you can. Because stinger will be woking up to 10 min after stung",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 2",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Wash it with soap. Soap can prevent contamination of bacterial from soil and bees. It’s better if your wounds are clean",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 3",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text("Apply antitoxin", style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 4",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Cold compression. Cold compression reduces blood flow to the affected area. This process can reduce inflammation and reduce an allergic process. You should apply ice or a bottle of cold water for 10 min.",
                        style: TextStyle(fontSize: 18)),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                      child: ElevatedButton(
                          onPressed: () {
                            const url = "https://youtu.be/ibsIs9-wM1Y";
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
