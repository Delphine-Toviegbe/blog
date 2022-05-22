import 'package:blog/controllers/api_helper.dart';
import 'package:blog/models/article.dart';
import 'package:blog/models/user.dart';
import 'package:blog/views/article_form.dart';
import 'package:blog/views/nav_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> _articles = [];
  User? _current_user;
  Future<void> _loadData() async {
    var data = await APIHelper.getArticles();
    var userData = await APIHelper.currentUser();
    setState(() {
      _articles = data;
      _current_user = userData;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:40.0,
              ),
              _current_user!=null ? Text("Hi, "+_current_user!.name!,
                style: TextStyle(color: Color(0xFFC00B2C), fontSize: 22.0, fontWeight: FontWeight.bold),
              ) : Container(),
              SizedBox(
                height:20.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFC00B2C),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search ...",
                  hintStyle: const TextStyle(fontSize: 15.0, color: Colors.white),
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                  suffixIconColor: Colors.white,
                ),
              ),
              SizedBox(
                height:20.0,
              ),

              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[

                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Science', style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(width: 20.0,),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Health', style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(width: 20.0,),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Sport', style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(width: 20.0,),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Politique', style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(width: 20.0,),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Technologie', style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(width: 20.0,),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Cooking', style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(width: 20.0,),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Sport', style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
              ),

              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 350,
                            width: 250,
                            child:  Image.asset('assets/images/category_image1.png',
                              height: 100,
                              width: 100,
                              fit: BoxFit.fitWidth
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 50,
                            child:Text("Technologie",style: TextStyle(color:Colors.blue,fontSize: 20),textAlign: TextAlign.center,)
                            ,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 50.0,),
                    Container(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 350,
                            width: 250,
                            child:  Image.asset('assets/images/category_image1.png',
                                height: 100,
                                width: 100,
                                fit: BoxFit.fitWidth
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 50,
                            child:Text("Technologie",style: TextStyle(color:Colors.blue,fontSize: 20),textAlign: TextAlign.center,)
                            ,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 50.0,),
                    Container(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 350,
                            width: 250,
                            child:  Image.asset('assets/images/category_image1.png',
                                height: 100,
                                width: 100,
                                fit: BoxFit.fitWidth
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 50,
                            child:Text("Technologie",style: TextStyle(color:Colors.blue,fontSize: 20),textAlign: TextAlign.center,)
                            ,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 50.0,),
                    Container(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 350,
                            width: 250,
                            child:  Image.asset('assets/images/category_image1.png',
                                height: 100,
                                width: 100,
                                fit: BoxFit.fitWidth
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 50,
                            child:Text("Technologie",style: TextStyle(color:Colors.blue,fontSize: 20),textAlign: TextAlign.center,)
                            ,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.0),

              Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Last articles'),
                            Text('more'),
                          ],
                        )]
                  )
              ),

              SizedBox(
                height: 40.0,
              ),

              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _articles.length,
                  itemBuilder: (context,index)=>Stack(
                    children: [
                      Container(
                        margin:  EdgeInsets.only(bottom: 30.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 30.0, left: 20.0 ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20.0),
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(16.0),
                                color: Color(0xFFC00B2C),
                              ),

                              child: ListTile(
                                contentPadding: EdgeInsets.only(left: 40.0, top: 10.0, bottom: 10.0, right: 0.0),
                                title: Container(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(_articles[index].title!,
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
                            Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            APIHelper.deleteArticle(_articles[index]);
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
                                              MaterialPageRoute(builder: (context) => ArticleForm(article: _articles[index])),
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
                                    ),
                                  ],
                                )
                            )
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
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(selectedIndex: 0),
    );
  }
}
