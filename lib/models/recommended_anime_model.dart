import 'dart:convert';

class RecommendedAnimeModel {
  final Pagination pagination;
  final List<Datumm> data;

  RecommendedAnimeModel({
    required this.pagination,
    required this.data,
  });

  factory RecommendedAnimeModel.fromJson(Map<String, dynamic> json) {
    return RecommendedAnimeModel(
      pagination: Pagination.fromJson(json['pagination']),
      data: List<Datumm>.from(json['data'].map((x) => Datumm.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Datumm {
  final String malId;
  final List<Entry> entry;
  final String content;
  final DateTime date;
  final User user;

  Datumm({
    required this.malId,
    required this.entry,
    required this.content,
    required this.date,
    required this.user,
  });

  factory Datumm.fromJson(Map<String, dynamic> json) {
    return Datumm(
      malId: json['mal_id'],
      entry: List<Entry>.from(json['entry'].map((x) => Entry.fromJson(x))),
      content: json['content'],
      date: DateTime.parse(json['date']),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'entry': List<dynamic>.from(entry.map((x) => x.toJson())),
      'content': content,
      'date': date.toIso8601String(),
      'user': user.toJson(),
    };
  }
}

class Entry {
  final int malId;
  final String url;
  final Map<String, Image> images;
  final String title;

  Entry({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      malId: json['mal_id'],
      url: json['url'],
      images: Map.from(json['images']).map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': Map.from(images).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      'title': title,
    };
  }
}

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

class User {
  final String url;
  final String username;

  User({
    required this.url,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      url: json['url'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'username': username,
    };
  }
}

class Pagination {
  final int lastVisiblePage;
  final bool hasNextPage;

  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_visible_page': lastVisiblePage,
      'has_next_page': hasNextPage,
    };
  }
}

// Sample usage
// void main() {
//   String jsonString = '''
//   {
//     "pagination": {
//       "last_visible_page": 10,
//       "has_next_page": true
//     },
//     "data": [
//       {
//         "mal_id": "1",
//         "entry": [
//           {
//             "mal_id": 1,
//             "url": "https://myanimelist.net/anime/1",
//             "images": {
//               "jpg": {
//                 "image_url": "https://cdn.myanimelist.net/images/anime/1.jpg",
//                 "small_image_url": "https://cdn.myanimelist.net/images/anime/1_t.jpg",
//                 "large_image_url": "https://cdn.myanimelist.net/images/anime/1_l.jpg"
//               }
//             },
//             "title": "Anime Title"
//           }
//         ],
//         "content": "This is a recommendation content.",
//         "date": "2022-01-01T00:00:00Z",
//         "user": {
//           "url": "https://myanimelist.net/user/1",
//           "username": "username"
//         }
//       }
//     ]
//   }
//   ''';

//   // Deserialize JSON
//   RecommendedAnimeModel animeModel = RecommendedAnimeModel.fromJson(json.decode(jsonString));
//   print(animeModel.data[0].content); // Output: This is a recommendation content.

//   // Serialize to JSON
//   String jsonStringOutput = json.encode(animeModel.toJson());
//   print(jsonStringOutput);
// }
