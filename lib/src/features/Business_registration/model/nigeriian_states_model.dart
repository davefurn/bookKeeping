class NigerianStateModel {
  String state;
  String alias;
  List<String> lga;

  NigerianStateModel({
    required this.state,
    required this.alias,
    required this.lga,
  });

  static NigerianStateModel fromJson(Map<String, dynamic> data) {
    // var lgasFromJson = data['lgas'];
    // List<String> lgaList = lgasFromJson;
    return NigerianStateModel(
      state: data['state'],
      alias: data['alias'],
      lga: List<String>.from(data['lgas']) ,
    );
  }
}
