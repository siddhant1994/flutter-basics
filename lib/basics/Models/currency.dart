class CurrencyResponse{
  StatusMap status;
  List<Currency> data;

  CurrencyResponse({this.status,this.data});

  CurrencyResponse.fromJson(Map<String, dynamic> json) {
    status = StatusMap.fromJson(json['status']);
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(Currency.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    return data;
  }
}

class StatusMap{
  int elapsed;
  String timestamp;

  StatusMap({this.elapsed,this.timestamp});

  StatusMap.fromJson(Map<String, dynamic> json) {
    elapsed = json['elapsed'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elapsed'] = this.elapsed;
    data['timestamp'] = this.timestamp;
    return data;
  }

}

class Currency{
  String id;
  String slug;
  String name;
  String symbol;
  Metrics metrics;

  Currency({this.id, this.slug,this.name,this.symbol,this.metrics});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    metrics = Metrics.fromJson(json['metrics']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['metrics'] = this.metrics;
    return data;
  }
}

class Metrics{
  MarketData market_data;

  Metrics({this.market_data});
  
  Metrics.fromJson(Map<String, dynamic> json){
    market_data = MarketData.fromJson(json['market_data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['market_data'] = this.market_data;
    return data;
  }
}

class MarketData{
  double price_usd;
  double volume_last_24_hours;
  double percent_change_usd_last_24_hours;

  MarketData({this.price_usd, this.volume_last_24_hours,this.percent_change_usd_last_24_hours});

  MarketData.fromJson(Map<String, dynamic> json) {
    price_usd = json['price_usd'];
    volume_last_24_hours = json['volume_last_24_hours'];
    percent_change_usd_last_24_hours = json['percent_change_usd_last_24_hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_usd'] = this.price_usd;
    data['volume_last_24_hours'] = this.volume_last_24_hours;
    data['percent_change_usd_last_24_hours'] = this.percent_change_usd_last_24_hours;
    return data;
  }
}