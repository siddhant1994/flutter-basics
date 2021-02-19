class Matches {
  List<MatchObject> matches;

  Matches({this.matches});

  Matches.fromJson(Map<String, dynamic> json) {
    if (json['matches'] != null) {
      matches = [];
      json['matches'].forEach((v) {
        matches.add(new MatchObject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.matches != null) {
      data['matches'] = this.matches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MatchObject {
  String event_name;
  String venue_name;
  String event_state;
  String start_date;
  String game_id;
  List<Participants> participants;

  MatchObject({
    this.event_name,
    this.venue_name,
    this.event_state,
    this.start_date,
    this.game_id,
    this.participants
  });

  MatchObject.fromJson(Map<String, dynamic> json) {
    event_name = json['event_name'];
    venue_name = json['venue_name'];
    event_state = json['event_state'];
    start_date = json['start_date'];
    game_id = json['game_id'];
    if(json['participants'] != null){
      participants = [];
      json['participants'].forEach((v) {
        participants.add(new Participants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_name'] = this.event_name;
    data['venue_name'] = this.venue_name;
    data['event_state'] = this.event_state;
    data['start_date'] = this.start_date;
    data['game_id'] = this.game_id;
    data['participants'] = this.participants;
    return data;
  }
}

class Participants{
  String name;
  String short_name;
  String id;

  Participants({
    this.name,
    this.short_name,
    this.id,
  });

  Participants.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    short_name = json['short_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['short_name'] = this.short_name;
    data['id'] = this.id;
    return data;
  }
}