
class TopAnimesModel {
    final Pagination pagination;
    final List<Datum> data;

    TopAnimesModel({
        required this.pagination,
        required this.data,
    });

}

class Datum {
    final int malId;
    final String url;
    final Map<String, Image> images;
    final Trailer trailer;
    final bool approved;
    final List<Title> titles;
    final String title;
    final String titleEnglish;
    final String titleJapanese;
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
    final String background;
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

}

class Prop {
    final From from;
    final From to;

    Prop({
        required this.from,
        required this.to,
    });

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

}

enum Timezone {
    ASIA_TOKYO
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

}

enum DemographicType {
    ANIME
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

class Title {
    final TitleType type;
    final String title;

    Title({
        required this.type,
        required this.title,
    });

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

}

enum DatumType {
    MOVIE,
    OVA,
    TV,
    TV_SPECIAL
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

}
