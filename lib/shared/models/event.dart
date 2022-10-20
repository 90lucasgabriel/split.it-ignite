import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/models/item_model.dart';

class EventModel {
  final String title;
  final DateTime createdAt;
  final double value;
  final List<ItemModel>? items;
  final List<FriendModel>? friends;
  int get people => friends!.length;

  EventModel({
    required this.title,
    required this.createdAt,
    required this.value,
    this.items = const [],
    this.friends = const [],
  });

  EventModel copyWith({
    String? title,
    DateTime? createdAt,
    double? value,
    List<ItemModel>? items,
    List<FriendModel>? friends,
  }) {
    return EventModel(
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      value: value ?? this.value,
      items: items ?? this.items,
      friends: friends ?? this.friends,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'createdAt': createdAt,
      'value': value,
      'items': items?.map((x) => x.toMap()).toList(),
      'friends': friends?.map((x) => x.toMap()).toList(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      value: map['value']?.toDouble() ?? 0.0,
      items: map['items'] != null
          ? List<ItemModel>.from(map['items']?.map((x) => ItemModel.fromMap(x)))
          : null,
      friends: map['friends'] != null
          ? List<FriendModel>.from(
              map['friends']?.map((x) => FriendModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(title: $title, createdAt: $createdAt, value: $value, items: $items, friends: $friends)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.title == title &&
        other.createdAt == createdAt &&
        other.value == value &&
        listEquals(other.items, items) &&
        listEquals(other.friends, friends);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        createdAt.hashCode ^
        value.hashCode ^
        items.hashCode ^
        friends.hashCode;
  }
}
