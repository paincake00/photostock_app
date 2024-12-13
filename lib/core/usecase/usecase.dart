/// Class UseCase
abstract class UseCase<Type, Params> {
  /// Call method
  Future<Type> call({required Params params});
}
