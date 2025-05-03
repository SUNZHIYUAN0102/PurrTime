// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_json.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'avatar': instance.avatar,
    };

UpdateUserDto _$UpdateUserDtoFromJson(Map<String, dynamic> json) =>
    UpdateUserDto(
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UpdateUserDtoToJson(UpdateUserDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'avatar': instance.avatar,
    };

CreateCatDto _$CreateCatDtoFromJson(Map<String, dynamic> json) => CreateCatDto(
      name: json['name'] as String,
      gender: json['gender'] as String,
      breed: json['breed'] as String,
      birth: DateTime.parse(json['birth'] as String),
      image: json['image'] as String,
      weight: (json['weight'] as num).toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      insuranceProvider: json['insuranceProvider'] as String?,
      insuranceNumber: json['insuranceNumber'] as String?,
    );

Map<String, dynamic> _$CreateCatDtoToJson(CreateCatDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'breed': instance.breed,
      'birth': instance.birth.toIso8601String(),
      'image': instance.image,
      'weight': instance.weight,
      'length': instance.length,
      'insuranceProvider': instance.insuranceProvider,
      'insuranceNumber': instance.insuranceNumber,
    };

CatDto _$CatDtoFromJson(Map<String, dynamic> json) => CatDto(
      id: json['id'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      breed: json['breed'] as String,
      birth: DateTime.parse(json['birth'] as String),
      image: json['image'] as String,
      weight: (json['weight'] as num).toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      insuranceProvider: json['insuranceProvider'] as String?,
      insuranceNumber: json['insuranceNumber'] as String?,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CatDtoToJson(CatDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'breed': instance.breed,
      'birth': instance.birth.toIso8601String(),
      'image': instance.image,
      'weight': instance.weight,
      'length': instance.length,
      'insuranceProvider': instance.insuranceProvider,
      'insuranceNumber': instance.insuranceNumber,
      'code': instance.code,
    };

UpdateCatDto _$UpdateCatDtoFromJson(Map<String, dynamic> json) => UpdateCatDto(
      name: json['name'] as String,
      gender: json['gender'] as String,
      breed: json['breed'] as String,
      birth: DateTime.parse(json['birth'] as String),
      image: json['image'] as String,
      weight: (json['weight'] as num).toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      insuranceProvider: json['insuranceProvider'] as String?,
      insuranceNumber: json['insuranceNumber'] as String?,
    );

Map<String, dynamic> _$UpdateCatDtoToJson(UpdateCatDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'breed': instance.breed,
      'birth': instance.birth.toIso8601String(),
      'image': instance.image,
      'weight': instance.weight,
      'length': instance.length,
      'insuranceProvider': instance.insuranceProvider,
      'insuranceNumber': instance.insuranceNumber,
    };

CreateUserDto _$CreateUserDtoFromJson(Map<String, dynamic> json) =>
    CreateUserDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$CreateUserDtoToJson(CreateUserDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

AuthDto _$AuthDtoFromJson(Map<String, dynamic> json) => AuthDto(
      token: json['token'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthDtoToJson(AuthDto instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user.toJson(),
    };

CreateRecordDto _$CreateRecordDtoFromJson(Map<String, dynamic> json) =>
    CreateRecordDto(
      catalogue: createRecordDtoCatalogueFromJson(json['catalogue']),
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      $value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateRecordDtoToJson(CreateRecordDto instance) =>
    <String, dynamic>{
      'catalogue': createRecordDtoCatalogueToJson(instance.catalogue),
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'value': instance.$value,
    };

RecordDto _$RecordDtoFromJson(Map<String, dynamic> json) => RecordDto(
      id: json['id'] as String,
      catalogue: recordDtoCatalogueFromJson(json['catalogue']),
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      $value: (json['value'] as num).toDouble(),
      cat: CatDto.fromJson(json['cat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecordDtoToJson(RecordDto instance) => <String, dynamic>{
      'id': instance.id,
      'catalogue': recordDtoCatalogueToJson(instance.catalogue),
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'value': instance.$value,
      'cat': instance.cat.toJson(),
    };

UpdateRecordDto _$UpdateRecordDtoFromJson(Map<String, dynamic> json) =>
    UpdateRecordDto(
      catalogue: updateRecordDtoCatalogueNullableFromJson(json['catalogue']),
      name: json['name'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      $value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UpdateRecordDtoToJson(UpdateRecordDto instance) =>
    <String, dynamic>{
      'catalogue': updateRecordDtoCatalogueNullableToJson(instance.catalogue),
      'name': instance.name,
      'date': instance.date?.toIso8601String(),
      'value': instance.$value,
    };
