import 'package:flutter_demo/Rote/phone_info_entity.dart';

phoneInfoEntityFromJson(PhoneInfoEntity data, Map<String, dynamic> json) {
	if (json['mts'] != null) {
		data.mts = json['mts'].toString();
	}
	if (json['province'] != null) {
		data.province = json['province'].toString();
	}
	if (json['catName'] != null) {
		data.catName = json['catName'].toString();
	}
	if (json['telString'] != null) {
		data.telString = json['telString'].toString();
	}
	if (json['areaVid'] != null) {
		data.areaVid = json['areaVid'].toString();
	}
	if (json['ispVid'] != null) {
		data.ispVid = json['ispVid'].toString();
	}
	if (json['carrier'] != null) {
		data.carrier = json['carrier'].toString();
	}
	return data;
}

Map<String, dynamic> phoneInfoEntityToJson(PhoneInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mts'] = entity.mts;
	data['province'] = entity.province;
	data['catName'] = entity.catName;
	data['telString'] = entity.telString;
	data['areaVid'] = entity.areaVid;
	data['ispVid'] = entity.ispVid;
	data['carrier'] = entity.carrier;
	return data;
}