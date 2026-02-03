import '../../domain/entities/pin.dart';

class PinModel extends Pin {
  PinModel({
    required super.id,
    required super.imageUrl,
    required super.photographer,
  });

  factory PinModel.fromJson(Map<String, dynamic> json) {
    return PinModel(
      id: json['id'],
      imageUrl: json['src']['medium'],
      photographer: json['photographer'],
    );
  }
}
