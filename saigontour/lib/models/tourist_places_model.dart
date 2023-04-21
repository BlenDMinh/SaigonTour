// ignore_for_file: public_member_api_docs, sort_constructors_first
class TouristPlacesModel {
  final String name;
  final String image;
  TouristPlacesModel({
    required this.name,
    required this.image,
  });
}

List<TouristPlacesModel> touristPlaces = [
  TouristPlacesModel(name: "Núi", image: "assets/icons/mountain.png"),
  TouristPlacesModel(name: "Biển", image: "assets/icons/beach.png"),
  TouristPlacesModel(name: "Rừng", image: "assets/icons/forest.png"),
  TouristPlacesModel(name: "Thành Phố", image: "assets/icons/city.png"),
  TouristPlacesModel(name: "Khu du lịch", image: "assets/icons/desert.png"),
];
