import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_provider_character/commons/exceptions/exception.dart';
import 'package:http/http.dart' as http;

import '../../models/character_data.dart';

abstract class CharacterNetworkDatasource {
  Future<List<CharacterData>> getAllCharacters();
}

class CharacterNetworkDatasourceImpl extends CharacterNetworkDatasource {
  final http.Client client;

  CharacterNetworkDatasourceImpl({@required this.client});

  @override
  Future<List<CharacterData>> getAllCharacters() async {
    final response = await client.get(
        "https://rickandmortyapi.com/api/character/",
        headers: {'Content-type': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> infoAndResult = json.decode(response.body);
      List<dynamic> result = infoAndResult['results'];

      List<CharacterData> charactersList = List();
      for (Map<String, dynamic> item in result) {
        charactersList.add(CharacterData.fromJson(item));
      }
      return charactersList;
    } else {
      throw ServerException();
    }
  }
}
