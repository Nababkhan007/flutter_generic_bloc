import 'dart:developer';
import 'package:flutter_generic_bloc/model/author_model.dart';
import 'package:flutter_generic_bloc/common/api/api_constants.dart';
import 'package:flutter_generic_bloc/data/impl/author_information.dart';
import 'package:flutter_generic_bloc/data/network/author_api_service.dart';

class AuthorRepository {
  AuthorApiService authorApiService = AuthorInformation();

  Future<List<AuthorModel>> getAuthors() async {
    try {
      dynamic response = await authorApiService.getAuthors(ApiUrls.urlPostsPath);
      log("complete author success $response");

      return response = authorModelFromJson(response.data);
    } catch (e) {
      log("complete author error = $e");

      rethrow;
    }
  }
}
