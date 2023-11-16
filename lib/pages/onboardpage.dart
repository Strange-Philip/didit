import 'package:appwrite/appwrite.dart';
import 'package:didit/componets/primarybutton.dart';
import 'package:didit/pages/selectavatar.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  void initState() {
  
Client client = Client();
client
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('6513164593125fc7b1c0')
    .setSelfSigned(status: true); 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 50),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/onboard.png'), fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: PrimaryButton(
              title: "Sign in with Google",
              ontap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SelectAvatar()));
              }),
        ),
      ),
    );
  }
}
