// dart format width=80
//Generated code

part of 'api_json.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiJson extends ApiJson {
  _$ApiJson([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiJson;

  @override
  Future<Response<dynamic>> _get() {
    final Uri $url = Uri.parse('/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserDto>> _usersGet() {
    final Uri $url = Uri.parse('/users');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserDto, UserDto>($request);
  }

  @override
  Future<Response<UserDto>> _usersPatch({required UpdateUserDto? body}) {
    final Uri $url = Uri.parse('/users');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserDto, UserDto>($request);
  }

  @override
  Future<Response<CatDto>> _catsPost({required CreateCatDto? body}) {
    final Uri $url = Uri.parse('/cats');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CatDto, CatDto>($request);
  }

  @override
  Future<Response<List<CatDto>>> _catsGet() {
    final Uri $url = Uri.parse('/cats');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CatDto>, CatDto>($request);
  }

  @override
  Future<Response<CatDto>> _catsCodePost({required String? body}) {
    final Uri $url = Uri.parse('/cats/code');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CatDto, CatDto>($request);
  }

  @override
  Future<Response<CatDto>> _catsIdGet({required String? id}) {
    final Uri $url = Uri.parse('/cats/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CatDto, CatDto>($request);
  }

  @override
  Future<Response<CatDto>> _catsIdPatch({
    required String? id,
    required UpdateCatDto? body,
  }) {
    final Uri $url = Uri.parse('/cats/${id}');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CatDto, CatDto>($request);
  }

  @override
  Future<Response<Object>> _catsIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/cats/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<AuthDto>> _authLoginPost({required CreateUserDto? body}) {
    final Uri $url = Uri.parse('/auth/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AuthDto, AuthDto>($request);
  }

  @override
  Future<Response<AuthDto>> _authRegisterPost({required CreateUserDto? body}) {
    final Uri $url = Uri.parse('/auth/register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AuthDto, AuthDto>($request);
  }

  @override
  Future<Response<RecordDto>> _recordsCatIdPost({
    required String? catId,
    required CreateRecordDto? body,
  }) {
    final Uri $url = Uri.parse('/records/${catId}');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<RecordDto, RecordDto>($request);
  }

  @override
  Future<Response<List<RecordDto>>> _recordsAllCatIdGet({
    required String? catId,
    required String? date,
  }) {
    final Uri $url = Uri.parse('/records/all/${catId}');
    final Map<String, dynamic> $params = <String, dynamic>{'date': date};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<RecordDto>, RecordDto>($request);
  }

  @override
  Future<Response<RecordDto>> _recordsIdPatch({
    required String? id,
    required UpdateRecordDto? body,
  }) {
    final Uri $url = Uri.parse('/records/${id}');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<RecordDto, RecordDto>($request);
  }

  @override
  Future<Response<dynamic>> _recordsIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/records/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<TodoDto>> _todoCatIdPost({
    required String? catId,
    required CreateTodoDto? body,
  }) {
    final Uri $url = Uri.parse('/todo/${catId}');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TodoDto, TodoDto>($request);
  }

  @override
  Future<Response<List<TodoDto>>> _todoCatIdGet({required String? catId}) {
    final Uri $url = Uri.parse('/todo/${catId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<TodoDto>, TodoDto>($request);
  }

  @override
  Future<Response<TodoDto>> _todoDetailIdGet({required String? id}) {
    final Uri $url = Uri.parse('/todo/detail/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TodoDto, TodoDto>($request);
  }

  @override
  Future<Response<TodoDto>> _todoIdPatch({
    required String? id,
    required UpdateTodoDto? body,
  }) {
    final Uri $url = Uri.parse('/todo/${id}');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TodoDto, TodoDto>($request);
  }

  @override
  Future<Response<dynamic>> _todoIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/todo/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<String>>> _chartsMonthCatIdGet(
      {required String? catId}) {
    final Uri $url = Uri.parse('/charts/month/${catId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<String>, String>($request);
  }

  @override
  Future<Response<List<WeightDto>>> _chartsCatCatIdWeightYearMonthGet({
    required String? catId,
    required num? year,
    required num? month,
  }) {
    final Uri $url = Uri.parse('/charts/cat/${catId}/weight/${year}/${month}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<WeightDto>, WeightDto>($request);
  }

  @override
  Future<Response<List<ExpenseDto>>> _chartsCatCatIdExpenseYearMonthGet({
    required String? catId,
    required num? year,
    required num? month,
  }) {
    final Uri $url = Uri.parse('/charts/cat/${catId}/expense/${year}/${month}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<ExpenseDto>, ExpenseDto>($request);
  }
}
