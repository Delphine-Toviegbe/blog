import 'package:blog/controllers/api_helper.dart';
import 'package:blog/views/article_details.dart';
import 'package:blog/views/article_form.dart';
import 'package:blog/views/articles.dart';
import 'package:blog/views/home.dart';
import 'package:blog/views/login.dart';
import 'package:blog/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/article.dart';

class Start1 extends StatefulWidget {
  const Start1({Key? key}) : super(key: key);

  @override
  _Start1State createState() => _Start1State();
}

class _Start1State extends State<Start1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            flex: 11,
            child: Container(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: Image.asset("assets/images/start1_image.png"),/*Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54.withOpacity(0.3),
                                        blurRadius: 4,
                                        offset: const Offset(0,4),
                                      )
                                    ]
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54.withOpacity(0.3),
                                        blurRadius: 4,
                                        offset: const Offset(0,4),
                                      )
                                    ]
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black54.withOpacity(0.3),
                                          blurRadius: 4,
                                          offset: const Offset(0,4),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black54.withOpacity(0.3),
                                          blurRadius: 4,
                                          offset: const Offset(0,4),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),*/
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0,4),
                    )
                  ]
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 60,top: 60,right: 60,bottom: 80),
                  child: Column(
                    children: [
                      Text("Read the article you want instantly",style: GoogleFonts.getFont('Philosopher', fontSize: 20, fontWeight: FontWeight.bold),),
                      //const SizedBox(height: 20,),
                      const Spacer(
                        flex: 1,
                      ),
                      Text("You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.",style: GoogleFonts.getFont('Philosopher',fontWeight: FontWeight.w500)),
                      const Spacer(flex: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const IconButton(
                              onPressed: null,
                              icon: Icon(Icons.camera)
                          ),
                          InkWell(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Home()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFF8D001F),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 4,
                                        offset: const Offset(0,4),
                                      )
                                    ]
                                ),
                                height: 40,
                                width: 60,
                                child: const Center(child: Icon(Icons.east, color: Colors.white,),),
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
