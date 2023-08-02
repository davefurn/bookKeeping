class AllAcountingIndustriesModel {
  final int id;
  final String dateCreated;
  final String dateUpdated;
  final String? name;
  final Category categoryl;

  AllAcountingIndustriesModel({
    required this.categoryl,
    required this.id,
    required this.dateCreated,
    required this.dateUpdated,
    required this.name,
  });

  factory AllAcountingIndustriesModel.fromJson(Map<String, dynamic> data) {
    return AllAcountingIndustriesModel(
      id: data['id'],
      name: data['name'],
      dateCreated: DateTime(
        DateTime.parse(data['date_created']).year,
        DateTime.parse(data['date_created']).month,
        DateTime.parse(data['date_created']).day,
      ).toString(),
      dateUpdated: DateTime(
        DateTime.parse(data['date_updated']).year,
        DateTime.parse(data['date_updated']).month,
        DateTime.parse(data['date_updated']).day,
      ).toString(), 
      categoryl: Category.fromJson(data['category']),
    );
  }
}

class Category {
  final int id;
  final String dateCreated;
  final String dateUpdated;
  final String? title;

  Category({
    required this.id,
    required this.dateCreated,
    required this.dateUpdated,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      title: data['title'],
      dateCreated: DateTime(
        DateTime.parse(data['date_created']).year,
        DateTime.parse(data['date_created']).month,
        DateTime.parse(data['date_created']).day,
      ).toString(),
      dateUpdated: DateTime(
        DateTime.parse(data['date_updated']).year,
        DateTime.parse(data['date_updated']).month,
        DateTime.parse(data['date_updated']).day,
      ).toString(),
    );
  }
}
