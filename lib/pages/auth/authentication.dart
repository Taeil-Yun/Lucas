import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticationSMS extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController smsCodeController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('auth'),
      ),
      body: SafeArea(
        child: GestureDetector(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: phoneNumController,
                ),
                TextField(
                  controller: smsCodeController,
                ),
                FlatButton(
                  child: const Text("Sign In")
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'get code',
        child: new Icon(Icons.send),
      ),
    );
  }
}

void createAccount(FirebaseAuth auth, String email, String password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print("User registered.");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
