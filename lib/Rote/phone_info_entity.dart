import 'package:flutter_demo/generated/json/base/json_convert_content.dart';

// To parse this JSON data, do
//
//     final phoneInfo = phoneInfoFromJson(jsonString);

import 'dart:convert';

PhoneInfo phoneInfoFromJson(String str) => PhoneInfo.fromJson(json.decode(str));

String phoneInfoToJson(PhoneInfo data) => json.encode(data.toJson());

class PhoneInfo {
	PhoneInfo({
		this.mts,
		this.province,
		this.catName,
		this.telString,
		this.areaVid,
		this.ispVid,
		this.carrier,
	});

	String mts;
	String province;
	String catName;
	String telString;
	String areaVid;
	String ispVid;
	String carrier;

	factory PhoneInfo.fromJson(Map<String, dynamic> json) => PhoneInfo(
		mts: json["mts"],
		province: json["province"],
		catName: json["catName"],
		telString: json["telString"],
		areaVid: json["areaVid"],
		ispVid: json["ispVid"],
		carrier: json["carrier"],
	);

	Map<String, dynamic> toJson() => {
		"mts": mts,
		"province": province,
		"catName": catName,
		"telString": telString,
		"areaVid": areaVid,
		"ispVid": ispVid,
		"carrier": carrier,
	};
}
