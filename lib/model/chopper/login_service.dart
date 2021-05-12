import 'package:chopper/chopper.dart';
import '../../globals.dart';
import '../../model/response/login.dart';

import 'json_to_type_converter.dart';

part 'login_service.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class LoginService extends ChopperService {
  @Post(path: '/login')
  @FormUrlEncodedConverter()
  Future<Response<LoginResponse>> login(
      @Field('username') String username, @Field('password') String password);

  static LoginService create() {
    var client = ChopperClient(
      baseUrl: Globals.baseUrl,
      converter: JsonToTypeConverter(
          {LoginResponse: (json) => LoginResponse.fromJson(json)}),
      services: [
        _$LoginService(),
      ],
    );
    return _$LoginService(client);
  }
}
