
import 'package:flutter/material.dart';
import 'package:flutter_application_1/player_selector/Models/Player.dart';
import 'package:flutter_application_1/player_selector/Notifiers/PlayerListNotifer.dart';
import 'package:provider/provider.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("in build of Statsscreen");
    return Scaffold(
      appBar: AppBar(title: Text("Stats")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Selected Players Budget",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Selector<PlayerListNotifer, double>(
                selector: (_, model) => model.getUserBudget(),
                builder: (context, userBudget, _) {
                  print("in build of Budget Line");
                  return Text(
                    '$userBudget',
                    style: Theme.of(context).textTheme.subtitle1,
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Selected Players Count",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Selector<PlayerListNotifer, List<Player>>(
                selector: (_, model) => model.selected,
                builder: (context, selectedPlayers, _) {
                  print("in build of Budget Line");
                  int len = selectedPlayers.length;
                  return Text(
                    '$len',
                    style: Theme.of(context).textTheme.subtitle1,
                  );
                }
              ),
            ),
          ],
        ),
      )
    );
  }
}