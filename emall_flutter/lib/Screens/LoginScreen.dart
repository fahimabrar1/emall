import 'dart:developer';

import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Components/Widgets/InputFields.dart';
import 'package:emall_proj/Screens/HomeScreen.dart';
import 'package:emall_proj/Screens/SignupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenPanel extends StatefulWidget {
  const LoginScreenPanel({Key? key}) : super(key: key);

  @override
  _LoginScreenPanelState createState() => _LoginScreenPanelState();
}

class _LoginScreenPanelState extends State<LoginScreenPanel> {
  bool? username = false;
  bool? password = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardBorderRadius)),
        elevation: 5.0,
        child: Container(
          height: 500,
          width: 1000,
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: MyColor.orange,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cardBorderRadius),
                      bottomLeft: Radius.circular(cardBorderRadius)),
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
                              style: TextStyle(color: MyColor.orange),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Text Field Showing Log In Title
                    Text(
                      "Log In",
                      style: GoogleFonts.poppins(
                          color: MyColor.Black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                    //Row Field Showing Multiple Widgets at row
                    Row(
                      children: [
                        Text(
                          "Dont't have an account? ",
                          style: GoogleFonts.poppins(
                              color: MyColor.Black,
                              fontWeight: FontWeight.w200,
                              fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            log("message");

                            //Navigator.pop(context);
                            // AlertDialog(
                            //   content: SignUpScreenPanel(),
                            // );
                            // log("message");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            "Sign Up",
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
                    InputField(
                      label: "Mobile No.",
                      hint: "Mobile no.",
                      textInputType: TextInputType.number,
                      boolCallback: (val) => {setState(() => username = val)},
                    ),

                    //Gender Widget from the widgets folder

                    SizedBox(height: 20.0),

                    //InputField Widget from the widgets folder
                    InputField(
                      label: "Password",
                      hint: "Password",
                      obsecure: true,
                      boolCallback: (val) => {setState(() => password = val)},
                    ),

                    SizedBox(
                      height: 20.0,
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
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 12),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      width: 520,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(20)),
                            ),
                            onPressed: () {
                              if (username == true && password == true) {
                                log("Can Login");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              } else if (username == false &&
                                  password == true) {
                                log("User Empty");
                              } else if (username == true &&
                                  password == false) {
                                log("Password Empty");
                              } else {
                                log("All Empty");
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
