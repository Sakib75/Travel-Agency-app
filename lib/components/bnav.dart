import 'package:flutter/material.dart';

class bnav extends StatefulWidget {





  @override
  _bnavState createState() => _bnavState();
}

class _bnavState extends State<bnav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Color(0xff1B4084),
      unselectedItemColor: Color(0xff1B4084).withOpacity(0.4),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          title: Text('1'),
          icon: Icon(Icons.home,size: 30,),
        ),
        BottomNavigationBarItem(
            title: Text('2'),
            icon: Icon(Icons.search)
        ),
        BottomNavigationBarItem(
            title: Text('3'),
            icon: Icon(Icons.location_on)
        ),
        BottomNavigationBarItem(
            title: Text('4'),
            icon: Icon(Icons.chat_bubble_outline)
        )
      ],
    );
  }
}