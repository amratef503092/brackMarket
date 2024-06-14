class CoinModel {
  final String name;
  final String logo;
  final dynamic price;
  final String? url;

  CoinModel({
    required this.name,
    required this.logo,
    required this.price,
    this.url,
  });
  // copy with method
  CoinModel copyWith({
    String? name,
    String? logo,
    dynamic price,
  }) {
    return CoinModel(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      price: price ?? this.price,
      url: url,
    );
  }
}
