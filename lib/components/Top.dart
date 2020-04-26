import 'package:flutter/material.dart';
import 'constrains.dart';

class TopBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Hi Traveller!',style: TextStyle(fontSize: 20,color: ktitle.withOpacity(0.6)),),
        Container(
          height: 50  ,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.greenAccent,
            image: DecorationImage(
                image: AssetImage('assets/pp.jpg',
                ),
                fit: BoxFit.contain
            ),

          ),
        ),

      ],
    );
  }
}


class WelcomeBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('WELCOME TO',
            style: TextStyle(fontSize: 25,color:ktitle,letterSpacing: 2) ,),
          SizedBox(height: 10,),
          Text('Ticket and Tourism',style: TextStyle(color:ktitle,fontSize: 50,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)
        ],
      ),
    );
  }
}