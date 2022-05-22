import 'package:flutter/material.dart';
import 'package:blog/views/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = new TextEditingController();
  final _usernameController = new TextEditingController();
  String _password = '';
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 170,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 30.0,),
                Container(
                    child: Column(
                      children:[
                        Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(35))
                              ),
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // use whichever suits your need
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, PageRouteBuilder(
                                            pageBuilder: (context, animation, secondaryAnimation) => Login(),
                                            transitionsBuilder: (context, animation, secondaryAnimation, child){
                                              animation = CurvedAnimation(curve: Curves.easeInCubic, parent: animation);
                                              return FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              );
                                            }
                                        ));
                                      },
                                      child: Text("LOGIN")
                                  ),
                                  Text("SIGN UP", style: TextStyle(color: Colors.white))

                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 40.0),
                              margin: const EdgeInsets.only(top: 65.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      topLeft: Radius.circular(25))
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 30.0,),
                                  Text('Welcome to blog', style: TextStyle(color: Colors.black, fontSize: 24.0),),
                                  SizedBox(height: 40.0,),
                                  Row(children: [Text('Sign in with your account'),],),
                                  SizedBox(height: 20.0,),
                                  Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: _usernameController,
                                            keyboardType: TextInputType.name,
                                            decoration: InputDecoration(
                                                labelText: "Username"
                                            ),
                                            validator: (String? v){
                                              return (v== null || v == "")?
                                              "Ce champ est obligatoire" : null;
                                            },
                                          ),
                                          SizedBox(height: 20.0,),
                                          TextFormField(
                                            controller: _emailController,
                                            keyboardType: TextInputType.name,
                                            decoration: InputDecoration(
                                                labelText: "Email"
                                            ),
                                            validator: (String? v){
                                              return (v== null || v == "")?
                                              "Ce champ est obligatoire" : null;
                                            },
                                          ),
                                          SizedBox(height: 20.0,),
                                          TextFormField(
                                            obscureText: _isObscure,
                                            decoration: InputDecoration(
                                              suffixIcon: InkWell(
                                                onTap: () => setState(() {
                                                  _isObscure = !_isObscure;
                                                }),
                                                child:Icon(!_isObscure ? Icons.visibility : Icons.visibility_off) ,
                                              ),
                                              labelText: "Password",

                                            ),
                                            onChanged: (value) => setState(() {
                                              _password = value;
                                            }),
                                            validator: (value){
                                              return (value== null || value == "")?
                                              "Ce champ est obligatoire" : null;
                                            },


                                          ),
                                        ],
                                      )),
                                  SizedBox(height: 40.0),
                                  Container(
                                      child: ElevatedButton(
                                          style:ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            primary: Theme.of(context).primaryColor,
                                            minimumSize: const Size.fromHeight(50),

                                          ),
                                          onPressed: (){
                                            if(_formKey.currentState!.validate()){
                                              /* Appelle une méthode Dara*/
                                            }
                                          },
                                          child: Text("Login")

                                      )

                                  ),

                                  SizedBox(height: 20.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('Forgot your pasword'),
                                      Text('Reset here', style: TextStyle(color: Theme.of(context).primaryColor),)
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(30),
                                    child: Image.asset(
                                      'assets/images/social_network.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /* Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(Icons.add_alert),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add_alert),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add_alert),
                                      onPressed: (){},
                                    ),
                                  ],
                                )*/

                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                ),
              ],
            ),

          )
          ,
        )
    );
  }
}