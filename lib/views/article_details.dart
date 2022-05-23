import 'package:blog/controllers/api_helper.dart';
import 'package:blog/models/article.dart';
import 'package:blog/models/comment.dart';
import 'package:blog/models/like.dart';
import 'package:blog/models/love.dart';
import 'package:blog/models/user.dart';
import 'package:blog/views/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class ArticleDetails extends StatefulWidget {
  Article? article;
  ArticleDetails({Key? key, this.article}) : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final formKey = GlobalKey<FormState>();
  final Color primaryColor = Color(0xFF8D001F);
  final Color inputColor = Color(0xFFDDDDDD);
  final TextStyle _textStyle = TextStyle(
      fontSize: 40,
      fontWeight:  FontWeight.bold,
      letterSpacing: 2,
      fontStyle: FontStyle.italic,
      color: Colors.grey[800]
  );
  final _commentController=TextEditingController();
  late QuillController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _isLoading = true;
  List<Comment> _comments = [];
  late Article _article;
  List<Like> _likes = [];
  User? _current_user;
  bool _isLiked = false;
  List<Article> _userFavoris = [];
  bool _isLoved = false;

  Future<void> _loadData() async {
    var commentsData = await APIHelper.getCommentsByArticle(_article);
    var likesData = await APIHelper.getLikes();
    var userFavorisData = await APIHelper.getUserFavoris();
    var userData = await APIHelper.currentUser();
    setState(() {
      _comments = commentsData;
      _likes = likesData;
      _current_user = userData;
      _userFavoris = userFavorisData;
      if(_userFavoris.any((item) => item.id == _article.id)){
        _isLoved = true;
      }
      if(_likes.any((item) => item.article == _article.id)){
        _isLiked = true;
      }
      _isLoading = false;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _article = widget.article!;
    _controller = QuillController(
        document: Document.fromJson(_article.content!),
        selection: const TextSelection.collapsed(offset: 0)
    );
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        dragStartBehavior: DragStartBehavior.start,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              //elevation: 0.0,
              //borderOnForeground: true,
              child: Image.asset('assets/images/category_image1.png',
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
                  child: Text(_article.title!,
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
                SizedBox(
                  height: 10.0,
                ),
                QuillEditor(
                  controller: _controller,
                  scrollController: ScrollController(),
                  scrollable: true,
                  focusNode: _focusNode,
                  autoFocus: false,
                  readOnly: true,
                  expands: false,
                  padding: EdgeInsets.zero,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            if(_current_user!=null){
                              await APIHelper.createOrDeleteLike(Like(article: _article.id));
                              var likesData = await APIHelper.getLikes();
                              var articleData = await APIHelper.getArticleById(_article.id!);
                              setState(() {
                                _likes = likesData;
                                _article = articleData;
                                if(_likes.any((item) => item.article == _article.id)){
                                  _isLiked = true;
                                }else{
                                  _isLiked = false;
                                }
                              });
                            }else{
                              FToast fToast = FToast();
                              fToast.init(context);
                              fToast.showToast(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.black45,
                                  ),
                                  child: Text("Veuillez vous connectez afin de pouvoir liker et commenter les artiles.", style: TextStyle(color: Colors.white),),
                                ),
                                gravity: ToastGravity.BOTTOM,
                                toastDuration: Duration(seconds: 5),
                              );
                            }
                          },
                          icon: _isLiked ? Icon(Icons.thumb_up, color: Colors.blue[800], semanticLabel: "Likes",) : Icon(Icons.thumb_up_alt_outlined, color: Colors.blue[800], semanticLabel: "Likes",),
                        ),
                        Text(_article.like!.toString()+" Likes", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w400, fontSize: 12.0), textAlign: TextAlign.center,)
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                        onPressed: () async {
                          if(_current_user!=null) {
                            await APIHelper.createOrDeleteLove(
                                Love(article: _article.id));
                            var userFavorisData = await APIHelper
                                .getUserFavoris();
                            var articleData = await APIHelper.getArticleById(
                                _article.id!);
                            setState(() {
                              _userFavoris = userFavorisData;
                              _article = articleData;
                              if (_userFavoris.any((item) =>
                              item.id == _article.id)) {
                                _isLoved = true;
                              } else {
                                _isLoved = false;
                              }
                            });
                          }else{
                            FToast fToast = FToast();
                            fToast.init(context);
                            fToast.showToast(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.black45,
                                ),
                                child: Text("Veuillez vous connectez afin de pouvoir ajouter des artiles comme favorie.", style: TextStyle(color: Colors.white),),
                              ),
                              gravity: ToastGravity.BOTTOM,
                              toastDuration: Duration(seconds: 5),
                            );
                          }
                        },
                        icon: _isLoved ? Icon(Icons.favorite, color: primaryColor,) : Icon(Icons.favorite_border, color: primaryColor,),
                        ),
                        Text(_article.love!.toString()+" Love", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w400, fontSize: 12.0), textAlign: TextAlign.center,)
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.comment_rounded),
                        ),
                        Text(_comments.length.toString()+" Comments", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w400, fontSize: 12.0), textAlign: TextAlign.center,)
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
                _current_user!=null ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                      //padding: EdgeInsets.only(top: 30.0),
                        child: Form(
                          key: formKey,
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
                        onPressed: () async {
                          if(formKey.currentState!.validate()) {
                            await APIHelper.createComment(Comment(content: _commentController.text, article: _article.id));
                            _commentController.text = "";
                            _loadData();
                          }
                        },
                      )
                    )
                  ],
                ) : Container(),
                SizedBox(
                  height: 30.0,
                ),
                Text(_comments.length.toString()+" Comments", style: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w400
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _comments.length,
                  itemBuilder: (context,index)=>Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        elevation: 5.0,
                        //margin: ,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                      Text(_comments[index].user!.name!,
                                        style: TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'comment on :  ',
                                      style: TextStyle(color: primaryColor, fontSize: 15.0, fontWeight: FontWeight.w400),
                                      children: <TextSpan>[
                                        TextSpan(text: _comments[index].date!, style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 40.0, right: 20.0),
                                  child: Text(_comments[index].content!, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0,),),
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
                    ],
                  ),
                )
              ],
            ),
          ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(selectedIndex: 1),
    );
  }
}
