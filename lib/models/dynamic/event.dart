// class TYEvent {
//   final String type;
//   final String actor;
//   final String repo;
//   final DateTime createdAt;

//   TYEvent({required this.type, required this.actor, required this.repo, required this.createdAt});

//   factory TYEvent.fromJson(Map<String, dynamic> json) {
//     return TYEvent(
//       type: json['type'],
//       actor: json['actor']['display_login'],
//       repo: json['repo']['name'],
//       createdAt: DateTime.parse(json['created_at']),
//     );
//   }
// }

// To parse this JSON data, do
//
//     final tyEvent = tyEventFromJson(jsonString);

import 'dart:convert';
import 'package:tygithub/models/dynamic/actor.dart';
import 'package:tygithub/models/dynamic/payload.dart';
import 'package:tygithub/models/dynamic/repo.dart';

TYEvent tyEventFromJson(String str) => TYEvent.fromJson(json.decode(str));

String tyEventToJson(TYEvent data) => json.encode(data.toJson());

class TYEvent {
  TYEvent({
    required this.id,
    required this.type,
    required this.actor,
    required this.repo,
    required this.payload,
    required this.public,
    required this.createdAt,
  });

  String id;
  String type;
  Actor actor;
  Repo repo;
  Payload payload;
  bool public;
  DateTime createdAt;

  factory TYEvent.fromJson(Map<String, dynamic> json) => TYEvent(
        id: json["id"],
        type: json["type"],
        actor: Actor.fromJson(json["actor"]),
        repo: Repo.fromJson(json["repo"]),
        payload: Payload.fromJson(json["payload"]),
        public: json["public"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "actor": actor.toJson(),
        "repo": repo.toJson(),
        "payload": payload.toJson(),
        "public": public,
        "created_at": createdAt.toIso8601String(),
      };
}
