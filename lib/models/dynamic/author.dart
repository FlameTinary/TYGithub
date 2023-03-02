class Author {
    Author({
        required this.email,
        required this.name,
    });

    String email;
    String name;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        email: json["email"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
    };
}