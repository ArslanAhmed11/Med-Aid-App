import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Burns extends StatefulWidget {
  const Burns({Key? key}) : super(key: key);

  @override
  State<Burns> createState() => _BurnsState();
}

class _BurnsState extends State<Burns> {
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
          Image(image: AssetImage("images/burn.png")),
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
                      "Skin Burns",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFB32525),
                          fontWeight: FontWeight.bold),
                    ),
                    Text("\n"),
                    Text(
                      "A burn occurs when heat, chemicals, sunlight, electricity or radiation damages skin tissue. Most burns happen accidentally. There are different degrees of burns. Burns can be painful. ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("\n"),
                    Text("Symptoms",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFB32525),
                            fontWeight: FontWeight.bold)),
                    Text("\n"),
                    Text("*  Blisters", style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("*  Swelling", style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("* White or charred (black) skin",
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
                        "Cool the burn as quickly as possible with cool running water for at least 10 minutes, or until the pain is relieved",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 2",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "while cooling the burn, carefully remove any clothing or jewellery, unless it's attached to the skin.",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 3",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text(
                        "Cover the burn loosely with cling film; if cling film isn't available, use a clean, dry dressing or non-fluffy material; don't wrap the burn tightly, because swelling may lead to further injury.",
                        style: TextStyle(fontSize: 18)),
                    Text("\n"),
                    Text("Step 4",
                        style: TextStyle(color: Colors.orange, fontSize: 18)),
                    Text("\n"),
                    Text("Don't apply creams, lotions or sprays to the burn.",
                        style: TextStyle(fontSize: 18)),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                      child: ElevatedButton(
                          onPressed: () {
                            const url =
                                "https://www.youtube.com/watch?v=ZNWjfe-84Ig";
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
                                    fontSize: 20, color: Colors.white),
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
