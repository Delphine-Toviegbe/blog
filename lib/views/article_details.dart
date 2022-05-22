import 'package:blog/views/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/rendering.dart';

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({Key? key}) : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final Color primaryColor = Color(0xFFC00B2C);
  final Color inputColor = Color(0xFFDDDDDD);
  static TextStyle _textStyle=TextStyle(
      fontSize: 40,
      fontWeight:  FontWeight.bold,
      letterSpacing: 2,
      fontStyle: FontStyle.italic,
      color: Colors.grey[800]
  );
  //TextStyle descriptionStyle=TextStyle(color: Colors.grey[900], fontSize: 16.0, fontWeight: FontWeight.w400,);
  Text description1=Text("The \"Little House\" Books is a series of American children's novels written by Laura Ingalls Wilder, based on her childhood and adolescence in the American Midwest (Wisconsin, Kansas, Minnesota, South Dakota, and Missouri) between 1870 and 1894.",
    style: TextStyle(color: Colors.grey[900], fontSize: 14.0, fontWeight: FontWeight.w400,),
  );
  Text description2=Text("The Little House books have been adapted for stage or screen more than once, most successfully as the American television series Little House on the Prairie, which ran from 1974 to 1983 .",
    style: TextStyle(color: Colors.grey[900], fontSize: 14.0, fontWeight: FontWeight.w400,),
  );
  Text description3=Text("The Little House books have been adapted for stage or screen more than once, most successfully as the American television series Little.",
    style: TextStyle(color: Colors.grey[900], fontSize: 14.0, fontWeight: FontWeight.w400,),
  );
  final _commentController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      dragStartBehavior: DragStartBehavior.start,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      //elevation: 0.0,
      //borderOnForeground: true,
      child: Image.asset('assets/images/mask_group.png',
        height: 250,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fitWidth,
      ),
    ),
    Container(
    padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: Text("Little House on the Prairie",
    style: TextStyle(color: primaryColor, fontSize: 20,
    fontWeight: FontWeight.w700),
    textAlign: TextAlign.left,),
    ),
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Icon(Icons.star, color: primaryColor, size: 20.0,),
    Icon(Icons.star, color: primaryColor, size: 20.0,),
    Icon(Icons.star, color: primaryColor, size: 20.0,),
    Icon(Icons.star, color: primaryColor, size: 20.0,),
    Icon(Icons.star, color: primaryColor, size: 20.0,),
    ],
    ),
    Container(
    padding: EdgeInsets.only(top: 10.0,bottom: 5.0),
    child: description1,
    ),
    Container(
    padding: EdgeInsets.only(bottom: 5.0),
    child: description2,
    ),
    Container(
    padding: EdgeInsets.only(bottom: 5.0),
    child: description3,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Column(
    children: [
    IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.thumb_up, color: Colors.blue[800], semanticLabel: "Likes",),
    ),
    Text("20 Like", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w400, fontSize: 12.0), textAlign: TextAlign.center,)
    ],
    ),
    Column(
    children: [
    IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.favorite, color: primaryColor,),
    ),
    Text("25 Love", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w400, fontSize: 12.0), textAlign: TextAlign.center,)
    ],
    ),
    Column(
    children: [
    IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.comment_rounded),
    ),
    Text("200 Comments", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w400, fontSize: 12.0), textAlign: TextAlign.center,)
    ],
    ),
    Column(
    children: [
    IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.share),
    ),
    Text("20 share", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w400, fontSize: 12.0), textAlign: TextAlign.center,)
    ],
    ),
    ],
    ),
    SizedBox(
    height: 30.0,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Expanded(
    flex: 3,
    child: Container(
    //padding: EdgeInsets.only(top: 30.0),
    child: Form(
    child: TextFormField(
    keyboardType: TextInputType.text,
    controller: _commentController,
    decoration: InputDecoration(
    hintText: "Your comment",
    border: InputBorder.none,
    disabledBorder: null,
    //borderRadius: BorderRadius.circular(8),
    contentPadding: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10),
    fillColor: inputColor,
    filled: true,
    ),
    validator: (String? value){
    return (value==null || value=="")? "Ce champ est obligatoire" : null;
    },
    ),
    )

    ),
    ),
    Expanded(
    child: IconButton(
    icon: Icon(Icons.send),
    onPressed: () {  },
    )
    )
    ],
    ),
    // Expanded(
    //     child: Padding(
    //       padding: EdgeInsets.only(top: 30.0),
    //     ),),
    SizedBox(
    height: 30.0,
    ),
    Text("20 Comments", style: TextStyle(
    fontSize: 18.0, fontWeight: FontWeight.w400
    ),),
    SizedBox(
    height: 10.0,
    ),
    // ListView(
    //   padding: const EdgeInsets.all(8),
    //   children: [
    //     Card(
    //         elevation: 5.0,
    //         //margin: ,
    //         child: Container(
    //           padding: EdgeInsets.all(10.0),
    //           child: Column(
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       ClipRRect(
    //                         borderRadius: BorderRadius.circular(20.0),
    //                         child: Image.asset('assets/images/profil.png',
    //                           height: 40,
    //                           //cacheWidth: ,
    //                           width: 40,
    //                           fit: BoxFit.fitWidth,
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         width: 8.0,
    //                       ),
    //                       Text("Landers9", style: TextStyle(
    //                           fontSize: 15.0, fontWeight: FontWeight.w400
    //                       ),),
    //                     ],
    //                   ),
    //                   RichText(
    //                     text: TextSpan(
    //                       text: 'comment on  : ',
    //                       style: TextStyle(color: primaryColor, fontSize: 15.0, fontWeight: FontWeight.w400),
    //                       children: const <TextSpan>[
    //                         TextSpan(text: '12-03-22', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400)),
    //                         //TextSpan(text: ' world!'),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Container(
    //                 padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
    //                 child: Text("Tres bon article. Vive la science", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0,),),
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.end,
    //                 children: [
    //                   IconButton(
    //                       onPressed: (){
    //
    //                       },
    //                       icon: Icon(Icons.arrow_forward, size: 20.0, color: primaryColor,)
    //                   )
    //                 ],
    //               )
    //             ],
    //           ),
    //         )
    //     ),
    //     Card(
    //         elevation: 5.0,
    //         //margin: ,
    //         child: Container(
    //           padding: EdgeInsets.all(10.0),
    //           child: Column(
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       ClipRRect(
    //                         borderRadius: BorderRadius.circular(20.0),
    //                         child: Image.asset('assets/images/profil.png',
    //                           height: 40,
    //                           //cacheWidth: ,
    //                           width: 40,
    //                           fit: BoxFit.fitWidth,
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         width: 8.0,
    //                       ),
    //                       Text("Landers9", style: TextStyle(
    //                           fontSize: 15.0, fontWeight: FontWeight.w400
    //                       ),),
    //                     ],
    //                   ),
    //                   RichText(
    //                     text: TextSpan(
    //                       text: 'comment on  : ',
    //                       style: TextStyle(color: primaryColor, fontSize: 15.0, fontWeight: FontWeight.w400),
    //                       children: const <TextSpan>[
    //                         TextSpan(text: '12-03-22', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400)),
    //                         //TextSpan(text: ' world!'),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Container(
    //                 padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
    //                 child: Text("Tres bon article. Vive la science", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0,),),
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.end,
    //                 children: [
    //                   IconButton(
    //                       onPressed: (){
    //
    //                       },
    //                       icon: Icon(Icons.arrow_forward, size: 20.0, color: primaryColor,)
    //                   )
    //                 ],
    //               )
    //             ],
    //           ),
    //         )
    //     )
    //   ],
    // ),

    Card(
    elevation: 5.0,
    //margin: ,
    child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset('assets/images/profil.png',
    height: 40,
    //cacheWidth: ,
    width: 40,
    fit: BoxFit.fitWidth,
    ),
    ),
    SizedBox(
    width: 8.0,
    ),
    Text("Landers9", style: TextStyle(
    fontSize: 15.0, fontWeight: FontWeight.w400
    ),),
    ],
    ),
    RichText(
    text: TextSpan(
    text: 'comment on :  ',
    style: TextStyle(color: primaryColor, fontSize: 15.0, fontWeight: FontWeight.w400),
    children: const <TextSpan>[
    TextSpan(text: '12-03-22', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400)),
    //TextSpan(text: ' world!'),
    ],
    ),
    ),
    ],
    ),
    Container(
    padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 40.0, right: 20.0),
    child: Text("Tres bon article. Vive la science", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0,),),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.redo, size: 20.0, color: primaryColor,)
    )
    ],
    )
    ],
    ),
    )
    ),
    SizedBox(
    height: 20.0,
    ),
    Card(
    elevation: 5.0,
    //margin: ,
    child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset('assets/images/profil_homme.jpg',
    height: 40,
    //cacheWidth: ,
    width: 40,
    fit: BoxFit.fitWidth,
    ),
    ),
    SizedBox(
    width: 8.0,
    ),
    Text("Johanu", style: TextStyle(
    fontSize: 15.0, fontWeight: FontWeight.w400
    ),),
    ],
    ),
    RichText(
    text: TextSpan(
    text: 'comment on :  ',
    style: TextStyle(color: primaryColor, fontSize: 15.0, fontWeight: FontWeight.w400),
    children: const <TextSpan>[
    TextSpan(text: '19-05-22', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400)),
    //TextSpan(text: ' world!'),
    ],
    ),
    ),
    ],
    ),
    Container(
    padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 40.0, right: 20.0),
    child: Text("waooh votre article est source de bonnes inspirations", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0,),),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.redo, size: 20.0, color: primaryColor,)
    )
    ],
    )
    ],
    ),
    )
    ),
    SizedBox(
    height: 20.0,
    ),
    Card(
    elevation: 5.0,
    //margin: ,
    child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset('assets/images/profil3.jpg',
    height: 40,
    //cacheWidth: ,
    width: 40,
    fit: BoxFit.cover,
    ),
    ),
    SizedBox(
    width: 8.0,
    ),
    Text("Johanu", style: TextStyle(
    fontSize: 15.0, fontWeight: FontWeight.w400
    ),),
    ],
    ),
    RichText(
    text: TextSpan(
    text: 'comment on :  ',
    style: TextStyle(color: primaryColor, fontSize: 15.0, fontWeight: FontWeight.w400),
    children: const <TextSpan>[
    TextSpan(text: '19-05-22', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400)),
    //TextSpan(text: ' world!'),
    ],
    ),
    ),
    ],
    ),
    Container(
    padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 40.0, right: 20.0),
    child: Text("waooh votre article est source de bonnes inspirations", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0,),),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.redo, size: 20.0, color: primaryColor,)
    )
    ],
    )
    ],
    ),
    )
    ),
    SizedBox(
    height: 20.0,
    ),
    Card(
    elevation: 5.0,
    //margin: ,
    child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset('assets/images/profile4.jpg',
    height: 40,
    //cacheWidth: ,
    width: 40,
    fit: BoxFit.fitWidth,
    ),
    ),
    SizedBox(
    width: 8.0,
    ),
    Text("Johanu", style: TextStyle(
    fontSize: 15.0, fontWeight: FontWeight.w400
    ),),
    ],
    ),
    RichText(
    text: TextSpan(
    text: 'comment on :  ',
    style: TextStyle(color: primaryColor, fontSize: 15.0, fontWeight: FontWeight.w400),
    children: const <TextSpan>[
    TextSpan(text: '19-05-22', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400)),
    //TextSpan(text: ' world!'),
    ],
    ),
    ),
    ],
    ),
    Container(
    padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 40.0, right: 20.0),
    child: Text("waooh votre article est source de bonnes inspirations", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0,),),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.redo, size: 20.0, color: primaryColor,)
    )
    ],
    )
    ],
    ),
    )
    ),
    SizedBox(
    height: 20.0,
    ),
    Card(
    elevation: 5.0,
    //margin: ,
    child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset('assets/images/profil_homme.jpg',
    height: 40,
    //cacheWidth: ,
    width: 40,
    fit: BoxFit.fitWidth,
    ),
    ),
    SizedBox(
    width: 8.0,
    ),
    Text("Johanu", style: TextStyle(
    fontSize: 15.0, fontWeight: FontWeight.w400
    ),),
    ],
    ),
    RichText(
    text: TextSpan(
    text: 'comment on :  ',
    style: TextStyle(color: primaryColor, fontSize: 15.0, fontWeight: FontWeight.w400),
    children: const <TextSpan>[
    TextSpan(text: '19-05-22', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400)),
    //TextSpan(text: ' world!'),
    ],
    ),
    ),
    ],
    ),
    Container(
    padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 40.0, right: 20.0),
    child: Text("waooh votre article est source de bonnes inspirations", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0,),),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.redo, size: 20.0, color: primaryColor,)
    )
    ],
    )
    ],
    ),
    )
    ),
    SizedBox(
    height: 50.0,
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    // Add your onPressed code here!
    },
    elevation:5.0,
    backgroundColor: primaryColor,
    child: const Icon(Icons.add),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    bottomNavigationBar: NavBar(selectedIndex: 2),
    );
  }
}
