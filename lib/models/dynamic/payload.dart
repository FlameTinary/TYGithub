import 'package:tygithub/models/dynamic/commit.dart';

class Payload {
  Payload({
    this.pushId,
    this.size,
    this.distinctSize,
    this.ref,
    this.head,
    this.before,
    this.action,
    this.commits,
  });

  int? pushId;
  int? size;
  int? distinctSize;
  String? ref;
  String? head;
  String? before;
  String? action;
  List<Commit>? commits;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        pushId: json["push_id"],
        size: json["size"],
        distinctSize: json["distinct_size"],
        ref: json["ref"],
        head: json["head"],
        before: json["before"],
        action: json["action"],
        commits: json["commits"] == null
            ? null
            : List<Commit>.from(json["commits"].map((x) => Commit.fromJson(x))),
        // commits:
        // List<Commit>.from(json["commits"].map((x) => Commit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "push_id": pushId,
        "size": size,
        "distinct_size": distinctSize,
        "ref": ref,
        "head": head,
        "before": before,
        "action": action,
        "commits": commits == null
            ? null
            : List<dynamic>.from(commits!.map((x) => x.toJson())),
        // "commits": List<dynamic>.from(commits.map((x) => x.toJson())),
      };
}
