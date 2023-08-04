import 'dart:convert';
import 'package:flutter_test_task/data/entity/user_entity.dart';
import '../../domain/model/user_list_model.dart';

class ResponseEntity {
  Map<String, dynamic>  data;

  ResponseEntity({
    required this.data,
  });

  factory ResponseEntity.fromJson(Map<String, dynamic> json) => ResponseEntity(
        data: json['data'] as Map<String, dynamic> ,
      );
}

