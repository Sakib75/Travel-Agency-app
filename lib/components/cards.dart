import 'package:flutter/material.dart';
import 'constrains.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travello/details.dart';

class Cards extends StatelessWidget {

  Cards({@ required this.title,@required this.image_add,@required this.rating,@required this.short_description,@required this.description,this.price});
  String title;
  String image_add ;
  double rating;
  String short_description;
  String description;
  int price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Details(image_add: image_add,title: title,rating: rating,descrption: description,price:price)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: kcontainer,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        height: 150,
        margin: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 3),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4),spreadRadius: 1,blurRadius: 2)],
                    borderRadius:
                    BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            image_add))),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    RatingBar(
                      itemSize: 15.0,
                      initialRating: rating,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding:
                      EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      short_description,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
