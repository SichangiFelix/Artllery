import '../../art/models/art_model.dart';

class ArtistModel{
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneContact;
  List<ArtModel> artPieces;
  List<ArtModel> soldPieces;

  ArtistModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneContact,
    required this.artPieces,
    required this.soldPieces,
});
}