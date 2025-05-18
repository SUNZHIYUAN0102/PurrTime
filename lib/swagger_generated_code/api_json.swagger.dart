// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'api_json.enums.swagger.dart' as enums;
export 'api_json.enums.swagger.dart';

part 'api_json.swagger.chopper.dart';
part 'api_json.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ApiJson extends ChopperService {
  static ApiJson create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$ApiJson(client);
    }

    final newClient = ChopperClient(
        services: [_$ApiJson()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$ApiJson(newClient);
  }

  ///
  Future<chopper.Response> get() {
    return _get();
  }

  ///
  @Get(path: '/')
  Future<chopper.Response> _get();

  ///
  Future<chopper.Response<UserDto>> usersGet() {
    generatedMapping.putIfAbsent(UserDto, () => UserDto.fromJsonFactory);

    return _usersGet();
  }

  ///
  @Get(path: '/users')
  Future<chopper.Response<UserDto>> _usersGet();

  ///
  Future<chopper.Response<UserDto>> usersPatch({required UpdateUserDto? body}) {
    generatedMapping.putIfAbsent(UserDto, () => UserDto.fromJsonFactory);

    return _usersPatch(body: body);
  }

  ///
  @Patch(
    path: '/users',
    optionalBody: true,
  )
  Future<chopper.Response<UserDto>> _usersPatch(
      {@Body() required UpdateUserDto? body});

  ///
  Future<chopper.Response<CatDto>> catsPost({required CreateCatDto? body}) {
    generatedMapping.putIfAbsent(CatDto, () => CatDto.fromJsonFactory);

    return _catsPost(body: body);
  }

  ///
  @Post(
    path: '/cats',
    optionalBody: true,
  )
  Future<chopper.Response<CatDto>> _catsPost(
      {@Body() required CreateCatDto? body});

  ///
  Future<chopper.Response<List<CatDto>>> catsGet() {
    generatedMapping.putIfAbsent(CatDto, () => CatDto.fromJsonFactory);

    return _catsGet();
  }

  ///
  @Get(path: '/cats')
  Future<chopper.Response<List<CatDto>>> _catsGet();

  ///
  Future<chopper.Response<CatDto>> catsCodePost({required String? body}) {
    generatedMapping.putIfAbsent(CatDto, () => CatDto.fromJsonFactory);

    return _catsCodePost(body: body);
  }

  ///
  @Post(
    path: '/cats/code',
    optionalBody: true,
  )
  Future<chopper.Response<CatDto>> _catsCodePost(
      {@Body() required String? body});

  ///
  ///@param id
  Future<chopper.Response<CatDto>> catsIdGet({required String? id}) {
    generatedMapping.putIfAbsent(CatDto, () => CatDto.fromJsonFactory);

    return _catsIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/cats/{id}')
  Future<chopper.Response<CatDto>> _catsIdGet(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<CatDto>> catsIdPatch({
    required String? id,
    required UpdateCatDto? body,
  }) {
    generatedMapping.putIfAbsent(CatDto, () => CatDto.fromJsonFactory);

    return _catsIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(
    path: '/cats/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<CatDto>> _catsIdPatch({
    @Path('id') required String? id,
    @Body() required UpdateCatDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response<Object>> catsIdDelete({required String? id}) {
    return _catsIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/cats/{id}')
  Future<chopper.Response<Object>> _catsIdDelete(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response<AuthDto>> authLoginPost(
      {required CreateUserDto? body}) {
    generatedMapping.putIfAbsent(AuthDto, () => AuthDto.fromJsonFactory);

    return _authLoginPost(body: body);
  }

  ///
  @Post(
    path: '/auth/login',
    optionalBody: true,
  )
  Future<chopper.Response<AuthDto>> _authLoginPost(
      {@Body() required CreateUserDto? body});

  ///
  Future<chopper.Response<AuthDto>> authRegisterPost(
      {required CreateUserDto? body}) {
    generatedMapping.putIfAbsent(AuthDto, () => AuthDto.fromJsonFactory);

    return _authRegisterPost(body: body);
  }

  ///
  @Post(
    path: '/auth/register',
    optionalBody: true,
  )
  Future<chopper.Response<AuthDto>> _authRegisterPost(
      {@Body() required CreateUserDto? body});

  ///
  ///@param catId
  Future<chopper.Response<RecordDto>> recordsCatIdPost({
    required String? catId,
    required CreateRecordDto? body,
  }) {
    generatedMapping.putIfAbsent(RecordDto, () => RecordDto.fromJsonFactory);

    return _recordsCatIdPost(catId: catId, body: body);
  }

  ///
  ///@param catId
  @Post(
    path: '/records/{catId}',
    optionalBody: true,
  )
  Future<chopper.Response<RecordDto>> _recordsCatIdPost({
    @Path('catId') required String? catId,
    @Body() required CreateRecordDto? body,
  });

  ///
  ///@param catId
  ///@param date
  Future<chopper.Response<List<RecordDto>>> recordsAllCatIdGet({
    required String? catId,
    required String? date,
  }) {
    generatedMapping.putIfAbsent(RecordDto, () => RecordDto.fromJsonFactory);

    return _recordsAllCatIdGet(catId: catId, date: date);
  }

  ///
  ///@param catId
  ///@param date
  @Get(path: '/records/all/{catId}')
  Future<chopper.Response<List<RecordDto>>> _recordsAllCatIdGet({
    @Path('catId') required String? catId,
    @Query('date') required String? date,
  });

  ///
  ///@param id
  Future<chopper.Response<RecordDto>> recordsIdPatch({
    required String? id,
    required UpdateRecordDto? body,
  }) {
    generatedMapping.putIfAbsent(RecordDto, () => RecordDto.fromJsonFactory);

    return _recordsIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(
    path: '/records/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<RecordDto>> _recordsIdPatch({
    @Path('id') required String? id,
    @Body() required UpdateRecordDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> recordsIdDelete({required String? id}) {
    return _recordsIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/records/{id}')
  Future<chopper.Response> _recordsIdDelete({@Path('id') required String? id});

  ///
  ///@param catId
  Future<chopper.Response<TodoDto>> todoCatIdPost({
    required String? catId,
    required CreateTodoDto? body,
  }) {
    generatedMapping.putIfAbsent(TodoDto, () => TodoDto.fromJsonFactory);

    return _todoCatIdPost(catId: catId, body: body);
  }

  ///
  ///@param catId
  @Post(
    path: '/todo/{catId}',
    optionalBody: true,
  )
  Future<chopper.Response<TodoDto>> _todoCatIdPost({
    @Path('catId') required String? catId,
    @Body() required CreateTodoDto? body,
  });

  ///
  ///@param catId
  Future<chopper.Response<List<TodoDto>>> todoCatIdGet(
      {required String? catId}) {
    generatedMapping.putIfAbsent(TodoDto, () => TodoDto.fromJsonFactory);

    return _todoCatIdGet(catId: catId);
  }

  ///
  ///@param catId
  @Get(path: '/todo/{catId}')
  Future<chopper.Response<List<TodoDto>>> _todoCatIdGet(
      {@Path('catId') required String? catId});

  ///
  ///@param id
  Future<chopper.Response<TodoDto>> todoDetailIdGet({required String? id}) {
    generatedMapping.putIfAbsent(TodoDto, () => TodoDto.fromJsonFactory);

    return _todoDetailIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/todo/detail/{id}')
  Future<chopper.Response<TodoDto>> _todoDetailIdGet(
      {@Path('id') required String? id});

  ///
  ///@param id
  Future<chopper.Response<TodoDto>> todoIdPatch({
    required String? id,
    required UpdateTodoDto? body,
  }) {
    generatedMapping.putIfAbsent(TodoDto, () => TodoDto.fromJsonFactory);

    return _todoIdPatch(id: id, body: body);
  }

  ///
  ///@param id
  @Patch(
    path: '/todo/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<TodoDto>> _todoIdPatch({
    @Path('id') required String? id,
    @Body() required UpdateTodoDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> todoIdDelete({required String? id}) {
    return _todoIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/todo/{id}')
  Future<chopper.Response> _todoIdDelete({@Path('id') required String? id});

  ///
  ///@param catId
  Future<chopper.Response<List<String>>> chartsMonthCatIdGet(
      {required String? catId}) {
    return _chartsMonthCatIdGet(catId: catId);
  }

  ///
  ///@param catId
  @Get(path: '/charts/month/{catId}')
  Future<chopper.Response<List<String>>> _chartsMonthCatIdGet(
      {@Path('catId') required String? catId});

  ///
  ///@param catId
  ///@param year
  ///@param month
  Future<chopper.Response<List<WeightDto>>> chartsCatCatIdWeightYearMonthGet({
    required String? catId,
    required num? year,
    required num? month,
  }) {
    generatedMapping.putIfAbsent(WeightDto, () => WeightDto.fromJsonFactory);

    return _chartsCatCatIdWeightYearMonthGet(
        catId: catId, year: year, month: month);
  }

  ///
  ///@param catId
  ///@param year
  ///@param month
  @Get(path: '/charts/cat/{catId}/weight/{year}/{month}')
  Future<chopper.Response<List<WeightDto>>> _chartsCatCatIdWeightYearMonthGet({
    @Path('catId') required String? catId,
    @Path('year') required num? year,
    @Path('month') required num? month,
  });

  ///
  ///@param catId
  ///@param year
  ///@param month
  Future<chopper.Response<List<ExpenseDto>>> chartsCatCatIdExpenseYearMonthGet({
    required String? catId,
    required num? year,
    required num? month,
  }) {
    generatedMapping.putIfAbsent(ExpenseDto, () => ExpenseDto.fromJsonFactory);

    return _chartsCatCatIdExpenseYearMonthGet(
        catId: catId, year: year, month: month);
  }

  ///
  ///@param catId
  ///@param year
  ///@param month
  @Get(path: '/charts/cat/{catId}/expense/{year}/{month}')
  Future<chopper.Response<List<ExpenseDto>>>
      _chartsCatCatIdExpenseYearMonthGet({
    @Path('catId') required String? catId,
    @Path('year') required num? year,
    @Path('month') required num? month,
  });
}

@JsonSerializable(explicitToJson: true)
class UserDto {
  const UserDto({
    required this.id,
    required this.email,
    this.username,
    this.avatar,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  static const toJsonFactory = _$UserDtoToJson;
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'avatar')
  final String? avatar;
  static const fromJsonFactory = _$UserDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $UserDtoExtension on UserDto {
  UserDto copyWith(
      {String? id, String? email, String? username, String? avatar}) {
    return UserDto(
        id: id ?? this.id,
        email: email ?? this.email,
        username: username ?? this.username,
        avatar: avatar ?? this.avatar);
  }

  UserDto copyWithWrapped(
      {Wrapped<String>? id,
      Wrapped<String>? email,
      Wrapped<String?>? username,
      Wrapped<String?>? avatar}) {
    return UserDto(
        id: (id != null ? id.value : this.id),
        email: (email != null ? email.value : this.email),
        username: (username != null ? username.value : this.username),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateUserDto {
  const UpdateUserDto({
    this.username,
    this.avatar,
  });

  factory UpdateUserDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDtoFromJson(json);

  static const toJsonFactory = _$UpdateUserDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateUserDtoToJson(this);

  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'avatar')
  final String? avatar;
  static const fromJsonFactory = _$UpdateUserDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UpdateUserDto &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $UpdateUserDtoExtension on UpdateUserDto {
  UpdateUserDto copyWith({String? username, String? avatar}) {
    return UpdateUserDto(
        username: username ?? this.username, avatar: avatar ?? this.avatar);
  }

  UpdateUserDto copyWithWrapped(
      {Wrapped<String?>? username, Wrapped<String?>? avatar}) {
    return UpdateUserDto(
        username: (username != null ? username.value : this.username),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateCatDto {
  const CreateCatDto({
    required this.name,
    required this.gender,
    required this.breed,
    required this.birth,
    required this.image,
    this.insuranceProvider,
    this.insuranceNumber,
  });

  factory CreateCatDto.fromJson(Map<String, dynamic> json) =>
      _$CreateCatDtoFromJson(json);

  static const toJsonFactory = _$CreateCatDtoToJson;
  Map<String, dynamic> toJson() => _$CreateCatDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'gender')
  final String gender;
  @JsonKey(name: 'breed')
  final String breed;
  @JsonKey(name: 'birth')
  final DateTime birth;
  @JsonKey(name: 'image')
  final String image;
  @JsonKey(name: 'insuranceProvider')
  final String? insuranceProvider;
  @JsonKey(name: 'insuranceNumber')
  final String? insuranceNumber;
  static const fromJsonFactory = _$CreateCatDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateCatDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.breed, breed) ||
                const DeepCollectionEquality().equals(other.breed, breed)) &&
            (identical(other.birth, birth) ||
                const DeepCollectionEquality().equals(other.birth, birth)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.insuranceProvider, insuranceProvider) ||
                const DeepCollectionEquality()
                    .equals(other.insuranceProvider, insuranceProvider)) &&
            (identical(other.insuranceNumber, insuranceNumber) ||
                const DeepCollectionEquality()
                    .equals(other.insuranceNumber, insuranceNumber)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(breed) ^
      const DeepCollectionEquality().hash(birth) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(insuranceProvider) ^
      const DeepCollectionEquality().hash(insuranceNumber) ^
      runtimeType.hashCode;
}

extension $CreateCatDtoExtension on CreateCatDto {
  CreateCatDto copyWith(
      {String? name,
      String? gender,
      String? breed,
      DateTime? birth,
      String? image,
      String? insuranceProvider,
      String? insuranceNumber}) {
    return CreateCatDto(
        name: name ?? this.name,
        gender: gender ?? this.gender,
        breed: breed ?? this.breed,
        birth: birth ?? this.birth,
        image: image ?? this.image,
        insuranceProvider: insuranceProvider ?? this.insuranceProvider,
        insuranceNumber: insuranceNumber ?? this.insuranceNumber);
  }

  CreateCatDto copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<String>? gender,
      Wrapped<String>? breed,
      Wrapped<DateTime>? birth,
      Wrapped<String>? image,
      Wrapped<String?>? insuranceProvider,
      Wrapped<String?>? insuranceNumber}) {
    return CreateCatDto(
        name: (name != null ? name.value : this.name),
        gender: (gender != null ? gender.value : this.gender),
        breed: (breed != null ? breed.value : this.breed),
        birth: (birth != null ? birth.value : this.birth),
        image: (image != null ? image.value : this.image),
        insuranceProvider: (insuranceProvider != null
            ? insuranceProvider.value
            : this.insuranceProvider),
        insuranceNumber: (insuranceNumber != null
            ? insuranceNumber.value
            : this.insuranceNumber));
  }
}

@JsonSerializable(explicitToJson: true)
class CatDto {
  const CatDto({
    required this.id,
    required this.name,
    required this.gender,
    required this.breed,
    required this.birth,
    required this.image,
    this.insuranceProvider,
    this.insuranceNumber,
    required this.code,
  });

  factory CatDto.fromJson(Map<String, dynamic> json) => _$CatDtoFromJson(json);

  static const toJsonFactory = _$CatDtoToJson;
  Map<String, dynamic> toJson() => _$CatDtoToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'gender')
  final String gender;
  @JsonKey(name: 'breed')
  final String breed;
  @JsonKey(name: 'birth')
  final DateTime birth;
  @JsonKey(name: 'image')
  final String image;
  @JsonKey(name: 'insuranceProvider')
  final String? insuranceProvider;
  @JsonKey(name: 'insuranceNumber')
  final String? insuranceNumber;
  @JsonKey(name: 'code')
  final String code;
  static const fromJsonFactory = _$CatDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CatDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.breed, breed) ||
                const DeepCollectionEquality().equals(other.breed, breed)) &&
            (identical(other.birth, birth) ||
                const DeepCollectionEquality().equals(other.birth, birth)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.insuranceProvider, insuranceProvider) ||
                const DeepCollectionEquality()
                    .equals(other.insuranceProvider, insuranceProvider)) &&
            (identical(other.insuranceNumber, insuranceNumber) ||
                const DeepCollectionEquality()
                    .equals(other.insuranceNumber, insuranceNumber)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(breed) ^
      const DeepCollectionEquality().hash(birth) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(insuranceProvider) ^
      const DeepCollectionEquality().hash(insuranceNumber) ^
      const DeepCollectionEquality().hash(code) ^
      runtimeType.hashCode;
}

extension $CatDtoExtension on CatDto {
  CatDto copyWith(
      {String? id,
      String? name,
      String? gender,
      String? breed,
      DateTime? birth,
      String? image,
      String? insuranceProvider,
      String? insuranceNumber,
      String? code}) {
    return CatDto(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        breed: breed ?? this.breed,
        birth: birth ?? this.birth,
        image: image ?? this.image,
        insuranceProvider: insuranceProvider ?? this.insuranceProvider,
        insuranceNumber: insuranceNumber ?? this.insuranceNumber,
        code: code ?? this.code);
  }

  CatDto copyWithWrapped(
      {Wrapped<String>? id,
      Wrapped<String>? name,
      Wrapped<String>? gender,
      Wrapped<String>? breed,
      Wrapped<DateTime>? birth,
      Wrapped<String>? image,
      Wrapped<String?>? insuranceProvider,
      Wrapped<String?>? insuranceNumber,
      Wrapped<String>? code}) {
    return CatDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        gender: (gender != null ? gender.value : this.gender),
        breed: (breed != null ? breed.value : this.breed),
        birth: (birth != null ? birth.value : this.birth),
        image: (image != null ? image.value : this.image),
        insuranceProvider: (insuranceProvider != null
            ? insuranceProvider.value
            : this.insuranceProvider),
        insuranceNumber: (insuranceNumber != null
            ? insuranceNumber.value
            : this.insuranceNumber),
        code: (code != null ? code.value : this.code));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateCatDto {
  const UpdateCatDto({
    required this.name,
    required this.gender,
    required this.breed,
    required this.birth,
    required this.image,
    this.insuranceProvider,
    this.insuranceNumber,
  });

  factory UpdateCatDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateCatDtoFromJson(json);

  static const toJsonFactory = _$UpdateCatDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateCatDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'gender')
  final String gender;
  @JsonKey(name: 'breed')
  final String breed;
  @JsonKey(name: 'birth')
  final DateTime birth;
  @JsonKey(name: 'image')
  final String image;
  @JsonKey(name: 'insuranceProvider')
  final String? insuranceProvider;
  @JsonKey(name: 'insuranceNumber')
  final String? insuranceNumber;
  static const fromJsonFactory = _$UpdateCatDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UpdateCatDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.breed, breed) ||
                const DeepCollectionEquality().equals(other.breed, breed)) &&
            (identical(other.birth, birth) ||
                const DeepCollectionEquality().equals(other.birth, birth)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.insuranceProvider, insuranceProvider) ||
                const DeepCollectionEquality()
                    .equals(other.insuranceProvider, insuranceProvider)) &&
            (identical(other.insuranceNumber, insuranceNumber) ||
                const DeepCollectionEquality()
                    .equals(other.insuranceNumber, insuranceNumber)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(breed) ^
      const DeepCollectionEquality().hash(birth) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(insuranceProvider) ^
      const DeepCollectionEquality().hash(insuranceNumber) ^
      runtimeType.hashCode;
}

extension $UpdateCatDtoExtension on UpdateCatDto {
  UpdateCatDto copyWith(
      {String? name,
      String? gender,
      String? breed,
      DateTime? birth,
      String? image,
      String? insuranceProvider,
      String? insuranceNumber}) {
    return UpdateCatDto(
        name: name ?? this.name,
        gender: gender ?? this.gender,
        breed: breed ?? this.breed,
        birth: birth ?? this.birth,
        image: image ?? this.image,
        insuranceProvider: insuranceProvider ?? this.insuranceProvider,
        insuranceNumber: insuranceNumber ?? this.insuranceNumber);
  }

  UpdateCatDto copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<String>? gender,
      Wrapped<String>? breed,
      Wrapped<DateTime>? birth,
      Wrapped<String>? image,
      Wrapped<String?>? insuranceProvider,
      Wrapped<String?>? insuranceNumber}) {
    return UpdateCatDto(
        name: (name != null ? name.value : this.name),
        gender: (gender != null ? gender.value : this.gender),
        breed: (breed != null ? breed.value : this.breed),
        birth: (birth != null ? birth.value : this.birth),
        image: (image != null ? image.value : this.image),
        insuranceProvider: (insuranceProvider != null
            ? insuranceProvider.value
            : this.insuranceProvider),
        insuranceNumber: (insuranceNumber != null
            ? insuranceNumber.value
            : this.insuranceNumber));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateUserDto {
  const CreateUserDto({
    required this.email,
    required this.password,
  });

  factory CreateUserDto.fromJson(Map<String, dynamic> json) =>
      _$CreateUserDtoFromJson(json);

  static const toJsonFactory = _$CreateUserDtoToJson;
  Map<String, dynamic> toJson() => _$CreateUserDtoToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  static const fromJsonFactory = _$CreateUserDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateUserDto &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $CreateUserDtoExtension on CreateUserDto {
  CreateUserDto copyWith({String? email, String? password}) {
    return CreateUserDto(
        email: email ?? this.email, password: password ?? this.password);
  }

  CreateUserDto copyWithWrapped(
      {Wrapped<String>? email, Wrapped<String>? password}) {
    return CreateUserDto(
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthDto {
  const AuthDto({
    required this.token,
    required this.user,
  });

  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);

  static const toJsonFactory = _$AuthDtoToJson;
  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);

  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'user')
  final UserDto user;
  static const fromJsonFactory = _$AuthDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AuthDto &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $AuthDtoExtension on AuthDto {
  AuthDto copyWith({String? token, UserDto? user}) {
    return AuthDto(token: token ?? this.token, user: user ?? this.user);
  }

  AuthDto copyWithWrapped({Wrapped<String>? token, Wrapped<UserDto>? user}) {
    return AuthDto(
        token: (token != null ? token.value : this.token),
        user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateRecordDto {
  const CreateRecordDto({
    required this.catalogue,
    required this.name,
    required this.date,
    required this.$value,
    required this.unit,
  });

  factory CreateRecordDto.fromJson(Map<String, dynamic> json) =>
      _$CreateRecordDtoFromJson(json);

  static const toJsonFactory = _$CreateRecordDtoToJson;
  Map<String, dynamic> toJson() => _$CreateRecordDtoToJson(this);

  @JsonKey(
    name: 'catalogue',
    toJson: createRecordDtoCatalogueToJson,
    fromJson: createRecordDtoCatalogueFromJson,
  )
  final enums.CreateRecordDtoCatalogue catalogue;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'value')
  final double $value;
  @JsonKey(name: 'unit')
  final String unit;
  static const fromJsonFactory = _$CreateRecordDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateRecordDto &&
            (identical(other.catalogue, catalogue) ||
                const DeepCollectionEquality()
                    .equals(other.catalogue, catalogue)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.$value, $value) ||
                const DeepCollectionEquality().equals(other.$value, $value)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(catalogue) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash($value) ^
      const DeepCollectionEquality().hash(unit) ^
      runtimeType.hashCode;
}

extension $CreateRecordDtoExtension on CreateRecordDto {
  CreateRecordDto copyWith(
      {enums.CreateRecordDtoCatalogue? catalogue,
      String? name,
      DateTime? date,
      double? $value,
      String? unit}) {
    return CreateRecordDto(
        catalogue: catalogue ?? this.catalogue,
        name: name ?? this.name,
        date: date ?? this.date,
        $value: $value ?? this.$value,
        unit: unit ?? this.unit);
  }

  CreateRecordDto copyWithWrapped(
      {Wrapped<enums.CreateRecordDtoCatalogue>? catalogue,
      Wrapped<String>? name,
      Wrapped<DateTime>? date,
      Wrapped<double>? $value,
      Wrapped<String>? unit}) {
    return CreateRecordDto(
        catalogue: (catalogue != null ? catalogue.value : this.catalogue),
        name: (name != null ? name.value : this.name),
        date: (date != null ? date.value : this.date),
        $value: ($value != null ? $value.value : this.$value),
        unit: (unit != null ? unit.value : this.unit));
  }
}

@JsonSerializable(explicitToJson: true)
class RecordDto {
  const RecordDto({
    required this.id,
    required this.catalogue,
    required this.name,
    required this.date,
    required this.$value,
    required this.unit,
    required this.cat,
  });

  factory RecordDto.fromJson(Map<String, dynamic> json) =>
      _$RecordDtoFromJson(json);

  static const toJsonFactory = _$RecordDtoToJson;
  Map<String, dynamic> toJson() => _$RecordDtoToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(
    name: 'catalogue',
    toJson: recordDtoCatalogueToJson,
    fromJson: recordDtoCatalogueFromJson,
  )
  final enums.RecordDtoCatalogue catalogue;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'value')
  final double $value;
  @JsonKey(name: 'unit')
  final String unit;
  @JsonKey(name: 'cat')
  final CatDto cat;
  static const fromJsonFactory = _$RecordDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is RecordDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.catalogue, catalogue) ||
                const DeepCollectionEquality()
                    .equals(other.catalogue, catalogue)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.$value, $value) ||
                const DeepCollectionEquality().equals(other.$value, $value)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.cat, cat) ||
                const DeepCollectionEquality().equals(other.cat, cat)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(catalogue) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash($value) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(cat) ^
      runtimeType.hashCode;
}

extension $RecordDtoExtension on RecordDto {
  RecordDto copyWith(
      {String? id,
      enums.RecordDtoCatalogue? catalogue,
      String? name,
      DateTime? date,
      double? $value,
      String? unit,
      CatDto? cat}) {
    return RecordDto(
        id: id ?? this.id,
        catalogue: catalogue ?? this.catalogue,
        name: name ?? this.name,
        date: date ?? this.date,
        $value: $value ?? this.$value,
        unit: unit ?? this.unit,
        cat: cat ?? this.cat);
  }

  RecordDto copyWithWrapped(
      {Wrapped<String>? id,
      Wrapped<enums.RecordDtoCatalogue>? catalogue,
      Wrapped<String>? name,
      Wrapped<DateTime>? date,
      Wrapped<double>? $value,
      Wrapped<String>? unit,
      Wrapped<CatDto>? cat}) {
    return RecordDto(
        id: (id != null ? id.value : this.id),
        catalogue: (catalogue != null ? catalogue.value : this.catalogue),
        name: (name != null ? name.value : this.name),
        date: (date != null ? date.value : this.date),
        $value: ($value != null ? $value.value : this.$value),
        unit: (unit != null ? unit.value : this.unit),
        cat: (cat != null ? cat.value : this.cat));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateRecordDto {
  const UpdateRecordDto({
    this.catalogue,
    this.name,
    this.date,
    this.$value,
    this.unit,
  });

  factory UpdateRecordDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateRecordDtoFromJson(json);

  static const toJsonFactory = _$UpdateRecordDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateRecordDtoToJson(this);

  @JsonKey(
    name: 'catalogue',
    toJson: updateRecordDtoCatalogueNullableToJson,
    fromJson: updateRecordDtoCatalogueNullableFromJson,
  )
  final enums.UpdateRecordDtoCatalogue? catalogue;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'value')
  final double? $value;
  @JsonKey(name: 'unit')
  final String? unit;
  static const fromJsonFactory = _$UpdateRecordDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UpdateRecordDto &&
            (identical(other.catalogue, catalogue) ||
                const DeepCollectionEquality()
                    .equals(other.catalogue, catalogue)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.$value, $value) ||
                const DeepCollectionEquality().equals(other.$value, $value)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(catalogue) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash($value) ^
      const DeepCollectionEquality().hash(unit) ^
      runtimeType.hashCode;
}

extension $UpdateRecordDtoExtension on UpdateRecordDto {
  UpdateRecordDto copyWith(
      {enums.UpdateRecordDtoCatalogue? catalogue,
      String? name,
      DateTime? date,
      double? $value,
      String? unit}) {
    return UpdateRecordDto(
        catalogue: catalogue ?? this.catalogue,
        name: name ?? this.name,
        date: date ?? this.date,
        $value: $value ?? this.$value,
        unit: unit ?? this.unit);
  }

  UpdateRecordDto copyWithWrapped(
      {Wrapped<enums.UpdateRecordDtoCatalogue?>? catalogue,
      Wrapped<String?>? name,
      Wrapped<DateTime?>? date,
      Wrapped<double?>? $value,
      Wrapped<String?>? unit}) {
    return UpdateRecordDto(
        catalogue: (catalogue != null ? catalogue.value : this.catalogue),
        name: (name != null ? name.value : this.name),
        date: (date != null ? date.value : this.date),
        $value: ($value != null ? $value.value : this.$value),
        unit: (unit != null ? unit.value : this.unit));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateTodoDto {
  const CreateTodoDto({
    required this.title,
    required this.description,
    required this.date,
    required this.isCompleted,
  });

  factory CreateTodoDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTodoDtoFromJson(json);

  static const toJsonFactory = _$CreateTodoDtoToJson;
  Map<String, dynamic> toJson() => _$CreateTodoDtoToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'isCompleted')
  final bool isCompleted;
  static const fromJsonFactory = _$CreateTodoDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateTodoDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.isCompleted, isCompleted) ||
                const DeepCollectionEquality()
                    .equals(other.isCompleted, isCompleted)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(isCompleted) ^
      runtimeType.hashCode;
}

extension $CreateTodoDtoExtension on CreateTodoDto {
  CreateTodoDto copyWith(
      {String? title, String? description, DateTime? date, bool? isCompleted}) {
    return CreateTodoDto(
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  CreateTodoDto copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<DateTime>? date,
      Wrapped<bool>? isCompleted}) {
    return CreateTodoDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        date: (date != null ? date.value : this.date),
        isCompleted:
            (isCompleted != null ? isCompleted.value : this.isCompleted));
  }
}

@JsonSerializable(explicitToJson: true)
class TodoDto {
  const TodoDto({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isCompleted,
  });

  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);

  static const toJsonFactory = _$TodoDtoToJson;
  Map<String, dynamic> toJson() => _$TodoDtoToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'isCompleted')
  final bool isCompleted;
  static const fromJsonFactory = _$TodoDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TodoDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.isCompleted, isCompleted) ||
                const DeepCollectionEquality()
                    .equals(other.isCompleted, isCompleted)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(isCompleted) ^
      runtimeType.hashCode;
}

extension $TodoDtoExtension on TodoDto {
  TodoDto copyWith(
      {String? id,
      String? title,
      String? description,
      DateTime? date,
      bool? isCompleted}) {
    return TodoDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  TodoDto copyWithWrapped(
      {Wrapped<String>? id,
      Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<DateTime>? date,
      Wrapped<bool>? isCompleted}) {
    return TodoDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        date: (date != null ? date.value : this.date),
        isCompleted:
            (isCompleted != null ? isCompleted.value : this.isCompleted));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateTodoDto {
  const UpdateTodoDto({
    this.title,
    this.description,
    this.date,
    this.isCompleted,
  });

  factory UpdateTodoDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTodoDtoFromJson(json);

  static const toJsonFactory = _$UpdateTodoDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateTodoDtoToJson(this);

  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'isCompleted')
  final bool? isCompleted;
  static const fromJsonFactory = _$UpdateTodoDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UpdateTodoDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.isCompleted, isCompleted) ||
                const DeepCollectionEquality()
                    .equals(other.isCompleted, isCompleted)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(isCompleted) ^
      runtimeType.hashCode;
}

extension $UpdateTodoDtoExtension on UpdateTodoDto {
  UpdateTodoDto copyWith(
      {String? title, String? description, DateTime? date, bool? isCompleted}) {
    return UpdateTodoDto(
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  UpdateTodoDto copyWithWrapped(
      {Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? date,
      Wrapped<bool?>? isCompleted}) {
    return UpdateTodoDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        date: (date != null ? date.value : this.date),
        isCompleted:
            (isCompleted != null ? isCompleted.value : this.isCompleted));
  }
}

@JsonSerializable(explicitToJson: true)
class WeightDto {
  const WeightDto({
    required this.date,
    required this.$value,
  });

  factory WeightDto.fromJson(Map<String, dynamic> json) =>
      _$WeightDtoFromJson(json);

  static const toJsonFactory = _$WeightDtoToJson;
  Map<String, dynamic> toJson() => _$WeightDtoToJson(this);

  @JsonKey(name: 'date')
  final String date;
  @JsonKey(name: 'value')
  final double $value;
  static const fromJsonFactory = _$WeightDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is WeightDto &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.$value, $value) ||
                const DeepCollectionEquality().equals(other.$value, $value)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash($value) ^
      runtimeType.hashCode;
}

extension $WeightDtoExtension on WeightDto {
  WeightDto copyWith({String? date, double? $value}) {
    return WeightDto(date: date ?? this.date, $value: $value ?? this.$value);
  }

  WeightDto copyWithWrapped({Wrapped<String>? date, Wrapped<double>? $value}) {
    return WeightDto(
        date: (date != null ? date.value : this.date),
        $value: ($value != null ? $value.value : this.$value));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseDto {
  const ExpenseDto({
    required this.name,
    required this.total,
    required this.percentage,
  });

  factory ExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDtoFromJson(json);

  static const toJsonFactory = _$ExpenseDtoToJson;
  Map<String, dynamic> toJson() => _$ExpenseDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'total')
  final double total;
  @JsonKey(name: 'percentage')
  final double percentage;
  static const fromJsonFactory = _$ExpenseDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ExpenseDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.percentage, percentage) ||
                const DeepCollectionEquality()
                    .equals(other.percentage, percentage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(percentage) ^
      runtimeType.hashCode;
}

extension $ExpenseDtoExtension on ExpenseDto {
  ExpenseDto copyWith({String? name, double? total, double? percentage}) {
    return ExpenseDto(
        name: name ?? this.name,
        total: total ?? this.total,
        percentage: percentage ?? this.percentage);
  }

  ExpenseDto copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<double>? total,
      Wrapped<double>? percentage}) {
    return ExpenseDto(
        name: (name != null ? name.value : this.name),
        total: (total != null ? total.value : this.total),
        percentage: (percentage != null ? percentage.value : this.percentage));
  }
}

String? createRecordDtoCatalogueNullableToJson(
    enums.CreateRecordDtoCatalogue? createRecordDtoCatalogue) {
  return createRecordDtoCatalogue?.value;
}

String? createRecordDtoCatalogueToJson(
    enums.CreateRecordDtoCatalogue createRecordDtoCatalogue) {
  return createRecordDtoCatalogue.value;
}

enums.CreateRecordDtoCatalogue createRecordDtoCatalogueFromJson(
  Object? createRecordDtoCatalogue, [
  enums.CreateRecordDtoCatalogue? defaultValue,
]) {
  return enums.CreateRecordDtoCatalogue.values
          .firstWhereOrNull((e) => e.value == createRecordDtoCatalogue) ??
      defaultValue ??
      enums.CreateRecordDtoCatalogue.swaggerGeneratedUnknown;
}

enums.CreateRecordDtoCatalogue? createRecordDtoCatalogueNullableFromJson(
  Object? createRecordDtoCatalogue, [
  enums.CreateRecordDtoCatalogue? defaultValue,
]) {
  if (createRecordDtoCatalogue == null) {
    return null;
  }
  return enums.CreateRecordDtoCatalogue.values
          .firstWhereOrNull((e) => e.value == createRecordDtoCatalogue) ??
      defaultValue;
}

String createRecordDtoCatalogueExplodedListToJson(
    List<enums.CreateRecordDtoCatalogue>? createRecordDtoCatalogue) {
  return createRecordDtoCatalogue?.map((e) => e.value!).join(',') ?? '';
}

List<String> createRecordDtoCatalogueListToJson(
    List<enums.CreateRecordDtoCatalogue>? createRecordDtoCatalogue) {
  if (createRecordDtoCatalogue == null) {
    return [];
  }

  return createRecordDtoCatalogue.map((e) => e.value!).toList();
}

List<enums.CreateRecordDtoCatalogue> createRecordDtoCatalogueListFromJson(
  List? createRecordDtoCatalogue, [
  List<enums.CreateRecordDtoCatalogue>? defaultValue,
]) {
  if (createRecordDtoCatalogue == null) {
    return defaultValue ?? [];
  }

  return createRecordDtoCatalogue
      .map((e) => createRecordDtoCatalogueFromJson(e.toString()))
      .toList();
}

List<enums.CreateRecordDtoCatalogue>?
    createRecordDtoCatalogueNullableListFromJson(
  List? createRecordDtoCatalogue, [
  List<enums.CreateRecordDtoCatalogue>? defaultValue,
]) {
  if (createRecordDtoCatalogue == null) {
    return defaultValue;
  }

  return createRecordDtoCatalogue
      .map((e) => createRecordDtoCatalogueFromJson(e.toString()))
      .toList();
}

String? recordDtoCatalogueNullableToJson(
    enums.RecordDtoCatalogue? recordDtoCatalogue) {
  return recordDtoCatalogue?.value;
}

String? recordDtoCatalogueToJson(enums.RecordDtoCatalogue recordDtoCatalogue) {
  return recordDtoCatalogue.value;
}

enums.RecordDtoCatalogue recordDtoCatalogueFromJson(
  Object? recordDtoCatalogue, [
  enums.RecordDtoCatalogue? defaultValue,
]) {
  return enums.RecordDtoCatalogue.values
          .firstWhereOrNull((e) => e.value == recordDtoCatalogue) ??
      defaultValue ??
      enums.RecordDtoCatalogue.swaggerGeneratedUnknown;
}

enums.RecordDtoCatalogue? recordDtoCatalogueNullableFromJson(
  Object? recordDtoCatalogue, [
  enums.RecordDtoCatalogue? defaultValue,
]) {
  if (recordDtoCatalogue == null) {
    return null;
  }
  return enums.RecordDtoCatalogue.values
          .firstWhereOrNull((e) => e.value == recordDtoCatalogue) ??
      defaultValue;
}

String recordDtoCatalogueExplodedListToJson(
    List<enums.RecordDtoCatalogue>? recordDtoCatalogue) {
  return recordDtoCatalogue?.map((e) => e.value!).join(',') ?? '';
}

List<String> recordDtoCatalogueListToJson(
    List<enums.RecordDtoCatalogue>? recordDtoCatalogue) {
  if (recordDtoCatalogue == null) {
    return [];
  }

  return recordDtoCatalogue.map((e) => e.value!).toList();
}

List<enums.RecordDtoCatalogue> recordDtoCatalogueListFromJson(
  List? recordDtoCatalogue, [
  List<enums.RecordDtoCatalogue>? defaultValue,
]) {
  if (recordDtoCatalogue == null) {
    return defaultValue ?? [];
  }

  return recordDtoCatalogue
      .map((e) => recordDtoCatalogueFromJson(e.toString()))
      .toList();
}

List<enums.RecordDtoCatalogue>? recordDtoCatalogueNullableListFromJson(
  List? recordDtoCatalogue, [
  List<enums.RecordDtoCatalogue>? defaultValue,
]) {
  if (recordDtoCatalogue == null) {
    return defaultValue;
  }

  return recordDtoCatalogue
      .map((e) => recordDtoCatalogueFromJson(e.toString()))
      .toList();
}

String? updateRecordDtoCatalogueNullableToJson(
    enums.UpdateRecordDtoCatalogue? updateRecordDtoCatalogue) {
  return updateRecordDtoCatalogue?.value;
}

String? updateRecordDtoCatalogueToJson(
    enums.UpdateRecordDtoCatalogue updateRecordDtoCatalogue) {
  return updateRecordDtoCatalogue.value;
}

enums.UpdateRecordDtoCatalogue updateRecordDtoCatalogueFromJson(
  Object? updateRecordDtoCatalogue, [
  enums.UpdateRecordDtoCatalogue? defaultValue,
]) {
  return enums.UpdateRecordDtoCatalogue.values
          .firstWhereOrNull((e) => e.value == updateRecordDtoCatalogue) ??
      defaultValue ??
      enums.UpdateRecordDtoCatalogue.swaggerGeneratedUnknown;
}

enums.UpdateRecordDtoCatalogue? updateRecordDtoCatalogueNullableFromJson(
  Object? updateRecordDtoCatalogue, [
  enums.UpdateRecordDtoCatalogue? defaultValue,
]) {
  if (updateRecordDtoCatalogue == null) {
    return null;
  }
  return enums.UpdateRecordDtoCatalogue.values
          .firstWhereOrNull((e) => e.value == updateRecordDtoCatalogue) ??
      defaultValue;
}

String updateRecordDtoCatalogueExplodedListToJson(
    List<enums.UpdateRecordDtoCatalogue>? updateRecordDtoCatalogue) {
  return updateRecordDtoCatalogue?.map((e) => e.value!).join(',') ?? '';
}

List<String> updateRecordDtoCatalogueListToJson(
    List<enums.UpdateRecordDtoCatalogue>? updateRecordDtoCatalogue) {
  if (updateRecordDtoCatalogue == null) {
    return [];
  }

  return updateRecordDtoCatalogue.map((e) => e.value!).toList();
}

List<enums.UpdateRecordDtoCatalogue> updateRecordDtoCatalogueListFromJson(
  List? updateRecordDtoCatalogue, [
  List<enums.UpdateRecordDtoCatalogue>? defaultValue,
]) {
  if (updateRecordDtoCatalogue == null) {
    return defaultValue ?? [];
  }

  return updateRecordDtoCatalogue
      .map((e) => updateRecordDtoCatalogueFromJson(e.toString()))
      .toList();
}

List<enums.UpdateRecordDtoCatalogue>?
    updateRecordDtoCatalogueNullableListFromJson(
  List? updateRecordDtoCatalogue, [
  List<enums.UpdateRecordDtoCatalogue>? defaultValue,
]) {
  if (updateRecordDtoCatalogue == null) {
    return defaultValue;
  }

  return updateRecordDtoCatalogue
      .map((e) => updateRecordDtoCatalogueFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
