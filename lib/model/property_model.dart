class PropertyModel {
  final String id;
  final String title;
  final String price;
  final String priceType;
  final String location;
  final int bedrooms;
  final int sqFeet;
  final int bathrooms;
  final String propertyType;
  final String imageUrl;
  final bool isForSale;
  bool isFavorite;
  final List<String>? floorPlanImages;

  PropertyModel({
    required this.id,
    required this.title,
    required this.price,
    required this.priceType,
    required this.location,
    required this.bedrooms,
    required this.sqFeet,
    required this.bathrooms,
    required this.propertyType,
    required this.imageUrl,
    required this.isForSale,
    required this.isFavorite,
    this.floorPlanImages,
  });
}
