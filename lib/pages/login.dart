import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';


void main(){
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


class _LoginState extends State<Login> {

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Widget build(BuildContext context) {

    Future signIn() async{
      try {
        print(emailcontroller.text.trim());

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }

    @override
    void dispose() {
      emailcontroller.dispose();
      passwordcontroller.dispose();

      super.dispose();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Login / SignUp',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
        body: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: emailcontroller,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: 'Email',
                    hintText: 'Enter your Email',
                  ),
                ),
              ),
              SizedBox(height: 4),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: passwordcontroller,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: 'Password',
                    hintText: 'Enter your Password',
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(

                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  primary: Colors.purpleAccent,
                ),
                icon: Icon(Icons.lock_open, size: 22),
                label: Text(
                  'Login / Sign In',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: signIn,
              ),

            ],
          ),
        )
    );
  }
}










// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'dart:math' as math;
//
// void main() {
//   runApp(MaterialApp(
//     home: Login(),
//   ));
// }
//
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//
//   final _formKey = GlobalKey<FormState>();
//
//   final usernameController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text('Login / SignUp',
//           style: TextStyle(
//             color: Colors.grey[600],
//           ),
//         ),
//       ),
//       body: Center(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   child: Center(
//                     child: Text(
//                       'Login / SignUp',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                   color: Colors.white,
//                   height: 100,
//                   width: 200,
//                 ),
//
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 50.0,vertical: 0.0),
//                   child: TextFormField(
//
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Number Required';
//                       }
//                       return null;
//                     },
//                     controller: usernameController,
//                     enableSuggestions: false,
//                     autocorrect: false,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your Mobile Number',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: const BorderSide(color: Colors.grey)),
//                     ),
//                   ),
//                 ),
//
//                 Container(
//                   child: Center(
//                     child: Text(
//                       '',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                   color: Colors.white,
//                   height: 300,
//
//
//
//
//                   width: 200,
//                 ),
//
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: FloatingActionButton(
//                         backgroundColor: Colors.purpleAccent,
//                         onPressed: () {
//                           FocusManager.instance.primaryFocus?.unfocus();
//                           if (_formKey.currentState!.validate()) {
//                             if (usernameController.text != '1234567890') {
//                               Fluttertoast.showToast(
//                                 msg: "Invalid Mobile Number",
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.CENTER,
//                                 timeInSecForIosWeb: 1,
//                               );
//                               return;
//                             }
//                             else{
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text('Signing you in..')),
//                               );
//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(builder: (context) => SearchScreen())
//                               // );
//                             }
//                           }
//                           else {
//
//                           }
//                         },
//                         child: Text('Login / SignUp'),
//                         shape: BeveledRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ],
//             ),
//           )),
//
//
//
//
//     );
//   }
// }
