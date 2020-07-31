import 'package:chat_app/services/auth.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController    = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  signMeUp(){
    if(formKey.currentState.validate()){
      isLoading = true;
    }

    authMethods.signUpWithEmailAndPassword(
      emailTextEditingController.text, 
      passwordTextEditingController.text
    ).then((value) {
      print('$value');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator()
        ),
      ) : Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value){
                      return value.isEmpty || value.length > 4 ? null : 'Please Provide a valid UserName';
                    },
                    controller: userNameTextEditingController,
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration('Username')
                  ),
                  TextFormField(
                    validator: (value) {
                      return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                      ).hasMatch(value) ? null : "Please provide a valid Email";
                    },
                    controller: emailTextEditingController,
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration('Email')
                  ),
                  TextFormField(
                    validator: (value) {
                      return value.length > 6 ? null : 'Please provide password 6+ character';
                    },
                    obscureText: true,
                    controller: passwordTextEditingController,
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration('Password')
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Forgot Password?',
                  style: simpleTextStyle(),
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: (){
                signMeUp();
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff007EF4),
                      const Color(0xff2A75BC),
                    ]  
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text(
                  'Sign Up',
                  style: mediumTextStyle()
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Text(
                'Sign Up with Google',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17
                )
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account? ",
                  style: mediumTextStyle()
                ),
                Text(
                  'SignIn now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    decoration: TextDecoration.underline
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}