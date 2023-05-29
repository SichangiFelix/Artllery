class ArtModel{
  int id;
  int artistId;
  String artName;
  String description;
  String dimensions;
  double price;
  List<String> artImages;
  DateTime datePosted;
  String materials;

  ArtModel({
    required this.id,
    required this.artistId,
    required this.artName,
    required this.description,
    required this.dimensions,
    required this.price,
    required this.artImages,
    required this.datePosted,
    required this.materials,
});
}
