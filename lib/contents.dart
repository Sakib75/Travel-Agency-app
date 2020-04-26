import 'package:flutter/material.dart';
import 'components/constrains.dart';
import 'components/cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class contents extends StatefulWidget {
  const contents({
    Key key,
  }) : super(key: key);

  @override
  _contentsState createState() => _contentsState();
}

class _contentsState extends State<contents>
    with SingleTickerProviderStateMixin {
  bool datareceived = false;
  List<Widget> inboundcards = [];
  List<Widget> holidaycards = [];
  List<Widget> regularcards = [];

  TabController _controller;
  final _firestore = Firestore.instance;
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: 4);

    Data_Inbound('Inbound',inboundcards);
    Data_Inbound('Holiday', holidaycards);
    Data_Inbound('Regular', regularcards);
    print(inboundcards);
    print(holidaycards);


  }

  void Data_Inbound(String collection,List collection_list) async {
    final allinfo = await _firestore.collection(collection).getDocuments();
    for(var info in allinfo.documents) {

      String title = info.data['title'];
      String image_add = info.data['image_add'];
      String description = info.data['description'];
      String short_description = description.substring(0,40);
      double rating = info.data['rating'].toDouble();
      int price = info.data['price'];



      collection_list.add(Cards(title: title,description:description,short_description: short_description,image_add: image_add,rating: rating,price:price));
      setState(() {
      });

    }

  }



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            child: TabBar(
              isScrollable: true,
              labelColor: kbasic,
              unselectedLabelColor: kbasic.withOpacity(0.3),
              indicator: CircleTabIndicator(color: Colors.blue, radius: 3),
              labelPadding: EdgeInsets.only(
                bottom: 15,
                right: 15,
              ),
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              controller: _controller,
              tabs: <Widget>[
                Text('Inbound'),
                Text('Outbound'),
                Text('Holiday Package'),
                Text('Regular Tours')
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _controller,
            children: <Widget>[
              ListView(
                children: inboundcards.length > 0 ?  inboundcards : <Widget>[Container(child: CircularProgressIndicator())] ,
              ),
              ListView(
                children: holidaycards.length > 0 ?  holidaycards : <Widget>[CircularProgressIndicator()] ,
              ),
              ListView(
                children: regularcards.length > 0 ?  regularcards : <Widget>[CircularProgressIndicator()] ,
              ),
              ListView(
                children: inboundcards.length > 0 ?  inboundcards : <Widget>[CircularProgressIndicator()] ,
              ),

            ],
          ))
        ],
      ),
    );
  }
}


