import 'package:flutter/material.dart';
import 'package:ajyalapi/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ajyalapi/screens/main_screen.dart';

const String url = 'http://api.ajyal.blog/api/events';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  NetworkHelper networkHelper = NetworkHelper(url: url);

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var data = await networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MainScreen(
            cardData: data,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.teal,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
