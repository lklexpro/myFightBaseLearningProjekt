import 'package:collection/collection.dart';

enum PostVisibilityStates {
  public,
  membersOnly,
}

enum PostTypes {
  socialPost,
  communityPost,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (PostVisibilityStates):
      return PostVisibilityStates.values.deserialize(value) as T?;
    case (PostTypes):
      return PostTypes.values.deserialize(value) as T?;
    default:
      return null;
  }
}
