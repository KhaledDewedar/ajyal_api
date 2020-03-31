import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final cardData;
  MainScreen({this.cardData});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    updateUI(cardData: widget.cardData);
  }

  List<Card> cards = [];

  void updateUI({dynamic cardData}) {
    for (int i = 0; i < cardData['events'].length; i++) {
      String title = cardData['events'][i]['title'];
      String imageURL = cardData['events'][i]['image'];
      String description = cardData['events'][i]['description'];
      String username = cardData['events'][i]['username'];
      String date = cardData['events'][i]['created_at'];

      cards.add(
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Image.network(imageURL),
                Text(
                  title,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 18.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      username,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      date,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView(
        children: cards,
      ),
    );
  }
}
