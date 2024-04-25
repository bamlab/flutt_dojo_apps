import 'package:equatable/equatable.dart';

/// This class associated a [name] to a given [value].
class Named<T> extends Equatable {
  /// default constructor.
  const Named(this.name, this.value);

  /// name given to this object
  final String name;

  /// value of this object
  final T value;

  @override
  List<Object?> get props => [name, value];
}

/// Extension to transform any object in a [Named] object
extension NamedExtension<T> on T {
  /// Method to transform any object in a [Named] object
  Named<T> named(String name) => Named<T>(name, this);
}
