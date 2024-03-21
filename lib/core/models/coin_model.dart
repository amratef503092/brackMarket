class CoinModel
{
  final String name;
  final String logo;
  final double price;

  CoinModel({
    required this.name,
    required this.logo,
    required this.price,
  });
  // copy with method
  CoinModel copyWith({
    String? name,
    String? logo,
    double? price,
  }) {
    return CoinModel(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      price: price ?? this.price,
    );
  }

}