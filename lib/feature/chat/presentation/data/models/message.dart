class Messages {
  final String message;

  Messages(this.message);

  factory Messages.fromJson(jsonData) {
    return Messages(jsonData['message']);
  }
}