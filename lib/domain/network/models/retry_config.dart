class RetryConfig {
  final int maxRetries;
  final int baseDelayInMiliseconds;

  const RetryConfig({
    this.maxRetries = 3,
    this.baseDelayInMiliseconds = 1000,
  });
}
