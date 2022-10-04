import 'package:http/http.dart' as http;

Future<http.Response> getDataFromApi() async {
  final header = {"authorization": "R29vZCBMdWNr"};

  const url = "https://finfree.app/demo";

  final uri = Uri.parse(url);
  final response = await http.get(
    uri,
    headers: header,
  );
  return response;
}
