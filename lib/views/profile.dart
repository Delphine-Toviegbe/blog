import 'package:blog/controllers/api_helper.dart';
import 'package:blog/models/article.dart';
import 'package:blog/models/user.dart';
import 'package:blog/views/article_details.dart';
import 'package:blog/views/article_form.dart';
import 'package:blog/views/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Article> _userFavoris = [];
  User? _current_user;
  bool _isLoading = true;

  Future<void> _loadData() async {
    var userFavorisData = await APIHelper.getUserFavoris();
    var userData = await APIHelper.currentUser();
    setState(() {
      _current_user = userData;
      _userFavoris = userFavorisData;
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
    return Scaffold(
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : Padding(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Profil',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          Icon(Icons.star),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 55.0),
                      child: Card(
                        child: Container(
                          decoration:  new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFFC00B2C),
                                              width: 2.0
                                          ),
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        width: 100.0,
                                        height: 100.0,
                                      ),
                                      Positioned(
                                        child: Image.asset('assets/images/square-profil.png'),
                                        width: 100, height: 100,)
                                    ],
                                  ),
                                  Container(
                                    width: 170,
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(_current_user!.email!,
                                            style: TextStyle(
                                                color: Color(0xFF2D4379),
                                            )
                                        ),
                                        SizedBox(height: 20.0,),
                                        Text(_current_user!.name!,
                                          style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ),
                    /*Positioned(
                        bottom: 0,
                        left: 50,
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(8.0),
                            color: Color(0xFFC00B2C),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text('52', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white,),),
                                    SizedBox(height: 10.0),
                                    Text('Posts',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white,),)
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text('255', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white,),),
                                    SizedBox(height: 10.0),
                                    Text('Following',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white,),)
                                  ],
                                ),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  color: Color(0xFFAB1F1F),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text('5.4K', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white,),),
                                    SizedBox(height: 10.0),
                                    Text('Followers',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white,),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                    )*/
                  ],
                ),
              ),
              SizedBox(height: 30),
              Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Favorites',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold
                          )
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _userFavoris.length,
                        itemBuilder: (context, index)=> Stack(
                          children: [
                            Container(
                              margin:  EdgeInsets.only(bottom: 30.0),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 30.0, left: 20.0 ),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ArticleDetails(article: _userFavoris[index])),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20.0),
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(16.0),
                                        color: Color(0xFF8D001F),
                                      ),

                                      child: ListTile(
                                        contentPadding: EdgeInsets.only(left: 40.0, top: 10.0, bottom: 10.0, right: 0.0),
                                        title: Container(
                                          padding: EdgeInsets.only(left: 50.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(_userFavoris[index].title!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12.0,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        subtitle: Container(
                                          padding: EdgeInsets.only(left: 0.0),
                                          child: Column(
                                            children: const [
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Text("Click on the article to read it in detail. It is very interesting.",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  (_current_user != null && _current_user!.admin == true) ? Container(
                                      margin: EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              APIHelper.deleteArticle(_userFavoris[index]);
                                              _loadData();
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.delete),
                                                Text('Delete poste'),
                                              ],
                                            ),
                                          ),

                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => ArticleForm(article: _userFavoris[index])),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.edit, color: Color(0xFF0D253C)),
                                                Text('Edit poste', style: TextStyle(color: Color(0xFF0D253C))),
                                              ],
                                            ),
                                          ),

                                        ],
                                      )
                                  ) : Container(),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Image.asset('assets/images/category_image1.png',
                                alignment: Alignment.topLeft,
                                height: 100,
                                width: 100,
                                fit: BoxFit.fitWidth,
                              ),
                            )
                          ],

                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(selectedIndex: 2),
    );
  }
}