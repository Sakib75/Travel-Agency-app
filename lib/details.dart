import 'package:flutter/material.dart';
import 'components/constrains.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Checkout.dart';

class Details extends StatefulWidget {
  final image_add ,title,rating,descrption,price;
  Details({@required this.image_add,@required this.title,@required this.rating,@required this.descrption,@required this.price});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: kcontainer,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
                ),
                height: MediaQuery.of(context).size.height * .6,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.title,style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black),),
                        SizedBox(height: 10,),
                        RatingBar(
                          itemSize: 25.0,
                          initialRating: widget.rating,
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
                      ],
                    )
                  )
                )

              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
                  image: DecorationImage(
                    image: NetworkImage(widget.image_add),
                    fit: BoxFit.cover
                  ),

                ),

              ),
              Positioned(
                top: 50,
                left: 30,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(height: 50,width: 50,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4),spreadRadius: 2,blurRadius: 4)],
                      color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                    child: Icon(Icons.arrow_back_ios,size: 40,color: Colors.blueGrey,),

                  ),
                ),
              )


            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.4,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Container(
                      padding: EdgeInsets.all(30),
                      child: Text(widget.descrption,style: TextStyle(color: Colors.black,fontSize: 17),)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 60,right: 60),
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Color(0xff1D4185),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('৳${widget.price.toString()}',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 3),),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Checkout(title: widget.title,price: widget.price,))
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xffDEF1FF)
                          ),
                          child: Center(child: Text('Check Out',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),)),
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),


    );
  }
}

