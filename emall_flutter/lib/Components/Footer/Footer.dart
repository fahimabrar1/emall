import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterPanel extends StatefulWidget {
  const FooterPanel({Key? key}) : super(key: key);

  @override
  _FooterPanelState createState() => _FooterPanelState();
}

class _FooterPanelState extends State<FooterPanel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: borderMargin, top: borderMargin / 2),
                    //color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "eMall",
                          style: GoogleFonts.poppins(
                              color: MyColor.White,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "House My Brand designs clothing for the young, the old &everyone in between – but most importantly, for the fashionable",
                          style: GoogleFonts.poppins(
                            color: MyColor.White,
                            fontSize: 13,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  child: Container(
                padding:
                    EdgeInsets.only(left: borderMargin, top: borderMargin / 2),
                color: MyColor.Black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Contact",
                      style: GoogleFonts.poppins(
                          color: MyColor.White,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "emall@support.com",
                      style: GoogleFonts.poppins(
                        color: MyColor.White,
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      "Hotline: +1 234 567 890",
                      style: GoogleFonts.poppins(
                        color: MyColor.White,
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        )
      ],
    );
  }
}
