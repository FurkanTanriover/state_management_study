import 'dart:convert';

class CatFactsModel {
  final int length;
  final String fact;
  CatFactsModel({
    required this.length,
    required this.fact,
  });

  CatFactsModel copyWith({
    int? length,
    String? fact,
  }) {
    return CatFactsModel(
      length: length ?? this.length,
      fact: fact ?? this.fact,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'length': length});
    result.addAll({'fact': fact});
  
    return result;
  }

  factory CatFactsModel.fromMap(Map<String, dynamic> map) {
    return CatFactsModel(
      length: map['length']?.toInt() ?? 0,
      fact: map['fact'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CatFactsModel.fromJson(String source) => CatFactsModel.fromMap(json.decode(source));

  @override
  String toString() => 'CatFactsModel(length: $length, fact: $fact)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CatFactsModel &&
      other.length == length &&
      other.fact == fact;
  }

  @override
  int get hashCode => length.hashCode ^ fact.hashCode;
}
