class TravelDestination {
  final String imagePath;
  final String price;
  final String title;
  final String location;
  final String rating;

  TravelDestination({
    required this.imagePath,
    required this.price,
    required this.title,
    required this.location,
    required this.rating,
  });
}

final List<TravelDestination> destinations = [
  TravelDestination(
    imagePath: "assets/photo1.jpg",
    price: "\$400/Person",
    title: "Mount Fuji",
    location: " Japan",
    rating: " 4.5",
  ),
  TravelDestination(
    imagePath: "assets/photo2.jpg",
    price: "\$350/Person",
    title: " Eiffel Tower",
    location: "Paris",
    rating: " 4.8",
  ),
  TravelDestination(
    imagePath: "assets/photo3.jpg",
    price: "\$500/Person",
    title: " Statue of Liberty",
    location: "USA",
    rating: " 4.7",
  ),
  TravelDestination(
    imagePath: "assets/photo4.jpg",
    price: "\$300/Person",
    title: " Taj Mahal",
    location: "India",
    rating: " 4.6",
  ),
  TravelDestination(
    imagePath: "assets/photo5.jpg",
    price: "\$450/Person",
    title: " Ha Long",
    location: "Vietnam",
    rating: " 4.9",
  ),
];
