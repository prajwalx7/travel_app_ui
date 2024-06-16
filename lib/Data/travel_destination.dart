class TravelDestination {
  final String imagePath;
  final String price;
  final String title;
  final String location;
  final String rating;
  final String description;

  TravelDestination({
    required this.imagePath,
    required this.price,
    required this.title,
    required this.location,
    required this.rating,
    required this.description,
  });
}

final List<TravelDestination> destinations = [
  TravelDestination(
    imagePath: "assets/photo1.jpg",
    price: "\$400/Person",
    title: "Mount Fuji",
    location: " Japan",
    rating: " 4.5",
    description: "Mount Fuji, Japan's highest peak at 3,776 meters, is an iconic and sacred volcano located on Honshu Island. Known for its perfectly symmetrical cone, Mount Fuji is a popular destination for climbers, especially during the summer months. Visitors can also enjoy scenic views from surrounding areas like Hakone and the Fuji Five Lakes. The mountain holds deep cultural significance and is often depicted in Japanese art and literature.",
  ),
  TravelDestination(
    imagePath: "assets/photo2.jpg",
    price: "\$350/Person",
    title: " Eiffel Tower",
    location: "Paris",
    rating: " 4.8",
    description: "The Eiffel Tower, an enduring symbol of Paris and one of the most recognizable structures in the world, was completed in 1889 for the World's Fair. Standing 324 meters tall, this iron lattice tower offers breathtaking views of the Paris skyline from its observation decks. Visitors can enjoy dining in its restaurants, exploring its various levels, and experiencing its nightly illumination, making it a must-see attraction in the City of Light.",
  ),
  TravelDestination(
    imagePath: "assets/photo3.jpg",
    price: "\$500/Person",
    title: " Statue of Liberty",
    location: "USA",
    rating: " 4.7",
    description: "The Statue of Liberty, an iconic symbol of freedom and democracy, stands proudly on Liberty Island in New York Harbor. A gift from France to the United States, this colossal statue was dedicated in 1886 and has since welcomed millions of immigrants and visitors. Lady Liberty, with her torch held high, represents hope and enlightenment, and offers stunning views of New York City from her pedestal and crown.",
  ),
  TravelDestination(
    imagePath: "assets/photo4.jpg",
    price: "\$300/Person",
    title: " Taj Mahal",
    location: "India",
    rating: " 4.9",
    description: "The Taj Mahal, a UNESCO World Heritage Site, is an exquisite white marble mausoleum located in Agra, India. Commissioned by Mughal Emperor Shah Jahan in memory of his beloved wife Mumtaz Mahal, this 17th-century architectural masterpiece is renowned for its stunning symmetry, intricate carvings, and the serene reflection in its surrounding pools. The Taj Mahal is a testament to eternal love and is considered one of the New Seven Wonders of the World.",
  ),
  TravelDestination(
    imagePath: "assets/photo5.jpg",
    price: "\$450/Person",
    title: " Ha Long Bay",
    location: "Vietnam",
    rating: " 4.9",
    description: "Ha Long Bay, located in northeastern Vietnam, is renowned for its emerald waters and thousands of towering limestone islands topped with rainforests. This UNESCO World Heritage Site offers breathtaking landscapes, making it a popular spot for cruises and kayaking. Visitors can explore stunning caves, floating fishing villages, and secluded beaches. Ha Long Bay's mystical beauty and unique geological formations create an unforgettable travel experience.",
  ),
];
