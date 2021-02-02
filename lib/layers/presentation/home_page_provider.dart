import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_provider_character/layers/domain/entities/character.dart';
import 'package:flutter_clean_architecture_provider_character/layers/domain/usecases/get_all_characters.dart';
import 'package:flutter/foundation.dart';

class HomePageProvider with ChangeNotifier {
  final GetAllCharacters _getAllCharacters;

  HomePageProvider({@required GetAllCharacters getAllCharacters})
      : _getAllCharacters = getAllCharacters;

  bool _isLoading = false;
  List<Character> _charactersList;
  String _error;

  bool get isLoading => _isLoading;
  List<Character> get charactersList => _charactersList;
  String get error => _error;

  Future<void> loadAllCharacters() async {
    _isLoading = true;
    notifyListeners();

    final result = await _getAllCharacters.getAllCharacters();

    result.fold((e) {
      _error = "fail";
      _isLoading = false;
    }, (list) {
      _charactersList = list;
      _isLoading = false;
    });

    notifyListeners();
  }
}
