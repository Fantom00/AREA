import 'dart:convert';

import 'package:http/http.dart' as http;
import 'main.dart';
import 'Data.model.dart';
import 'User.model.dart';
import 'config.dart';

Future<void> postData(Data data) async {
  print(jsonEncode(data.toJson()));
  final token = result?.accessToken ?? '';

  final response = await http.post(Uri.parse('http://$HOST:$PORT/api/app/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data.toJson()));

  if (response.statusCode != 200) {
    throw Exception('postData failed ' + response.body);
  }
}

Future<List<Data>> getData() async {
  // return <Data>[
  //   Data.fromJson(jsonDecode(
  //       '{"action":{"id":3,"title":"temperature superior than 10 degree","description":"action description"},"reaction":{"id":6,"title":"reaction title","description":"reaction description"},"_id":"6220fb2a5828089f443875ca","title":"titre","actionService":"github","reactionService":"discord","__v":0}')),
  //   Data.fromJson(jsonDecode(
  //       '{"action":{"id":3,"title":"action title","description":"action description"},"reaction":{"id":6,"title":"reaction title","description":"reaction description"},"_id":"62210800b8201ec3f2e79d4d","title":"2","actionService":"youtube","reactionService":"discord","__v":0}')),
  //   Data.fromJson(jsonDecode(
  //       '{"action":{"id":3,"title":"action title","description":"action description"},"reaction":{"id":6,"title":"reaction title","description":"reaction description"},"_id":"qfhqsfsdhfuoh","title":"3","actionService":"github","reactionService":"discord","__v":0}')),
  // ];
  final token = result?.accessToken ?? '';

  final response = await http.get(Uri.parse('http://$HOST:$PORT/api/app/'),
      headers: {'Authorization': 'Bearer $token'});

  if (response.statusCode == 200) {
    List<dynamic> json = jsonDecode(response.body);
    return json.fold<List<Data>>([], (value, element) {
      value.add(Data.fromJson(element));
      return value;
    });
  } else {
    throw Exception('getData failed: ' + response.body);
  }
}

Future<void> deleteData(String title) async {
  final token = result?.accessToken ?? '';

  final response = await http.delete(
      Uri.parse('http://$HOST:$PORT/api/app/$title'),
      headers: {'Authorization': 'Bearer $token'});

  if (response.statusCode != 200) {
    throw Exception('deleteData failed: ' + response.body);
  }
}

Future<Map<String, List<User>>> getUsers() async {
  final token = result?.accessToken ?? '';

  final response = await http.get(Uri.parse('http://$HOST:$PORT/api/app/'),
      headers: {'Authorization': 'Bearer $token'});
  print(token);
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(
        "{\"gods\": [{\"user_id\":\"auth0|61e988ac9c1c79006987f9ec\",\"email\":\"jason.fabiano@epitech.eu\",\"picture\":\"https://s.gravatar.com/avatar/8aba825f07309093513a6cc929b590a7?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fja.png\",\"name\": \"jason.fabiano@epitech.eu\"},{\"user_id\": \"google-oauth2|107525433011325483341\",\"email\": \"egirlabuser@gmail.com\",\"picture\": \"https://lh3.googleusercontent.com/a/AATXAJzGR1nZcVegrAqpPDqzTI4M5xxc9WU-Kjn7I9k=s96-c\",\"name\": \"Egirl Abuser\"}],\"plebs\":[{\"user_id\":\"auth0|61eff1647e72e700719e2804\",\"email\":\"jason.fabiano@free.fr\",\"picture\":\"https://s.gravatar.com/avatar/178b12da7ed2929d809808318645fa0c?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fja.png\",\"name\": \"jason.fabiano@free.fr\"},{\"user_id\":\"auth0|621788a358c5f70069b7fbc2\",\"email\":\"test@test.test\",\"picture\":\"https://s.gravatar.com/avatar/dd46a756faad4727fb679320751f6dea?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fte.png\",\"name\":\"test@test.test\"},{\"user_id\": \"auth0|62242877b495a5006935442a\", \"email\": \"lucas.migeon@epitech.eu\", \"picture\": \"https://s.gravatar.com/avatar/4aab459b3c45e2dae56ac6c93abc1810?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Flu.png\",\"name\": \"lucas.migeon@epitech.eu\"},{\"user_id\": \"google-oauth2|106659827330892337228\", \"email\": \"migeonl1@gmail.com\", \"picture\": \"https://lh3.googleusercontent.com/a-/AOh14Ghryp4IqIs5trqSJVFPiqkaYAyPacFBX9k9bPwy=s96-c\", \"name\": \"Lucas Migeon\"}]}");
    return <String, List<User>>{
      'gods': ((json['gods'] as List<dynamic>).fold<List<User>>([],
          (value, element) {
        value.add(User.fromJson(element));
        return value;
      })),
      'plebs': ((json['plebs'] as List<dynamic>).fold<List<User>>([],
          (value, element) {
        value.add(User.fromJson(element));
        return value;
      })),
    };
    // Map<String, dynamic> json = jsonDecode(response.body);
    // return <String, List<User>>{
    //   'gods': ((json['gods'] as List<dynamic>).fold<List<User>>([],
    //       (value, element) {
    //     value.add(User.fromJson(element));
    //     return value;
    //   })),
    //   'plebs': ((json['plebs'] as List<dynamic>).fold<List<User>>([],
    //       (value, element) {
    //     value.add(User.fromJson(element));
    //     return value;
    //   })),
    // };
  } else {
    throw Exception('getUsers failed: ' + response.body);
  }
}
