import 'package:tygithub/models/dynamic/author.dart';

class Commit {
    Commit({
        required this.sha,
        required this.author,
        required this.message,
        required this.distinct,
        required this.url,
    });

    String sha;
    Author author;
    String message;
    bool distinct;
    String url;

    factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        sha: json["sha"],
        author: Author.fromJson(json["author"]),
        message: json["message"],
        distinct: json["distinct"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "sha": sha,
        "author": author.toJson(),
        "message": message,
        "distinct": distinct,
        "url": url,
    };
}