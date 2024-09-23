import 'package:compass_app/data/services/api/auth_api_client.dart';
import 'package:compass_app/data/services/api/model/login_request/login_request.dart';
import 'package:compass_app/data/services/api/model/login_response/login_response.dart';
import 'package:compass_app/utils/result.dart';

class FakeAuthApiClient implements AuthApiClient {
  @override
  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    if (loginRequest.email == 'EMAIL' && loginRequest.password == 'PASSWORD') {
      return Result.ok(const LoginResponse(token: 'TOKEN', userId: '123'));
    }
    return Result.error(Exception('ERROR!'));
  }
}
