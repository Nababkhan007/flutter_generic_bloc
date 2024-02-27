import 'package:flutter_generic_bloc/common/api/api_constants.dart';
import 'package:flutter_generic_bloc/data/network/author_api_service.dart';

class AuthorInformation extends AuthorApiService {
  @override
  Future getAuthors(String url) async {
    return await ApiService().get(url);
  }
}
