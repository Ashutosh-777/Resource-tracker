import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: SigninSignup(),
  ));
}

class SigninSignup extends StatefulWidget {
  SigninSignup({Key? key}) : super(key: key);

  @override
  _SigninSignupState createState() => _SigninSignupState();
}

class _SigninSignupState extends State<SigninSignup> {
  bool isSignupScreen = false;

  void toggleScreen() {
    setState(() {
      isSignupScreen = !isSignupScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: mq.height * 0.13),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/logo.jpg"),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: mq.height * 0.5,
                        width: mq.width * 0.75,
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Apply borderRadius here
                              child: Container(
                                height: mq.height * 0.05,
                                width: mq.width * 0.50,
                                color: Colors.grey.shade300, // Set background color here
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (isSignupScreen) {
                                          setState(() {
                                            isSignupScreen = false;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: mq.width * 0.25,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: !isSignupScreen ? Colors.blue : Colors.grey.shade300,
                                        ),
                                        child: Center(
                                          child: Text("Sign In"),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (!isSignupScreen) {
                                          setState(() {
                                            isSignupScreen = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: mq.width * 0.25,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: isSignupScreen ? Colors.blue : Colors.grey.shade300,
                                        ),
                                        child: Center(
                                          child: Text("Sign Up"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            isSignupScreen
                                ? Widgets.buildSignupSection()
                                : Widgets.buildSigninSection(),
                           SizedBox(height: !isSignupScreen ? mq.height*0.13:mq.height*0.027,),
                           InkWell(
                             onTap: (){
                               !isSignupScreen ? print("Sing In") : print("Sing Up") ;
                             },
                             child: Container(
                               decoration: BoxDecoration(
                                 color: Colors.blue,
                                 borderRadius: BorderRadius.circular(20),
                               ),
                               height:50,
                               width: mq.width*0.3,
                               child: Center(
                                 child: !isSignupScreen ? Text("SIGN IN") : Text("SIGN UP"),
                               ),

                             ),
                           )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

          ),
        ),
      ),
    );
  }
}
