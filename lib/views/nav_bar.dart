import 'package:blog/views/articles.dart';
import 'package:blog/views/home.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  int selectedIndex;
  NavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final Color primaryColor = Color(0xFFC00B2C);
  final Color inputColor = Color(0xFFDDDDDD);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.selectedIndex,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 20.0),
        showUnselectedLabels: true,
        //fixedColor: Colors.black,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black,
        iconSize: 20.0,
        unselectedLabelStyle: TextStyle(color: Colors.grey[800], fontSize: 14.0),
        onTap: (int index){
          if(index==0){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
          else if(index==1){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Articles()),
            );
          }
          else if(index==2){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
          else if(index==3){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
        },
        //landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          )
        ]
    );
  }
}
