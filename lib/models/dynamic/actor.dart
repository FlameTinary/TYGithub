class Actor {
    Actor({
        required this.id,
        required this.login,
        required this.displayLogin,
        required this.gravatarId,
        required this.url,
        required this.avatarUrl,
    });

    int id;
    String login;
    String displayLogin;
    String gravatarId;
    String url;
    String avatarUrl;

    factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        id: json["id"],
        login: json["login"],
        displayLogin: json["display_login"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        avatarUrl: json["avatar_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "display_login": displayLogin,
        "gravatar_id": gravatarId,
        "url": url,
        "avatar_url": avatarUrl,
    };
}