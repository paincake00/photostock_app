/// Photos event
abstract class PhotosEvent {
  const PhotosEvent();
}

/// Get photos event
class GetPhotosEvent extends PhotosEvent {
  /// Page number
  final int page;

  const GetPhotosEvent({
    required this.page,
  });
}
