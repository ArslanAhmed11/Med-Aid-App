import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_connect/networking.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({Key? key}) : super(key: key);

  @override
  State<CreateRequest> createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  int count = 0;
  String need = 'Select what you need', type = "Type";
  String location = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 25,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder()),
                        backgroundColor: MaterialStateProperty.all(
                            Color(0xFFFF5E5E)), // <-- Button color
                      ),
                    ),
                    Text(
                      "Create a request",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 10, left: 20, right: 20),
                  child: Container(
                    height: 50,
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                          color: Color(0xFFFF6A6A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            // side: BorderSide()
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 8, bottom: 8, right: 15),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          focusColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.white,
                          underline: Container(),
                          items: <String>[
                            'Blood',
                            'Medicine',
                            'Others',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            '$need',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              need = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                need == 'Blood'
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 25, bottom: 10, left: 20, right: 20),
                        child: Container(
                          height: 50,
                          child: DecoratedBox(
                            decoration: ShapeDecoration(
                                color: Color(0xFFFF6A6A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  // side: BorderSide()
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 8, bottom: 8, right: 15),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                focusColor: Colors.white,
                                underline: Container(),
                                // value: _chosenValue,
                                //elevation: 5,
                                style: TextStyle(color: Colors.white),
                                iconEnabledColor: Colors.white,
                                items: <String>[
                                  'Type',
                                  'A+',
                                  'B+',
                                  'O+',
                                  'AB+',
                                  'A-',
                                  'B-',
                                  'O-',
                                  'AB-'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                hint: Text(
                                  '$type',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),

                                onChanged: (String? value) {
                                  setState(() {
                                    type = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),

                // Padding(
                //   padding: const EdgeInsets.only(left: 20,right: 20),
                //   child: Row(children: [
                //     Text("*",style: TextStyle(fontSize: 20, color: Color(0xFFFF6A6A)),),
                //     Text("The field is only applicable if you need blood",style: TextStyle(fontSize: 15,),),
                //   ],),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFFF6A6A)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        onChanged: (value) {
                          location = value;
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Location',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFFF6A6A)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        maxLength: 35,
                        // inputFormatters: [
                        //   LengthLimitingTextInputFormatter(35),
                        // ],
                        onChanged: (value) {
                          description = value;
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Description",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Quantity",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFFA93434),
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Row(
                    children: [
                      Image.asset("images/unit.png"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      Text(
                        "$count Units",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFA93434),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: 40, height: 40),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF56666),
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (count == 0)
                                  count = 0;
                                else
                                  count--;

                                setState(() {});
                              },
                            ),
                          )),
                      SizedBox(
                        width: 8,
                      ),
                      ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: 40, height: 40),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF56666),
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                count++;
                                setState(() {});
                              },
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (location.isEmpty ||
                          count == 0 ||
                          need == 'Select what you need' ||
                          (need == 'Blood' && type == 'Type') ||
                          description.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Please fill in all the required fields."),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        await create_request(
                          location,
                          need,
                          type,
                          count.toString(),
                          description,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Center(
                              child: Text(
                            "Create Request",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                        )),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFFB4B4B)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
