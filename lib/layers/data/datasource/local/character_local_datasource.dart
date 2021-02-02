import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/character_data.dart';

abstract class CharacterLocalDatasource {
  Future<List<CharacterData>> getAllCharacters();

  Future<List<CharacterData>> cacheCharacterList(List<CharacterData> list);
}

const CACHE_CHATACTER_LIST = "CACHED_CHARACTER_LIST";

class CharacterLocalDatasourceImpl extends CharacterLocalDatasource {
  final SharedPreferences sharedPreferences;

  CharacterLocalDatasourceImpl({@required this.sharedPreferences});

  @override
  Future<List<CharacterData>> cacheCharacterList(List<CharacterData> list) {
    final jsonList = list.map((e) => json.encode(e.toJson())).toList();
    print("cacheCharacterList = $jsonList");
    sharedPreferences.setStringList(CACHE_CHATACTER_LIST, jsonList);
  }

  @override
  Future<List<CharacterData>> getAllCharacters() {
    final jsonList = sharedPreferences.getStringList(CACHE_CHATACTER_LIST);
    if (jsonList != null) {
      final data =
          jsonList.map((e) => CharacterData.fromJson(json.decode(e))).toList();
      return Future.value(data);
    } else {
      return Future.value(List<CharacterData>(0));
    }
  }
}
