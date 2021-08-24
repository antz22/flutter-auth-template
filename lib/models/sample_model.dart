class SampleModel {
  final int id;
  final String sampleField;

  SampleModel({
    required this.id,
    required this.sampleField,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return SampleModel(
      id: json['id'],
      sampleField: json['sampleField'],
    );
  }

  dynamic toJson() => {
        'id': id,
        'sampleField': sampleField,
      };
}
