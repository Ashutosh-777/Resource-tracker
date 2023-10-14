import 'package:flutter/material.dart';

class Widgets {

  static Widget buildTextField({
    required IconData? icon,
    required String? hintText,
   bool isPassword = false,
    bool isEmail = false,
   required TextEditingController? controller,

  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(icon, color: Colors.black),
        ) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }



  // ---------------Bulding Signin Section-------------------------------

  static Padding buildSigninSection(){
    TextEditingController signinEmail = TextEditingController() ;
    TextEditingController signinPass = TextEditingController() ;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Widgets.buildTextField(
                icon: Icons.mail,
                hintText:"           Email Address",
              isEmail: true, isPassword: false, controller: signinEmail,

            ),
            SizedBox(height: 20,),
            Widgets.buildTextField(
                icon: Icons.lock,
                hintText:"            Password",
                isPassword: true, isEmail: false, controller: signinPass,
            ),
          ],
        ),
      ),
    ) ;
  }




  // ---------------Bulding Signin Section-------------------------------

  static Padding buildSignupSection(){
    TextEditingController signupUsername  = TextEditingController() ;
    TextEditingController signupPhone  = TextEditingController() ;
    TextEditingController signupEmail  = TextEditingController() ;
    TextEditingController signupPass  = TextEditingController() ;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        child: Column(
          children: [
            Widgets.buildTextField(
                icon: Icons.person_2_rounded,
                hintText:"             Username", isPassword: false, isEmail: false, controller: signupUsername,

            ),
            SizedBox(height: 20,),
            Widgets.buildTextField(
                icon: Icons.phone,
                hintText:"              Phone", isPassword: false, isEmail:false, controller: signupPhone,
            ),
            SizedBox(height: 20,),
            Widgets.buildTextField(
                icon: Icons.mail,
                hintText:"           Email Address",
              isEmail: true, isPassword: false, controller: signupEmail,
            ),
            SizedBox(height: 20,),
            Widgets.buildTextField(
                icon: Icons.lock,
                hintText:"            Password",
               isPassword: true, isEmail: false, controller: signupPass,
            ),
          ],
        ),
      ),
    ) ;
  }
}





