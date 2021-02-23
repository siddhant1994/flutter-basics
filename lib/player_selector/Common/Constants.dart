class Constants{
  static final Map BUSTERS_API_MAP = {
    "/create_team": [
      "/get_team",
      "/get_team1",
      "/get_team2",
      "/get_team3"
    ],
    "/some_update_api" : [
      "/get_update"
    ]
  };

  static final String PROTOCALL = "http";

  static final String BASE_URL = "localhost:3000";

  static final Map DEFAULT_HEADERS = {
    "token" : "some_value"
  };
}