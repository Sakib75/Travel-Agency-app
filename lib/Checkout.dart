import 'package:flutter/material.dart';
import 'components/constrains.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Checkout extends StatefulWidget {
  final title,price;
  Checkout({@required this.title,@required this.price});
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  Firestore _firestore;
  String name;
  String phone;
  String location;
  TextEditingController _controller_name ;
  TextEditingController _controller_phone;
  TextEditingController _controller_location;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firestore = Firestore.instance;
    _controller_name = TextEditingController();
    _controller_phone = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 100),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(height: MediaQuery.of(context).size.height * 0.1 ,
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {Navigator.pop(context);},
                    
                      child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.arrow_back))),
                  Expanded(child:   Center(child: Column(
                    children: <Widget>[
                      Text('Your destination is',style: TextStyle(fontSize: 30),),
                      TypewriterAnimatedTextKit(
                        speed: Duration(seconds: 1),
                        text: [widget.title],
                        textStyle: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),
                      )
                    ],
                  )))
                ],
              ),),
//              Card(
//
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text('Your name',style: TextStyle(fontSize: 20,color: ktitle.withOpacity(0.5)),),
//                    ),
//                    TextField(
//                      controller: _controller,
//                      textAlign: TextAlign.center,
//                      style: TextStyle(fontSize: 20),
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder()
//                      ),
//                      onChanged: (value) {
//                        setState(() {
//                          name = value;
//                        });
//                      },
//                    ),
//                    TextField(),
//                    Text('$name'),
//                  ],
//                ),
//              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Your name',style: TextStyle(fontSize: 20,color: ktitle.withOpacity(0.5)),),
                  ),
                  TextField(
                    controller: _controller_name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                    onChanged: (value) {

                        name = value;

                    },
                  ),

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Phone no',style: TextStyle(fontSize: 20,color: ktitle.withOpacity(0.5)),),
                  ),
                  TextField(
                    controller: _controller_phone,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                    onChanged: (value) {


                        phone = value;

                    },
                  ),

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Location',style: TextStyle(fontSize: 20,color: ktitle.withOpacity(0.5)),),
                  ),
                  TextField(
                    controller: _controller_location,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                    onChanged: (value) {


                      location = value;

                    },
                  ),

                ],
              ),



              FlatButton(
                onPressed: () {
                  _firestore.collection('Orders').add({'name':name,'phone':phone,'location':location});
                  print('b');
                  _onBasicAlertPressed(context);
                  },
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: ktitle,
                  ),
                  child: Center(child: Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 30),)),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

_onBasicAlertPressed(context) {
  Alert(
      context: context,
      title: "Your request has been received",
      desc: "We will be in touch with you soon",
  buttons: [
  DialogButton(
  child: Text(
  "Backs",
  style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  onPressed: () => Navigator.pop(context),
  color: Color.fromRGBO(0, 179, 134, 1.0),
  radius: BorderRadius.circular(0.0),
  ),
  ],

  ).show();
}