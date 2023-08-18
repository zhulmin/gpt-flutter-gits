import 'package:gpt_flutter/generated/json/base/json_field.dart';
import 'package:gpt_flutter/generated/json/question_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class QuestionEntity {
	String? content;
  String? id;
  String? answer;

	QuestionEntity();

	factory QuestionEntity.fromJson(Map<String, dynamic> json) => $QuestionEntityFromJson(json);

	Map<String, dynamic> toJson() => $QuestionEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

  map(Null Function(dynamic e) param0) {}
}