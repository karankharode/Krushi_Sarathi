import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Krushi_Sarathi/authService.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  static const routename = '/authscreen';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  String smsCode;
  String verificationCode;
  String number;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'http://clipart-library.com/images/rcjrpdX5i.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.1,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://image.freepik.com/free-vector/vegan-friendly-leaves-label-green-color_1017-25452.jpg',
                ),
                radius: height * 0.15,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    number = "+91" + val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    prefixText: '+91',
                    prefixIcon: Icon(
                      EvaIcons.messageSquare,
                      color: Colors.green[900],
                    ),
                    hintText: "Enter Phone Number",
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              ButtonTheme(
                height: 50,
                minWidth: width * 0.2,
                child: (_isLoading)
                    ? CircularProgressIndicator()
                    : RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          _submit();
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        label: Text("Send code"),
                        color: Colors.black,
                        textColor: Colors.white,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    setState(() {
      _isLoading = true;
    });
    final PhoneVerificationCompleted verificationSuccess =
        (AuthCredential credential) {
      setState(() {
        print("Verification");
        print(credential);
      });
    };

    final PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException exception) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
          msg: 'Something went wrong try again later!!',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 15.0);
      print("${exception.message}");
    };
    final PhoneCodeSent phoneCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationCode = verId;
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
          msg: 'OTP send!!!',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 15.0);
      smsCodeDialog(context).then((value) => print("Signed In"));
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      this.verificationCode = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.number,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationSuccess,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Enter Code",
              style: TextStyle(
                color: Colors.green[900],
              ),
            ),
            content: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Verify",
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance.authStateChanges().listen((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() async {
    AuthCredential phoneAuthCredential = PhoneAuthProvider.getCredential(
        verificationId: verificationCode, smsCode: smsCode);
    var user = await AuthServices().signIn(phoneAuthCredential);
    try {
      if (user != null) {
        Navigator.of(context).pushNamed(HomePage.routename);
      }
    } catch (e) {
      print(e);
    }
  }
}

//run code
