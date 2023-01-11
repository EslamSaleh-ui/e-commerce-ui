// ignore_for_file: missing_return
import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:task/customs/two_addresses.dart';
import 'package:mockito/annotations.dart';
import 'package:task/widgets/app_widget.dart';
import 'test.mocks.dart';

@GenerateMocks([http.Client])

void main()
{
  testWidgets('description', (tester)async {
    await tester.pumpWidget(GetMaterialApp(home:  MyApp()  ));
    expect(find.byType(two_addresses), findsOneWidget);
  });
test('description 1', () async {
  final client=MockClient();
  when(client.get(Uri.parse('https://raw.githubusercontent.com/eslamsalehtaha/mock/main/db.json'))
  ).thenAnswer((realInvocation)async=>http.Response('[{"id":1,"user_name":"ALI","home_address":" ","office_address":" "}]',200));
  verifyNever(client.get(Uri.parse('https://raw.githubusercontent.com/eslamsalehtaha/mock/main/db.json')));
});

}