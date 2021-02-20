class Player{
  String pn;
  String tn;
  String pfn;
  int pid;
  double pr;
  bool isSelected;

  Player({
    this.pn,
    this.tn,
    this.pfn,
    this.pid,
    this.pr,
  });

  Player.fromJson(Map<String, dynamic> json) {
    pn = json['pn'];
    tn = json['tn'];
    pfn = json['pfn'];
    pid = json['pid'];
    pr = json['pr'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pn']=this.pn;
    data['pid']=this.pid;
    data['pfn']=this.pfn;
    data['tn']=this.tn;
    data['pr']=this.pr;
    return data;
  }

  toggleSelect(){
    isSelected = !isSelected;
  }
}