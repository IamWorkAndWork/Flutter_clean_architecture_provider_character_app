import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_provider_character/commons/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_provider_character/layers/data/repositories/character_repository.dart';
import 'package:flutter_clean_architecture_provider_character/layers/domain/entities/character.dart';

abstract class GetAllCharacters {
  Future<Either<Failure, List<Character>>> getAllCharacters();
}

class GetAllCharactersImpl extends GetAllCharacters {
  final CharacterRepository charactersRepository;

  GetAllCharactersImpl({this.charactersRepository});

  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() {
    return charactersRepository.getAllCharacters();
  }
}
