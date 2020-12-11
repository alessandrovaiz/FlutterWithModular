abstract class IAuthRepository {
  Future getUser();
  Future getLogin();
  Future<String> getToken();
  // Future getGoogleLogin();
  // Future getFacebookLogin();
  // Future getEmailPasswordLogin();
}
