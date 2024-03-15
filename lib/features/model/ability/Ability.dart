// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'Ability.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AbilitySlot {
  final Ability? ability;

  AbilitySlot(this.ability);

  factory AbilitySlot.fromJson(Map<String, dynamic> json) =>
      _$AbilitySlotFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitySlotToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Ability {
  final String? name;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Ability(this.name);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}
