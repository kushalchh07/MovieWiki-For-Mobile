// ignore_for_file: constant_identifier_names

import 'dart:convert';

class TopAnimesModel {
  final Pagination pagination;
  final List<TopAnime> data;

  TopAnimesModel({
    required this.pagination,
    required this.data,
  });

  factory TopAnimesModel.fromJson(Map<String, dynamic> json) {
    return TopAnimesModel(
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
      data: (json['data'] as List<dynamic>?)
              ?.map((x) => x != null ? TopAnime.fromJson(x) : null)
              .where((x) => x != null)
              .cast<TopAnime>()
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}

class TopAnime {
  final int malId;
  final String url;
  final Map<String, Image> images;
  final Trailer trailer;
  final bool approved;
  final List<Title> titles;
  final String title;
  final String? titleEnglish; // Nullable field
  final String? titleJapanese; // Nullable field
  final List<String> titleSynonyms;
  final DatumType type;
  final String source;
  final int? episodes; // Nullable field
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
  final String? background; // Nullable field
  final Season season;
  final Broadcast broadcast;
  final List<Demographic> producers;
  final List<Demographic> licensors;
  final List<Demographic> studios;
  final List<Demographic> genres;
  final List<dynamic> explicitGenres;
  final List<Demographic> themes;
  final List<Demographic> demographics;

  TopAnime({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    this.episodes,
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
    this.background,
    required this.season,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory TopAnime.fromJson(Map<String, dynamic> json) {
    return TopAnime(
      malId: json['mal_id'] ?? 0,
      url: json['url'] ?? '',
      images: (json['images'] as Map<String, dynamic>).map(
        (k, v) => MapEntry(k, Image.fromJson(v)),
      ),
      trailer: Trailer.fromJson(json['trailer'] ?? {}),
      approved: json['approved'] ?? false,
      titles: List<Title>.from(
        (json['titles'] as List<dynamic>).map((x) => Title.fromJson(x)),
      ),
      title: json['title'] ?? '',
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      titleSynonyms: List<String>.from(json['title_synonyms'] ?? []),
      type: DatumType.values.firstWhere(
        (e) => e.toString() == 'DatumType.${json['type']}',
        orElse: () => DatumType.MOVIE,
      ),
      source: json['source'] ?? '',
      episodes: json['episodes'],
      status: Status.values.firstWhere(
        (e) => e.toString() == 'Status.${json['status']}',
        orElse: () => Status.FINISHED_AIRING,
      ),
      airing: json['airing'] ?? false,
      aired: Aired.fromJson(json['aired'] ?? {}),
      duration: json['duration'] ?? '',
      rating: Rating.values.firstWhere(
        (e) => e.toString() == 'Rating.${json['rating']}',
        orElse: () => Rating.PG_13_TEENS_13_OR_OLDER,
      ),
      score: json['score']?.toDouble() ?? 0.0,
      scoredBy: json['scored_by'] ?? 0,
      rank: json['rank'] ?? 0,
      popularity: json['popularity'] ?? 0,
      members: json['members'] ?? 0,
      favorites: json['favorites'] ?? 0,
      synopsis: json['synopsis'] ?? '',
      background: json['background'],
      season: Season.values.firstWhere(
        (e) => e.toString() == 'Season.${json['season']}',
        orElse: () => Season.FALL,
      ),
      broadcast: Broadcast.fromJson(json['broadcast'] ?? {}),
      producers: List<Demographic>.from(
        (json['producers'] as List<dynamic>)
            .map((x) => Demographic.fromJson(x)),
      ),
      licensors: List<Demographic>.from(
        (json['licensors'] as List<dynamic>)
            .map((x) => Demographic.fromJson(x)),
      ),
      studios: List<Demographic>.from(
        (json['studios'] as List<dynamic>).map((x) => Demographic.fromJson(x)),
      ),
      genres: List<Demographic>.from(
        (json['genres'] as List<dynamic>).map((x) => Demographic.fromJson(x)),
      ),
      explicitGenres: List<dynamic>.from(json['explicit_genres'] ?? []),
      themes: List<Demographic>.from(
        (json['themes'] as List<dynamic>).map((x) => Demographic.fromJson(x)),
      ),
      demographics: List<Demographic>.from(
        (json['demographics'] as List<dynamic>)
            .map((x) => Demographic.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.map((k, v) => MapEntry(k, v.toJson())),
      'trailer': trailer.toJson(),
      'approved': approved,
      'titles': titles.map((x) => x.toJson()).toList(),
      'title': title,
      'title_english': titleEnglish,
      'title_japanese': titleJapanese,
      'title_synonyms': titleSynonyms,
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
      'broadcast': broadcast.toJson(),
      'producers': producers.map((x) => x.toJson()).toList(),
      'licensors': licensors.map((x) => x.toJson()).toList(),
      'studios': studios.map((x) => x.toJson()).toList(),
      'genres': genres.map((x) => x.toJson()).toList(),
      'explicit_genres': explicitGenres,
      'themes': themes.map((x) => x.toJson()).toList(),
      'demographics': demographics.map((x) => x.toJson()).toList(),
    };
  }
}

class Aired {
  final DateTime from;
  // final DateTime to;
  final Prop prop;
  final String string;

  Aired({
    required this.from,
    // required this.to,
    required this.prop,
    required this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) {
    return Aired(
      from: DateTime.parse(json['from']),
      // to: DateTime.parse(json['to']),
      prop: Prop.fromJson(json['prop'] ?? {}),
      string: json['string'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toIso8601String(),
      // 'to': to.toIso8601String(),
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
      from: From.fromJson(json['from'] ?? {}),
      to: From.fromJson(json['to'] ?? {}),
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
  final int? day;
  final int? month;
  final int? year;

  From({
    this.day,
    this.month,
    this.year,
  });

  factory From.fromJson(Map<String, dynamic> json) {
    return From(
      day: json['day'],
      month: json['month'],
      year: json['year'],
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
  final String timezone;
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
      timezone: json['timezone'] ?? '',
      string: json['string'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'time': time,
      'timezone': timezone,
      'string': string,
    };
  }
}

class Demographic {
  final int malId;
  final String type;
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
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

class Image {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;
  final String maximumImageUrl;

  Image({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
    required this.maximumImageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      imageUrl: json['image_url'] ?? '',
      smallImageUrl: json['small_image_url'] ?? '',
      largeImageUrl: json['large_image_url'] ?? '',
      maximumImageUrl: json['maximum_image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl,
      'maximum_image_url': maximumImageUrl,
    };
  }
}

class Title {
  final String type;
  final String title;

  Title({
    required this.type,
    required this.title,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      type: json['type'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
    };
  }
}

class Trailer {
  final String youtubeId;
  final String url;
  final String embedUrl;

  Trailer({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      youtubeId: json['youtube_id'] ?? '',
      url: json['url'] ?? '',
      embedUrl: json['embed_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'youtube_id': youtubeId,
      'url': url,
      'embed_url': embedUrl,
    };
  }
}

enum DatumType { TV, MOVIE, OVA, SPECIAL, ONA, MUSIC }

enum Status { FINISHED_AIRING, CURRENTLY_AIRING, NOT_YET_AIRED }

enum Rating {
  G_ALL_AGES,
  PG_CHILDREN,
  PG_13_TEENS_13_OR_OLDER,
  R_17_VIOLENCE_PROFANITY,
  R_PLUS_MILD_NUDITY,
  RX_HENTAI
}

enum Season { FALL, WINTER, SUMMER, SPRING }

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
      items: Items.fromJson(json['items'] ?? {}),
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
