Map<String, dynamic> kConvertModel(Map<String, dynamic> json) {
  Map<String, dynamic> result = {};
  for (var key in json.keys) {
    if (key == '_id') {
      var value = json[key];
      result['id'] = value;
    } else {
      result[key] = json[key];
    }
  }
  return result;
}

Map<String, dynamic>? kQueryJson(Map<String, dynamic>? json) {
  if (json == null) return null;
  Map<String, dynamic> result = {};
  for (var key in json.keys) {
    var value = json[key];
    if (value == null) continue;
    result[key] = json[key];
  }
  return result;
}
