import 'package:isar/isar.dart';

part 'isar_user_collection.g.dart';

@collection
class IsarUserCollection {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String? title;

  List<Recipient>? recipients;

  @enumerated
  Status status = Status.sending;
}

@embedded
class Recipient {
  String? name;

  String? address;
}

enum Status {
  draft,
  sending,
  sent,
}
