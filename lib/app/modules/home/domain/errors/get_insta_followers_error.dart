abstract class GeInstaFollowersFailure implements Exception {}

class GetInstaFollowersError extends GeInstaFollowersFailure {
  String? message;
  
  GetInstaFollowersError({
    required this.message,
  });
}
