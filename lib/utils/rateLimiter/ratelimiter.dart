import 'dart:async';

class RateLimiter {
  final int maxRequests;
  final Duration period;
  int _requestCount = 0;
  Timer? _timer;

  RateLimiter({required this.maxRequests, required this.period});

  Future<void> allowRequest() async {
    if (_requestCount >= maxRequests) {
      await Future.delayed(period);
      _requestCount = 0;
    }
    _requestCount++;
    _timer ??= Timer(period, () {
      _requestCount = 0;
      _timer = null;
    });
  }
}

// Usage
final rateLimiter = RateLimiter(maxRequests: 3, period: Duration(seconds: 60));

Future<void> fetchTopAnimes() async {
  await rateLimiter.allowRequest();
  // Make your API request here
}
