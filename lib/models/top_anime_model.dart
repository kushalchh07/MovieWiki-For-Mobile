import 'dart:convert';

class TopAnimesModel {
  final Pagination pagination;
  final List<Datum> data;

  TopAnimesModel({
    required this.pagination,
    required this.data,
  });

  factory TopAnimesModel.fromJson(Map<String, dynamic> json) {
    return TopAnimesModel(
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
  final Trailer trailer;
  final bool approved;
  final List<Title> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String> titleSynonyms;
  final DatumType type;
  final String source;
  final int episodes;
  final Status status;
  final bool airing;
  final Aired aired;
  final String duration;
  final Rating rating;
  final double score;
  final int scoredBy;
  final int rank;
  final int popularity;
  final int members;
  final int favorites;
  final String synopsis;
  final String? background;
  final Season season;
  final int year;
  final Broadcast broadcast;
  final List<Demographic> producers;
  final List<Demographic> licensors;
  final List<Demographic> studios;
  final List<Demographic> genres;
  final List<dynamic> explicitGenres;
  final List<Demographic> themes;
  final List<Demographic> demographics;

  Datum({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      malId: json['mal_id'] ?? 0,
      url: json['url'] ?? '',
      images: (json['images'] as Map<String, dynamic>).map((k, v) => MapEntry(k, Image.fromJson(v))),
      trailer: Trailer.fromJson(json['trailer']),
      approved: json['approved'] ?? false,
      titles: List<Title>.from(json['titles'].map((x) => Title.fromJson(x))),
      title: json['title'] ?? '',
      titleEnglish: json['title_english'] ?? '',
      titleJapanese: json['title_japanese'] ?? '',
      titleSynonyms: List<String>.from(json['title_synonyms']),
      type: DatumType.values.firstWhere((e) => e.toString() == 'DatumType.${json['type']}'),
      source: json['source'] ?? '',
      episodes: json['episodes'] ?? 0,
      status: Status.values.firstWhere((e) => e.toString() == 'Status.${json['status']}'),
      airing: json['airing'] ?? false,
      aired: Aired.fromJson(json['aired']),
      duration: json['duration'] ?? '',
      rating: Rating.values.firstWhere((e) => e.toString() == 'Rating.${json['rating']}'),
      score: json['score']?.toDouble() ?? 0.0,
      scoredBy: json['scored_by'] ?? 0,
      rank: json['rank'] ?? 0,
      popularity: json['popularity'] ?? 0,
      members: json['members'] ?? 0,
      favorites: json['favorites'] ?? 0,
      synopsis: json['synopsis'] ?? '',
      background: json['background'] ?? '',
      season: Season.values.firstWhere((e) => e.toString() == 'Season.${json['season']}'),
      year: json['year'] ?? 0,
      broadcast: Broadcast.fromJson(json['broadcast']),
      producers: List<Demographic>.from(json['producers'].map((x) => Demographic.fromJson(x))),
      licensors: List<Demographic>.from(json['licensors'].map((x) => Demographic.fromJson(x))),
      studios: List<Demographic>.from(json['studios'].map((x) => Demographic.fromJson(x))),
      genres: List<Demographic>.from(json['genres'].map((x) => Demographic.fromJson(x))),
      explicitGenres: List<dynamic>.from(json['explicit_genres']),
      themes: List<Demographic>.from(json['themes'].map((x) => Demographic.fromJson(x))),
      demographics: List<Demographic>.from(json['demographics'].map((x) => Demographic.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.map((k, v) => MapEntry(k, v.toJson())),
      'trailer': trailer.toJson(),
      'approved': approved,
      'titles': List<dynamic>.from(titles.map((x) => x.toJson())),
      'title': title,
      'title_english': titleEnglish,
      'title_japanese': titleJapanese,
      'title_synonyms': List<dynamic>.from(titleSynonyms.map((x) => x)),
      'type': type.toString().split('.').last,
      'source': source,
      'episodes': episodes,
      'status': status.toString().split('.').last,
      'airing': airing,
      'aired': aired.toJson(),
      'duration': duration,
      'rating': rating.toString().split('.').last,
      'score': score,
      'scored_by': scoredBy,
      'rank': rank,
      'popularity': popularity,
      'members': members,
      'favorites': favorites,
      'synopsis': synopsis,
      'background': background,
      'season': season.toString().split('.').last,
      'year': year,
      'broadcast': broadcast.toJson(),
      'producers': List<dynamic>.from(producers.map((x) => x.toJson())),
      'licensors': List<dynamic>.from(licensors.map((x) => x.toJson())),
      'studios': List<dynamic>.from(studios.map((x) => x.toJson())),
      'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
      'explicit_genres': List<dynamic>.from(explicitGenres.map((x) => x)),
      'themes': List<dynamic>.from(themes.map((x) => x.toJson())),
      'demographics': List<dynamic>.from(demographics.map((x) => x.toJson())),
    };
  }
}

class Aired {
  final DateTime from;
  final DateTime to;
  final Prop prop;
  final String string;

  Aired({
    required this.from,
    required this.to,
    required this.prop,
    required this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) {
    return Aired(
      from: DateTime.parse(json['from']),
      to: DateTime.parse(json['to']),
      prop: Prop.fromJson(json['prop']),
      string: json['string'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toIso8601String(),
      'to': to.toIso8601String(),
      'prop': prop.toJson(),
      'string': string,
    };
  }
}

class Prop {
  final From from;
  final From to;

  Prop({
    required this.from,
    required this.to,
  });

  factory Prop.fromJson(Map<String, dynamic> json) {
    return Prop(
      from: From.fromJson(json['from']),
      to: From.fromJson(json['to']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toJson(),
      'to': to.toJson(),
    };
  }
}

class From {
  final int day;
  final int month;
  final int year;

  From({
    required this.day,
    required this.month,
    required this.year,
  });

  factory From.fromJson(Map<String, dynamic> json) {
    return From(
      day: json['day'] ?? 0,
      month: json['month'] ?? 0,
      year: json['year'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'month': month,
      'year': year,
    };
  }
}

class Broadcast {
  final String day;
  final String time;
  final Timezone timezone;
  final String string;

  Broadcast({
    required this.day,
    required this.time,
    required this.timezone,
    required this.string,
  });

  factory Broadcast.fromJson(Map<String, dynamic> json) {
    return Broadcast(
      day: json['day'] ?? '',
      time: json['time'] ?? '',
      timezone: Timezone.values.firstWhere((e) => e.toString() == 'Timezone.${json['timezone']}'),
      string: json['string'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'time': time,
      'timezone': timezone.toString().split('.').last,
      'string': string,
    };
  }
}

class Demographic {
  final int malId;
  final DemographicType type;
  final String name;
  final String url;

  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Demographic.fromJson(Map<String, dynamic> json) {
    return Demographic(
      malId: json['mal_id'] ?? 0,
      type: DemographicType.values.firstWhere((e) => e.toString() == 'DemographicType.${json['type']}'),
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type.toString().split('.').last,
      'name': name,
      'url': url,
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
      imageUrl: json['image_url'] ?? '',
      smallImageUrl: json['small_image_url'] ?? '',
      largeImageUrl: json['large_image_url'] ?? '',
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

class Trailer {
  final String youtubeId;
  final String url;
  final String embedUrl;
  final Images images;

  Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
    required this.images,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      youtubeId: json['youtube_id'] ?? '',
      url: json['url'] ?? '',
      embedUrl: json['embed_url'] ?? '',
      images: Images.fromJson(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'youtube_id': youtubeId,
      'url': url,
      'embed_url': embedUrl,
      'images': images.toJson(),
    };
  }
}

class Images {
  final String imageUrl;
  final String smallImageUrl;
  final String mediumImageUrl;
  final String largeImageUrl;
  final String maximumImageUrl;

  Images({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
    required this.maximumImageUrl,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      imageUrl: json['image_url'] ?? '',
      smallImageUrl: json['small_image_url'] ?? '',
      mediumImageUrl: json['medium_image_url'] ?? '',
      largeImageUrl: json['large_image_url'] ?? '',
      maximumImageUrl: json['maximum_image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'medium_image_url': mediumImageUrl,
      'large_image_url': largeImageUrl,
      'maximum_image_url': maximumImageUrl,
    };
  }
}

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
      lastVisiblePage: json['last_visible_page'] ?? 0,
      hasNextPage: json['has_next_page'] ?? false,
      currentPage: json['current_page'] ?? 0,
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
      count: json['count'] ?? 0,
      total: json['total'] ?? 0,
      perPage: json['per_page'] ?? 0,
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

enum Timezone {
  ASIA_TOKYO
}

enum DemographicType {
  ANIME
}

enum Rating {
  PG_13_TEENS_13_OR_OLDER,
  R_17_VIOLENCE_PROFANITY,
  R_MILD_NUDITY
}

enum Season {
  FALL,
  SPRING,
  SUMMER,
  WINTER
}

enum Status {
  FINISHED_AIRING
}

enum TitleType {
  DEFAULT,
  ENGLISH,
  FRENCH,
  GERMAN,
  JAPANESE,
  SPANISH,
  SYNONYM
}

enum DatumType {
  MOVIE,
  OVA,
  TV,
  TV_SPECIAL
}

class Title {
  final TitleType type;
  final String title;

  Title({
    required this.type,
    required this.title,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      type: TitleType.values.firstWhere((e) => e.toString() == 'TitleType.${json['type']}'),
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      'title': title,
    };
  }
}
