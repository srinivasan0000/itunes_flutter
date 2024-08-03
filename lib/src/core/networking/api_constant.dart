class ApiConstant {
  ApiConstant._();
  static const baseUrl = "https://itunes.apple.com/";
  
  // static const baseUrl = String.fromEnvironment('baseUrl');
  // flutter build apk --release --dart-define=BASE_URL=$BASE_URL

  static const search = "search";
}

class RequestConstants {
  RequestConstants._();
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 100;
  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };
}
