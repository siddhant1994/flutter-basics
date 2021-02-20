import 'package:flutter/material.dart';
import 'package:flutter_application_1/player_selector/Models/Player.dart';
import 'package:flutter_application_1/player_selector/Models/PlayerList.dart';
import 'package:flutter_application_1/player_selector/Notifiers/PlayerListNotifer.dart';
import 'package:flutter_application_1/player_selector/Views/StatsScreen.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    // Provider.of<PlayerListNotifer>(context, listen: false).fetchPlayerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("in build method");
    return Scaffold(
      appBar: AppBar(
        title: Text("Player List"),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: (){
              Navigator.pushNamed(context, '/stats');
            }
          )
        ],
      ),
      body: Selector<PlayerListNotifer,bool>(
        selector: (context, model) => model.isLoading,
        builder: (context, isLoading, _) {
          if(isLoading){
            return _showLoader();
          }else{
            return _renderPlayerList();
          }
        }
      ),
    );
  }

  Widget _renderPlayerList(){
    print("in _renderPlayerList");
    final PlayerList _list = Provider.of<PlayerListNotifer>(context,listen: false).getPlayerList;
    final String team1 = Provider.of<PlayerListNotifer>(context,listen: false).team_1;

    return ListView.builder(
      itemBuilder: (BuildContext context,int index){
        print("in build itemBuilder");
        Player player = _list.list[index];
        return ListTile(
          leading: CircleAvatar(
            child:Text(player.tn[0]),
            backgroundColor: player.tn == team1 ? Colors.pink : Colors.purple
          ),
          title: Text(player.pfn),
          subtitle: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "Player price"),
                TextSpan(text: player.pr.toString())
              ], 
            )
          ),
          // trailing: Checkbox(  
          //   checkColor: Colors.greenAccent,  
          //   activeColor: Colors.red,  
          //   value: player.isSelected,  
          //   onChanged: (bool value) {  
          //     print(value);
          //   },  
          // ),
          // trailing: Switch(
          //   onChanged:(bool value){
          //       Provider.of<PlayerListNotifer>(context,listen: false).updatePlayer(index);
          //   },
          //   value:player.isSelected,
          //   activeColor:Colors.green
          // ),
          trailing : Consumer<PlayerListNotifer>(
              builder: (context, provider, _) {
              return Checkbox(
                value: player.isSelected,
                visualDensity: VisualDensity.compact,
                onChanged: provider.canSelect(player) == false ? null : (bool value){
                  value ? provider.updatePlayer(index) : provider.removePlayer(index);
                } 
              );
            },
          ),

          // tileColor: Colors.purple,
        );
      },
      itemCount: _list.list.length
    );
  }

  Widget _showLoader(){
    print("here");
    return Center(
      child: CircularProgressIndicator() 
    );
  }
}