import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/Widgets/InputFields.dart';
import 'package:emall_proj/Screens/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            elevation: 5.0,
            child: Container(
              height: 500,
              width: 1000,
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40)),
                    ),
                    width: 300,
                    height: 500,
                    child: Padding(
                      padding: EdgeInsets.only(right: 50.0, left: 50.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(),
                            SizedBox(
                              height: 60.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(
                                "Let's get you set up",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(
                                "It should only take a couple of minutes to pair with your watch",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Container(
                              child: CircleAvatar(
                                backgroundColor: Colors.black87,
                                child: Text(
                                  ">",
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 40.0, right: 70.0, left: 70.0, bottom: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                              color: MyColor.Black,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                        Row(
                          children: [
                            Text(
                              "Already have an account? ",
                              style: GoogleFonts.poppins(
                                  color: MyColor.Black,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                "Log In",
                                style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        //InputField Widget from the widgets folder
                        InputField(label: "Name", hint: "Name"),

                        //Gender Widget from the widgets folder

                        SizedBox(height: 20.0),

                        //InputField Widget from the widgets folder
                        InputField(label: "Email", hint: "yo@seethat.com"),

                        SizedBox(height: 20.0),

                        InputField(label: "Mobile", hint: "+22994684468"),

                        SizedBox(
                          height: 40.0,
                        ),

                        // SizedBox(
                        //   height: 30.0,
                        // ),

                        // Expanded(
                        Container(
                          width: 520,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(20)),
                                ),
                                onPressed: () {},
                                child: Text("Cancel"),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(20)),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                            //   ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
