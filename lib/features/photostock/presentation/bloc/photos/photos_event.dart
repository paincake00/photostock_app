/// Photos event
abstract class PhotosEvent {
  const PhotosEvent();
}

/// Get photos event
class GetPhotosEvent extends PhotosEvent {
  const GetPhotosEvent();
}
