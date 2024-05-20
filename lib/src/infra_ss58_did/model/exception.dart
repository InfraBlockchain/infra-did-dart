class InfraDIDException implements Exception {
  int code;
  String message;
  InfraDIDException(this.code, this.message);

  @override
  String toString() {
    return 'InfraDIDException ($code): $message';
  }
}
