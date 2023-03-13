import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  final int value;

  const Counter({
    this.value = 0,
  });

  // Edit
  Counter copyWith({
    int? value,
  }) {
    return Counter(
      value: value ?? this.value,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }

  // Create from JSON
  factory Counter.fromJson(Map<String, dynamic> json) {
    return Counter(
      value: json['value'],
    );
  }

  @override
  List<Object?> get props => [value];
}
