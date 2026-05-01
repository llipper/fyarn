class Logger {
  static void info(String message) {
    print(' \x1B[34mℹ\x1B[0m $message');
  }

  static void success(String message) {
    print(' \x1B[32m✔\x1B[0m $message');
  }

  static void error(String message) {
    print(' \x1B[31m✘\x1B[0m $message');
  }

  static void warning(String message) {
    print(' \x1B[33m⚠\x1B[0m $message');
  }

  static void skip(String message) {
    print(' \x1B[90m○\x1B[0m $message (skipped)');
  }

  static void bold(String message) {
    print('\x1B[1m$message\x1B[0m');
  }

  static void step(String message) {
    print('\x1B[36m➜\x1B[0m $message');
  }

  static void debug(String message) {
    print('\x1B[90m[DEBUG] $message\x1B[0m');
  }
}
