// To parse this JSON data, do
//
//     final tvModel = tvModelFromJson(jsonString);

import 'dart:convert';

TvModel tvModelFromJson(String str) => TvModel.fromJson(json.decode(str));

String tvModelToJson(TvModel data) => json.encode(data.toJson());

class TvModel {
    TvModel({
       required this.page,
      required this.results,
       required this.totalPages,
       required this.totalResults,
    });

    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    Result({
        this.backdropPath,
        this.firstAirDate,
        this.genreIds,
        this.id,
        this.name,
        this.originCountry,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.popularity,
        this.posterPath,
        this.voteAverage,
        this.voteCount,
    });

    String? backdropPath;
    DateTime? firstAirDate;
    List<int>? genreIds;
    int? id;
    String? name;
    List<String>? originCountry;
    String? originalLanguage;
    String? originalName;
    String? overview;
    double? popularity;
    String? posterPath;
    double? voteAverage;
    int? voteCount;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "name": name,
        "origin_country": List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}