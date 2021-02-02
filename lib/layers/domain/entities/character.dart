import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String created;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.image,
    this.created,
  });

  @override
  List<Object> get props => throw UnimplementedError();
}
