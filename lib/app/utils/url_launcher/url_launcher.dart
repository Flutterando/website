import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

// part 'url_launcher.g.dart';

@Injectable(singleton: false)
class UrlLauncher {
  Future<void> launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
