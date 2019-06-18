class LogPrefix {
  static String methodName(String value) {
    return "Start $value: \t" + value.toString();
  }
  static String okResponse(dynamic value) {
    return "OK - RESPONSE: \t" + value.toString();
  }

  static String errorResponse(dynamic value) {
    return "Error - RESPONSE: \t" + value.toString();
  }

}
