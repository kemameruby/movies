class Series {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  Series({this.page, this.results, this.totalPages, this.totalResults});

  Series.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.firstAirDate,
      this.name,
      this.voteAverage,
      this.voteCount});

  // Results.fromJson(Map<String, dynamic> json) {
  //   adult = json['adult'];
  //   backdropPath = json['backdrop_path'];
  //   genreIds = json['genre_ids'].cast<int>();
  //   id = json['id'];
  //   originCountry = json['origin_country'].cast<String>();
  //   originalLanguage = json['original_language'];
  //   originalName = json['original_name'];
  //   overview = json['overview'];
  //   popularity = json['popularity'];
  //   posterPath = json['poster_path'];
  //   firstAirDate = json['first_air_date'];
  //   name = json['name'];
  //   voteAverage = json['vote_average'];
  //   voteCount = json['vote_count'];
  // }
  Results.fromJson(Map<String, dynamic> json) {
  adult = json['adult'] ?? false; // Default to false if null
  backdropPath = json['backdrop_path'] ?? '';
  genreIds = (json['genre_ids'] as List<dynamic>?)?.cast<int>() ?? [];
  id = json['id'] ?? 0; // Default to 0 if null
  originCountry = (json['origin_country'] as List<dynamic>?)?.cast<String>() ?? [];
  originalLanguage = json['original_language'] ?? '';
  originalName = json['original_name'] ?? '';
  overview = json['overview'] ?? '';
  popularity = json['popularity'] ?? 0.0;
  posterPath = json['poster_path'] ?? '';
  firstAirDate = json['first_air_date'] ?? '';
  name = json['name'] ?? '';
  voteAverage = json['vote_average'] ?? 0.0;
  voteCount = json['vote_count'] ?? 0;
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['origin_country'] = originCountry;
    data['original_language'] = originalLanguage;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['first_air_date'] = firstAirDate;
    data['name'] = name;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}