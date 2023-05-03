class AppError implements Exception {
  int? code;
  String? title;
  String? message;

  AppError({
    this.code,
    this.title,
    this.message,
  });

  AppError.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
  }
}
