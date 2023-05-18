import 'package:artllery_mobile/features/authentication/services/auth_service.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

class MockResponse extends Mock implements Response {}

void main() {
  group("Login", () {
    // Contains all the methods from http.Client but we'll define the behaviour
    // we need in each test
    late MockClient client;

    // The auth service that we are currently testing
    late AuthService authService;

    String testUsername = 'test_user';
    String testPassword = 'test_password';

    // This url can be anything. Since we will be mocking it, we are in charge
    // of what our mock (server) will be returning. 
    String baseURL = "http://test_url.com";
    // This must match the path specified within the api service
    String endpoint = '/api/token/';
    Uri uri = Uri.parse('$baseURL$endpoint');

    // We determine what our 'server' will return in the test
    final responseBody = {
      'accessToken': 'fjalkfd;',
      'refreshToken': 'al;fdjakf',
    }.toString();

    // this setup method is called whenever we start a test within the login
    // group
    setUp(() {
      client = MockClient();
      authService = AuthService(client: client, baseURL: baseURL);
    });

    test(
      "An exception is thrown if the server returns a status code that is not 200",
      () async {
        // The mock response that the server will respond with. We will control
        // its properties based on what scenario we want to simulate.
        final mockResponse = MockResponse();

        // We want the http request to return our mock response created above
        // We therefore specify the parameters with similar values to what the
        // auth service will call.
        //
        // The any function is used to refer to any value passed that has the
        // name supplied as a parameter
        when(
          () => client.post(
            uri,
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          ),
        ).thenAnswer((invocation) async => mockResponse);

        // Since this test is testing for an exception, we will return a 
        // status code that is not 200 from the server
        when(() => mockResponse.statusCode).thenReturn(404);

        // The response body that will be gotten from the test server
        when(() => mockResponse.body).thenReturn(responseBody);

        // Here we compare what the authservice returns vs what we expect it to
        // return. Since we specified that the statusCode is 404, we expect it
        // to throw an exception
        expect(
          authService.loginUser(
            username: testUsername,
            password: testPassword,
          ),
          throwsException,
        );
      },
    );
  });

  group("SignUp", () {

    late MockClient client;
    late AuthService authService;

    var signUpData = {
      "first_name": "Felix",
      "username": "Prime",
      "email": "sichangi24@gmail.com",
      "password": "test_test",
    };

    String baseURL = "http://test_url.com";
    String endpoint = '/register/';
    Uri uri = Uri.parse('$baseURL$endpoint');

    final responseBody = {
      'accessToken': 'fjalkfd;',
      'refreshToken': 'al;fdjakf',
    }.toString();

    setUp(() {
      client = MockClient();
      authService = AuthService(client: client, baseURL: baseURL);
    });

    test("An exception is thrown if the server returns a status code that is not 200", () async{

      final mockResponse = MockResponse();

      when(
            () => client.post(
          uri,
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      ).thenAnswer((invocation) async => mockResponse);

      when(() => mockResponse.statusCode).thenReturn(404);

      when(() => mockResponse.body).thenReturn(responseBody);

      expect(
        authService.createUser(data: signUpData),
        throwsException,
      );

    });
  });
}
