import 'package:microsoft_teams_clone/config/constants.dart';
import 'package:microsoft_teams_clone/provider/google_signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ],
        builder: (context, _) => Scaffold(
          appBar: AppBar(
            title: Text('Microsoft Teams'),
          ),
          body: Center(child: buildSignIn(context)),
        ),
      );

  Widget buildSignIn(BuildContext context) => OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          primary: Colors.black,
          shape: StadiumBorder(),
          padding: EdgeInsets.all(20),
        ),
        label: Text(
          'Sign In With Google',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        icon: FaIcon(FontAwesomeIcons.google, color: appPurpleColor),
        onPressed: () {
          log("karan: Tap works");
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.login();
        },
      );
}