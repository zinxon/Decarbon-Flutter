import 'package:DeCarbon/config/Env.dart';

void main() => Main();

class Main extends Env {
  final String appName = "DeCarbon";
  final String baseUrl = 'https://api.dev.website.org';
  EnvType environmentType = EnvType.DEVELOPMENT;
}
