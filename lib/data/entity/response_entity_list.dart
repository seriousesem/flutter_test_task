
class ResponseEntityList {
  List<dynamic> data;

  ResponseEntityList({
    required this.data,
  });

  factory ResponseEntityList.fromJson(Map<String, dynamic> json) => ResponseEntityList(
        data: json['data'] as List<dynamic>,
      );
}
