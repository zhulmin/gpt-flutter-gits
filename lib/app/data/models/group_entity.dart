import 'package:gpt_flutter/app/data/models/question_entity.dart';
import 'package:gpt_flutter/generated/json/base/json_field.dart';
import 'package:gpt_flutter/generated/json/group_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class GroupEntity {
	String? title;
	List<QuestionEntity>? questions;
  int? color;
  String? iconUrl;
	GroupEntity();

	factory GroupEntity.fromJson(Map<String, dynamic> json) => $GroupEntityFromJson(json);

	Map<String, dynamic> toJson() => $GroupEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}