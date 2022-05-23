import 'package:blog/controllers/api_helper.dart';
import 'package:blog/models/user.dart';
import 'package:blog/views/articles.dart';
import 'package:blog/views/home.dart';
import 'package:blog/views/login.dart';
import 'package:blog/views/profile.dart';
import 'package:blog/views/signup.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  int selectedIndex;
  NavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final Color primaryColor = Color(0xFF8D001F);
  final Color inputColor = Color(0xFFDDDDDD);
  User? _current_user;
  bool _isLoading = true;
  Future<void> _loadData() async {
    var userData = await APIHelper.currentUser();
    setState(() {
      _current_user = userData;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading ? const Center(
      child: CircularProgressIndicator(),
    ) : BottomNavigationBar(
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
            if(_current_user!=null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            }
            else{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              );
            }
          }
          else if(index==3){
            if(_current_user!=null) {
              APIHelper.logout();
              _loadData();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }
            else{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            }
          }
        },
        //landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Article',
          ),
          _current_user!=null ? const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ) : const BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Sign up',
          ),
          _current_user!=null ? const BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Log out',
          ) : const BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          )
        ]
    );
  }
}
