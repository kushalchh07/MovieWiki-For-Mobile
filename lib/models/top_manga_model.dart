import 'dart:convert';

class TopMangaModel {
  final Pagination pagination;
  final List<Datum> data;

  TopMangaModel({
    required this.pagination,
    required this.data,
  });

  factory TopMangaModel.fromJson(Map<String, dynamic> json) {
    return TopMangaModel(
      pagination: Pagination.fromJson(json['pagination']),
      data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Datum {
  final int malId;
  final String url;
  final Map<String, Image> images;
  final bool approved;
  final List<Title> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String> titleSynonyms;
  final DatumType type;
  final Status? status;
  final bool? publishing;
  final Published published;
  final double score;
  final double scored;
  final int scoredBy;
  final int rank;
  final int popularity;
  final int members;
  final int favorites;
  final String synopsis;
  final String background;
  final List<Author> authors;
  final List<Author> serializations;
  final List<Author> genres;
  final List<dynamic> explicitGenres;
  final List<Author> themes;
  final List<Author> demographics;

  Datum({
    required this.malId,
    required this.url,
    required this.images,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    this.status,
    this.publishing,
    required this.published,
    required this.score,
    required this.scored,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.authors,
    required this.serializations,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      malId: json['mal_id'],
      url: json['url'],
      images: Map.from(json['images']).map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
      approved: json['approved'],
      titles: List<Title>.from(json['titles'].map((x) => Title.fromJson(x))),
      title: json['title'],
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      titleSynonyms: List<String>.from(json['title_synonyms'].map((x) => x)),
      type: datumTypeValues.map[json['type']]!,
      status: json['status'] != null ? statusValues.map[json['status']]! : null,
      publishing: json['publishing'],
      published: Published.fromJson(json['published']),
      score: json['score'].toDouble(),
      scored: json['scored'].toDouble(),
      scoredBy: json['scored_by'],
      rank: json['rank'],
      popularity: json['popularity'],
      members: json['members'],
      favorites: json['favorites'],
      synopsis: json['synopsis'],
      background: json['background'],
      authors: List<Author>.from(json['authors'].map((x) => Author.fromJson(x))),
      serializations: List<Author>.from(json['serializations'].map((x) => Author.fromJson(x))),
      genres: List<Author>.from(json['genres'].map((x) => Author.fromJson(x))),
      explicitGenres: List<dynamic>.from(json['explicit_genres'].map((x) => x)),
      themes: List<Author>.from(json['themes'].map((x) => Author.fromJson(x))),
      demographics: List<Author>.from(json['demographics'].map((x) => Author.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': Map.from(images).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      'approved': approved,
      'titles': List<dynamic>.from(titles.map((x) => x.toJson())),
      'title': title,
      'title_english': titleEnglish,
      'title_japanese': titleJapanese,
      'title_synonyms': List<dynamic>.from(titleSynonyms.map((x) => x)),
      'type': datumTypeValues.reverse[type],
      'status': status != null ? statusValues.reverse[status!] : null,
      'publishing': publishing,
      // 'published': published.toJson(),
      'score': score,
      'scored': scored,
      'scored_by': scoredBy,
      'rank': rank,
      'popularity': popularity,
      'members': members,
      'favorites': favorites,
      'synopsis': synopsis,
      'background': background,
      'authors': List<dynamic>.from(authors.map((x) => x.toJson())),
      'serializations': List<dynamic>.from(serializations.map((x) => x.toJson())),
      'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
      'explicit_genres': List<dynamic>.from(explicitGenres.map((x) => x)),
      'themes': List<dynamic>.from(themes.map((x) => x.toJson())),
      'demographics': List<dynamic>.from(demographics.map((x) => x.toJson())),
    };
  }
}

class Author {
  final int malId;
  final AuthorType type;
  final String name;
  final String url;

  Author({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      malId: json['mal_id'],
      type: authorTypeValues.map[json['type']]!,
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': authorTypeValues.reverse[type],
      'name': name,
      'url': url,
    };
  }
}

enum AuthorType { MANGA, PEOPLE }

final authorTypeValues = EnumValues({
  'manga': AuthorType.MANGA,
  'people': AuthorType.PEOPLE,
});

class Image {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  Image({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      imageUrl: json['image_url'],
      smallImageUrl: json['small_image_url'],
      largeImageUrl: json['large_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl,
    };
  }
}

class Published {
  final DateTime from;
  // final DateTime to;
  // final Prop prop;
  final String string;

  Published({
    required this.from,
    // required this.to,
    // required this.prop,
    required this.string,
  });

  factory Published.fromJson(Map<String, dynamic> json) {
    return Published(
      from: DateTime.parse(json['from']),
      // to: DateTime.parse(json['to']),
      // prop: Prop.fromJson(json['prop']),
      string: json['string'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toIso8601String(),
      // 'to': to.toIso8601String(),
      // 'prop': prop.toJson(),
      'string': string,
    };
  }
}

class Prop {
  final From from;
  // final From to;

  Prop({
    required this.from,
    // required this.to,
  });

  factory Prop.fromJson(Map<String, dynamic> json) {
    return Prop(
      from: From.fromJson(json['from']),
      // to: From.fromJson(json['to']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toJson(),
      // 'to': to.toJson(),
    };
  }
}

class From {
  // final int day;
  final int month;
  final int year;

  From({
    // required this.day,
    required this.month,
    required this.year,
  });

  factory From.fromJson(Map<String, dynamic> json) {
    return From(
      // day: json['day'],
      month: json['month'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'day': day,
      'month': month,
      'year': year,
    };
  }
}

enum Status { FINISHED, ON_HIATUS, PUBLISHING }

final statusValues = EnumValues({
  'Finished': Status.FINISHED,
  'On Hiatus': Status.ON_HIATUS,
  'Publishing': Status.PUBLISHING,
});

class Title {
  final TitleType type;
  final String title;

  Title({
    required this.type,
    required this.title,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      type: titleTypeValues.map[json['type']]!,
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': titleTypeValues.reverse[type],
      'title': title,
    };
  }
}

enum TitleType { DEFAULT, ENGLISH, FRENCH, GERMAN, JAPANESE, SPANISH, SYNONYM }

final titleTypeValues = EnumValues({
  'Default': TitleType.DEFAULT,
  'English': TitleType.ENGLISH,
  'French': TitleType.FRENCH,
  'German': TitleType.GERMAN,
  'Japanese': TitleType.JAPANESE,
  'Spanish': TitleType.SPANISH,
  'Synonym': TitleType.SYNONYM,
});

enum DatumType { LIGHT_NOVEL, MANGA, MANHUA, NOVEL }

final datumTypeValues = EnumValues({
  'Light Novel': DatumType.LIGHT_NOVEL,
  'Manga': DatumType.MANGA,
  'Manhua': DatumType.MANHUA,
  'Novel': DatumType.NOVEL,
});

class Pagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final Items items;

  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      items: Items.fromJson(json['items']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_visible_page': lastVisiblePage,
      'has_next_page': hasNextPage,
      'current_page': currentPage,
      'items': items.toJson(),
    };
  }
}

class Items {
  final int count;
  final int total;
  final int perPage;

  Items({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      count: json['count'],
      total: json['total'],
      perPage: json['per_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'total': total,
      'per_page': perPage,
    };
  }
}

class EnumValues<T> {
  final Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// Sample usage
// void main() {
//   String jsonString = '''
//   {
//     "pagination": {
//       "last_visible_page": 10,
//       "has_next_page": true,
//       "current_page": 1,
//       "items": {
//         "count": 20,
//         "total": 200,
//         "per_page": 20
//       }
//     },
//     "data": [
//       {
//         "mal_id": 1,
//         "url": "https://myanimelist.net/manga/1",
//         "images": {
//           "jpg": {
//             "image_url": "https://cdn.myanimelist.net/images/manga/1.jpg",
//             "small_image_url": "https://cdn.myanimelist.net/images/manga/1_t.jpg",
//             "large_image_url": "https://cdn.myanimelist.net/images/manga/1_l.jpg"
//           }
//         },
//         "approved": true,
//         "titles": [
//           {
//             "type": "Default",
//             "title": "Manga Title"
//           }
//         ],
//         "title": "Manga Title",
//         "title_english": "Manga Title",
//         "title_japanese": "マンガタイトル",
//         "title_synonyms": ["Manga Synonym"],
//         "type": "Manga",
//         "chapters": 100,
//         "volumes": 10,
//         "status": "Finished",
//         "publishing": false,
//         "published": {
//           "from": "2000-01-01T00:00:00Z",
//           "to": "2010-01-01T00:00:00Z",
//           "prop": {
//             "from": {
//               "day": 1,
//               "month": 1,
//               "year": 2000
//             },
//             "to": {
//               "day": 1,
//               "month": 1,
//               "year": 2010
//             }
//           },
//           "string": "Jan 1, 2000 to Jan 1, 2010"
//         },
//         "score": 8.5,
//         "scored": 8.5,
//         "scored_by": 1000,
//         "rank": 1,
//         "popularity": 1,
//         "members": 1000,
//         "favorites": 500,
//         "synopsis": "This is a synopsis.",
//         "background": "This is a background.",
//         "authors": [
//           {
//             "mal_id": 1,
//             "type": "people",
//             "name": "Author Name",
//             "url": "https://myanimelist.net/people/1"
//           }
//         ],
//         "serializations": [
//           {
//             "mal_id": 1,
//             "type": "manga",
//             "name": "Serialization Name",
//             "url": "https://myanimelist.net/manga/1"
//           }
//         ],
//         "genres": [
//           {
//             "mal_id": 1,
//             "type": "manga",
//             "name": "Genre Name",
//             "url": "https://myanimelist.net/manga/1"
//           }
//         ],
//         "explicit_genres": [],
//         "themes": [
//           {
//             "mal_id": 1,
//             "type": "manga",
//             "name": "Theme Name",
//             "url": "https://myanimelist.net/manga/1"
//           }
//         ],
//         "demographics": [
//           {
//             "mal_id": 1,
//             "type": "manga",
//             "name": "Demographic Name",
//             "url": "https://myanimelist.net/manga/1"
//           }
//         ]
//       }
//     ]
//   }
//   ''';

//   // Deserialize JSON
//   TopMangaModel manga = TopMangaModel.fromJson(json.decode(jsonString));
//   print(manga.data[0].title); // Output: Manga Title

//   // Serialize to JSON
//   String jsonStringOutput = json.encode(manga.toJson());
//   print(jsonStringOutput);
// }
