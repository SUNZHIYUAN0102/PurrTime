import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum CreateRecordDtoCatalogue {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('daily')
  daily('daily'),
  @JsonValue('expense')
  expense('expense');

  final String? value;

  const CreateRecordDtoCatalogue(this.value);
}

enum RecordDtoCatalogue {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('daily')
  daily('daily'),
  @JsonValue('expense')
  expense('expense');

  final String? value;

  const RecordDtoCatalogue(this.value);
}

enum UpdateRecordDtoCatalogue {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('daily')
  daily('daily'),
  @JsonValue('expense')
  expense('expense');

  final String? value;

  const UpdateRecordDtoCatalogue(this.value);
}
