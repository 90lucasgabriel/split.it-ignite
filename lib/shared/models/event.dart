import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:splitit/shared/models/base.dart';

import 'package:splitit/shared/models/friend_model.dart';
import 'package:splitit/shared/models/item_model.dart';

class EventModel extends Base {
  final String id;
  final String title;
  final DateTime createdAt;
  final double value;
  final double valuePaid;
  final List<ItemModel> items;
  final List<FriendModel> friends;
  int get people => friends.length;
  double get valueRemaining => (totalPrice - valuePaid);
  double get valueSplitted => (totalPrice / friends.length);
  double get totalPrice => items.isNotEmpty
      ? items
          .reduce((value, element) =>
              value = value.copyWith(price: value.price + element.price))
          .price
      : 0;

  EventModel({
    this.id = '',
    this.title = '',
    required this.createdAt,
    this.value = 0,
    this.valuePaid = 0,
    this.items = const [],
    this.friends = const [],
  }) : super(collection: '/events');

  EventModel copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
    double? value,
    double? valuePaid,
    List<ItemModel>? items,
    List<FriendModel>? friends,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      value: value == null ? totalPrice : this.value,
      valuePaid: valuePaid ?? this.valuePaid,
      items: items ?? this.items,
      friends: friends ?? this.friends,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'createdAt': FieldValue.serverTimestamp(),
      'value': totalPrice,
      'valuePaid': valuePaid,
      'items': items.map((x) => x.toMap()).toList(),
      'friends': friends.map((x) => x.toMap()).toList(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      value: map['value']?.toDouble() ?? 0.0,
      valuePaid: map['valuePaid']?.toDouble() ?? 0.0,
      items:
          List<ItemModel>.from(map['items'].map((x) => ItemModel.fromMap(x))),
      friends: List<FriendModel>.from(
          map['friends'].map((x) => FriendModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, createdAt: $createdAt, value: $value, valuePaid: $valuePaid, items: $items, friends: $friends)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.id == id &&
        other.title == title &&
        other.createdAt == createdAt &&
        other.value == value &&
        other.valuePaid == valuePaid &&
        listEquals(other.items, items) &&
        listEquals(other.friends, friends);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        id.hashCode ^
        createdAt.hashCode ^
        value.hashCode ^
        valuePaid.hashCode ^
        items.hashCode ^
        friends.hashCode;
  }
}
