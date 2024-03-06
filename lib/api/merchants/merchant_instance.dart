import 'package:DeCarbon/models/MerchantProfile.dart';

class MerchantInstance {
  MerchantProfile profile;

  static final MerchantInstance _instance = MerchantInstance._internal();

  factory MerchantInstance() {
    return _instance;
  }

  MerchantInstance._internal();

  static MerchantInstance get instance => _instance;
}
