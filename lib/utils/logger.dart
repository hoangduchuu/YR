
class Logger {
  static void methodName(String value) {
    print(value);
  }

  static void log(dynamic value) {
    print("LOGGER $value");
  }
}

const LOG_ENABLED = true;
void log(Object object) {
  if (LOG_ENABLED) {
    print(object);
  }
}