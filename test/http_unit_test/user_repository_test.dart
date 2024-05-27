import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/http_unit_test/user_model.dart';
import 'package:flutter_testing/http_unit_test/user_repository.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late UserRepository repository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    repository = UserRepository(client: mockHttpClient);
  });
  group("User respository - ", () {
    group("User get function", () {
      test(
          "given UserRepository class when getUser function is called gets expected model type and status code is 200",
          () async {
        when(
          () => mockHttpClient
              .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1")),
        ).thenAnswer((invocation) async {
          return Response('''
          {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "website": "hildegard.org"
            }
          ''', 200);
        });
        final res = await repository.getUser();
        expect(res, isA<User>());
      });

      test(
          "given UserRepository class when getUser function is called didn'tgets expected model type and status code is not 200",
          () async {
        when(() => mockHttpClient
                .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1")))
            .thenAnswer((invocation) async => Response('{}', 500));
        final res = repository.getUser();
        expect(res, throwsException);
      });
    });
  });
}
