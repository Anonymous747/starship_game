import 'package:flutter/material.dart';
import 'package:starship_game/widgets/game_page.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            child: Text('Start'),
            color: Colors.red,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GameWidget()));
            },
          ),
          MaterialButton(
            child: Text('Options'),
            color: Colors.green,
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('Exit'),
            color: Colors.blue,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
