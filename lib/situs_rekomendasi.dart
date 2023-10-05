class Situs {
  String name;
  String image;
  String siteUrl;
  bool isFavorite;

  Situs({
    required this.name,
    required this.image,
    required this.siteUrl,
    required this.isFavorite,
  });
}

var listSitus = [
  Situs(
    name: "Flutter",
    image:
    "https://static-00.iconduck.com/assets.00/flutter-plain-icon-1655x2048-tm6fsmjb.png",
    siteUrl: "https://flutter.dev/",
    isFavorite: false,
  ),
  Situs(
    name: "Zeus",
    image:
    "https://png.pngtree.com/png-clipart/20210718/original/pngtree-round-border-zeus-thunder-thunder-logo-png-image_6540718.jpg",
    siteUrl: "https://www.pgandh.org/",
    isFavorite: false,
  ),
  Situs(
    name: "Stack Overflow",
    image:
    "https://lh3.googleusercontent.com/l-hX2rcB5NVykwtTKKn_Pd1oQAet4enwI0BAH8SbgguYhITJdo50oYNnckMCVT-F2zkHfKin0lEHk53NOSA",
    siteUrl: "https://stackoverflow.com/",
    isFavorite: false,
  ),
  Situs(
    name: "GitHub",
    image:
    "https://www.pngmart.com/files/22/GitHub-PNG-Isolated-Photo.png",
    siteUrl: "https://github.com/",
    isFavorite: false,
  ),
  Situs(
    name: "ChatGPT",
    image:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/800px-ChatGPT_logo.svg.png",
    siteUrl: "https://chat.openai.com/",
    isFavorite: false,
  ),
  Situs(
    name: "YouTube",
    image:
    "https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png?20220706172052",
    siteUrl: "https://www.youtube.com/",
    isFavorite: false,
  )
];