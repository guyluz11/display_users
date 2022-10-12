import 'package:http/http.dart';

class RandomDataApi {
  Future<String> getUsrts({int numberOfUsersToGet = 100}) async {
    final Response response = await get(Uri.parse(
        'https://random-data-api.com/api/v2/users?size=$numberOfUsersToGet'));

    return response.body;
  }
}
