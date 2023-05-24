import 'package:logger/logger.dart';
import 'package:mefit/services/services.dart';

class MFAdminAPI {
  static Future<MFNetworkResp> getTokenUser() async {
    try {
      var resp = await NetworkService.wrap('/account/owner');
      return MFNetworkResp.fromResp(resp.data);
    } catch (e) {
      Logger().e(e);
      return MFNetworkResp(
        isSuccessful: false,
        message: e.toString(),
        code: 500,
        time: DateTime.now(),
      );
    }
  }
}