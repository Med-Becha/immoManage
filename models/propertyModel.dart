class Property {
  final int id;
  final String name;
  final String description;
  final String details;
  final String sizes;
  final String location;
  final String price;
  final String equipment;
  final String status;
  final List<ImageInfo>? images;
  final List<dynamic>? tenantProperties;

  Property({
    required this.id,
    required this.name,
    required this.description,
    required this.details,
    required this.sizes,
    required this.location,
    required this.price,
    required this.equipment,
    required this.status,
    this.images,
    this.tenantProperties,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      details: json['details'],
      sizes: json['sizes'],
      location: json['location'],
      price: json['price'],
      equipment: json['equipment'],
      status: json['status'],
      images: (json['images'] as List<dynamic>?)
          ?.map((imageJson) => ImageInfo.fromJson(imageJson))
          .toList(),
      tenantProperties: json['tenantProperties'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'details': details,
        'sizes': sizes,
        'location': location,
        'price': price,
        'equipment': equipment,
        'status': status,
        'images': images?.map((image) => image.toJson()).toList(),
        'tenantProperties': tenantProperties,
      };
}

class ImageInfo {
  final int id;
  final String name;
  final String type;
  final String imagePath;

  ImageInfo({
    required this.id,
    required this.name,
    required this.type,
    required this.imagePath,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'imagePath': imagePath,
      };
}
