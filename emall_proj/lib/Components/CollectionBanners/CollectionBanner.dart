import 'package:emall_proj/Components/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyGlobalVariables.dart';

class CollectionBannerDataHolder {
  String title;
  String buttonTitle;
  String imagePath;
  BoxFit boxfit;
  CollectionBannerDataHolder(
      {required this.title,
      required this.buttonTitle,
      required this.imagePath,
      required this.boxfit});
}

class CollectionBannerPanel extends StatelessWidget {
  const CollectionBannerPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          //color: Colors.blue,
          child: Container(
            margin: EdgeInsets.only(
                left: borderMargin, right: borderMargin, top: 80, bottom: 80),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: CollectionBanner(CollectionBannerDataHolder(
                        title: 'New arrivals\nare now in!',
                        buttonTitle: 'SHOW COLLECTIONS',
                        imagePath:
                            'images/collection_banners/collection_banner_1.jpg',
                        boxfit: BoxFit.fitHeight))),
                SizedBox(width: 20),
                Expanded(
                    child: CollectionBanner(CollectionBannerDataHolder(
                        title: 'Basic t-shirts\n\$29,99',
                        buttonTitle: 'MORE DETAILS',
                        imagePath:
                            'images/collection_banners/collection_banner_2.jpg',
                        boxfit: BoxFit.fitWidth))),
                SizedBox(width: 20),
                Expanded(
                    child: CollectionBanner(CollectionBannerDataHolder(
                        title: 'Sale this\nsummer',
                        buttonTitle: 'VIEW ALL',
                        imagePath:
                            'images/collection_banners/collection_banner_3.jpg',
                        boxfit: BoxFit.fitWidth))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CollectionBanner extends StatefulWidget {
  CollectionBannerDataHolder collectionBannerDataHolder;
  CollectionBanner(this.collectionBannerDataHolder, {Key? key})
      : super(key: key);

  @override
  _CollectionBannerState createState() => _CollectionBannerState();
}

class _CollectionBannerState extends State<CollectionBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Container(
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.collectionBannerDataHolder.imagePath),
                fit: widget.collectionBannerDataHolder.boxfit,
                alignment: Alignment.center),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        Container(
          //color: Colors.blue,
          margin: EdgeInsets.only(bottom: 40, left: 40, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.collectionBannerDataHolder.title,
                style: GoogleFonts.poppins(
                    color: MyColor.White,
                    fontWeight: FontWeight.w500,
                    fontSize: 21),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                child: Text(
                  widget.collectionBannerDataHolder.buttonTitle,
                  style: GoogleFonts.poppins(
                      color: MyColor.Black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                onPressed: () {},
              ),
            ],
          ),
        )
      ]),
    );
  }
}
