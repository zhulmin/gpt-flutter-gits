import 'package:gpt_flutter/generated/json/base/json_field.dart';
import 'package:gpt_flutter/generated/json/resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class RespEntity<Model> {
	int? code;
	String? msg;
	Model? data;

	RespEntity();

	factory RespEntity.fromJson(Map<String, dynamic> json) => $RespEntityFromJson<Model>(json);

	Map<String, dynamic> toJson() => $RespEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class RespData {
	String? any;

	RespData();

	factory RespData.fromJson(Map<String, dynamic> json) => $RespDataFromJson(json);

	Map<String, dynamic> toJson() => $RespDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}