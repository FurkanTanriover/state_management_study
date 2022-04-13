import 'dart:convert';

class BinaModel {
  final int id;
  final String title;
  BinaModel({
    required this.id,
    required this.title,
  });

  BinaModel copyWith({
    int? id,
    String? title,
  }) {
    return BinaModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'title': title});
  
    return result;
  }

  factory BinaModel.fromMap(Map<String, dynamic> map) {
    return BinaModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BinaModel.fromJson(String source) => BinaModel.fromMap(json.decode(source));

  @override
  String toString() => 'BinaModel(id: $id, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BinaModel &&
      other.id == id &&
      other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
