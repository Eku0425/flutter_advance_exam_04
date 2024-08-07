class Newsmodal {
  late String status;
  List<Sources> sources = [];

  Newsmodal({required this.status, required this.sources});

  factory Newsmodal.fromJson(Map m1) {
    return Newsmodal(
        status: m1['status'],
        sources:
            (m1['sources'] as List).map((e) => Sources.fromJson(e)).toList());
  }
}

class Sources {
  late String id, name, description, url, category, language, country;

  Sources(
      {required this.id,
      required this.name,
      required this.description,
      required this.url,
      required this.category,
      required this.language,
      required this.country});

  factory Sources.fromJson(Map m1) {
    return Sources(
        id: m1['id'],
        name: m1['name'],
        description: m1['description'],
        url: m1['url'],
        category: m1['category'],
        language: m1['language'],
        country: m1['country']);
  }
}
