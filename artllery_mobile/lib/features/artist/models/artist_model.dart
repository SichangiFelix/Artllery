import '../../art/models/art_model.dart';

class ArtistModel{
  String firstName;
  String lastName;
  String username;
  String email;
  String phone;
  List<ArtModel> artPieces;
  List<String> cart;

  ArtistModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.artPieces,
    required this.cart,
});
}

