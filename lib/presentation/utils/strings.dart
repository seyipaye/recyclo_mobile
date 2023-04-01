import '../../main.dart';

const String stagingDomain = 'https://smart-backend.onrender.com';
const String liveDomain =
    'https://smart-backend.onrender.com'; //'http://0.0.0.0:4455';

const String stagingURL = "$stagingDomain/api/v1";
const String liveURL = '$liveDomain/api/v1';

class AppStrings {
  // static const String noRouteFound = "No Route Found";
  static String get baseUrl => appDebugMode.value ? stagingURL : liveURL;
  static String get baseDomain =>
      appDebugMode.value ? stagingDomain : liveDomain;
}

const String kUrl = 'https://picsum.photos/200/200';

const int kCripsExpiryTime = 1; // In hours

const String cripsID = '8f23541e-0518-4659-ba4f-7cda9aa5ac68';

const String googleMapsAPIKey = "AIzaSyB-_DDU0TQKu5wWEKybt1VkM-1VbXVIDl8";
