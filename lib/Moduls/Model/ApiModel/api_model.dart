class ApiModel {
  Map name;
  String flag;
  String startOfWeek;
  String region;
  Map maps;
  Map flags;
  Map coatOfArms;
  ApiModel({
    required this.name,
    required this.flag,
    required this.region,
    required this.startOfWeek,
    required this.maps,
    required this.flags,
    required this.coatOfArms,
  });

  factory ApiModel.fromApi({required data}) {
    return ApiModel(
      name: data['name'],
      flag: data['flag'],
      region: data['region'],
      startOfWeek: data['startOfWeek'],
      maps: data['maps'],
      flags: data['flags'],
      coatOfArms: data['coatOfArms'],
    );
  }
}
