import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyChooseUsDataHolder {
  String title;
  String description;
  IconData icon;
  Color iconColor;
  Color iconBgColor;

  WhyChooseUsDataHolder({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });
}

class WhyChooseUs extends StatelessWidget {
  final WhyChooseUsDataHolder whyChooseUsDataHolder;
  WhyChooseUs({required this.whyChooseUsDataHolder, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: whyChooseUsDataHolder.iconBgColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Center(
                            child: Icon(
                              whyChooseUsDataHolder.icon,
                              color: whyChooseUsDataHolder.iconColor,
                              size: 42,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    whyChooseUsDataHolder.title,
                    style: GoogleFonts.poppins(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    whyChooseUsDataHolder.description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ))),
        ],
      ),
    );
  }
}

class WhyChoseUsPanel extends StatelessWidget {
  WhyChoseUsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 700,
          width: MediaQuery.of(context).size.width,
          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Why should you choose us?",
                style: GoogleFonts.poppins(
                    fontSize: 34, fontWeight: FontWeight.w300),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: borderMargin,
                      right: borderMargin,
                      top: 65,
                      bottom: 80),
                  child: Row(
                    children: [
                      Expanded(
                        child: WhyChooseUs(
                            whyChooseUsDataHolder: WhyChooseUsDataHolder(
                                title: 'Easy Payments',
                                description:
                                    'All payments are processed instantly over a secure payment protocol.',
                                icon: Icons.delivery_dining,
                                iconColor: MyColor.Black,
                                iconBgColor: MyColor.lightGreyBorder)),
                      ),
                      SizedBox(width: panelElementGaps),
                      Expanded(
                        child: WhyChooseUs(
                            whyChooseUsDataHolder: WhyChooseUsDataHolder(
                                title: 'Money-Back Guarantee',
                                description:
                                    'If an item arrived damaged or you\'ve changed your mind, you can send it back for a full refund.',
                                icon: Icons.money,
                                iconColor: MyColor.orange,
                                iconBgColor: MyColor.lightOrange)),
                      ),
                      SizedBox(width: panelElementGaps),
                      Expanded(
                        child: WhyChooseUs(
                            whyChooseUsDataHolder: WhyChooseUsDataHolder(
                                title: 'Finest Quality',
                                description:
                                    'Designed to last, each of our products has been crafted with the finest materials.',
                                icon: Icons.high_quality,
                                iconColor: MyColor.Black,
                                iconBgColor: MyColor.lightGreyBorder)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
