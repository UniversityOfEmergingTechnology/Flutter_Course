

import 'package:url_launcher/url_launcher.dart';

final Uri _url1 = Uri.parse('https://en.wikipedia.org/wiki/Drake_(musician)');
final Uri _url2 = Uri.parse('https://drakerelated.com');

Future<void> launchUrl1() async {
  if (!await launchUrl(_url1)) {
    throw 'URL trigger failed';
  }
}
Future<void> launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw 'URL trigger failed';
  }
}