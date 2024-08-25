import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LowBp extends StatefulWidget {
  const LowBp({Key? key}) : super(key: key);

  @override
  State<LowBp> createState() => _LowBpState();
}

class _LowBpState extends State<LowBp> {
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
          Image(image: AssetImage("images/bpimg.png")),
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
                      "Low Blood - Pressure",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFB32525),
                          fontWeight: FontWeight.bold),
                    ),
                    Text("\n"),
                    Text(
                      "A blood pressure reading lower than 90 millimeters of mercury (mm Hg) for the top number (systolic) or 60 mm Hg for the bottom number (diastolic) is generally considered low blood pressure. ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("\n"),
                    Text("Symptoms",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFB32525),
                            fontWeight: FontWeight.bold)),
                    Text("\n"),
                    Text("*  Nausea", style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("*  Cold,clammy,pale skin",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("*  Rapid shallow breathing,Heart palpitations",
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
                        "Lay the patient in a position in which he/she is comfortable. Don’t gather around the patient and let fresh air flow around him/her.",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 2",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Fluids increase blood volume and help prevent dehydration, both of which are important in treating hypotension.",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 3",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Try to eat something salty as it induces water retention and helps to raise blood pressure.",
                        style: TextStyle(fontSize: 18)),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                      child: ElevatedButton(
                          onPressed: () {
                            const url =
                                "https://www.youtube.com/watch?v=YlE945dptAM";
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
