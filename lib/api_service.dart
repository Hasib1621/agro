import 'dart:convert';
import 'dart:io';

class ApiService {
  Future<Map<String, dynamic>> createInfos(var infos) async {
    Map<String, dynamic> map = {};
    try {
      HttpClient httpClient = HttpClient();
      // HttpClientRequest request = await httpClient
      //     .postUrl(Uri.parse("http://shomoyerp.com/erp/gpslogin.php"));

      HttpClientRequest request =
          await httpClient.postUrl(Uri.parse("http://hrm.ndebd.com"));

      Map data = {
        //'idcode': infos.idcode.substring(0, 3) + infos.idcode.substring(4),
        'idcode': infos.idcode,
        'api_license': infos.api_license,
        'datetime': infos.datetime,
        'gps_lon': infos.gps_lon,
        'gps_lat': infos.gps_lat,
        'login_status': infos.login_status
      };
      //print(data);
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(data)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      var jsonreply = jsonDecode(reply);

      //print(jsonreply);
      httpClient.close();
      map = json.decode(reply);
      //print(map);
      if (jsonreply['error'] != null) {
        map = {'error': jsonreply['error']};
      }
      //print(map);
    } catch (e) {
      //print(e);
      map = {
        'error':
            'Something Went Wrong. It may be the cause of a bad internet connection or other problems! Please check the internet connection!'
      };
    }
    print(map);
    return map;
  }
}
