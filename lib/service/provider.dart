import 'dart:convert';

import 'package:final_year/service/models.dart';
import 'package:final_year/utils/app_urls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// Define a provider for the ApiService
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  // Method to perform login
  Future<User> login(String username, String password) async {
    try {
      // Prepare the login request payload
      final response = await http.post(
        Uri.parse("${AppUrls.baseUrl}/api/Staffs/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      print({response: "response"});

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Parse the response body and return the User object
        return User.fromJson(jsonDecode(response.body));
      } else {
        // Handle non-200 responses
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      print({e: "e"});
      // Handle any errors that occur during the request
      throw Exception('Error during login: $e');
    }
  }
}

// Define a StateNotifier for the user state
class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  void setUser(User user) {
    state = user;
  }
}

// Define a StateNotifierProvider for the user state
final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});

// Define a FutureProvider for login
final loginProvider =
    FutureProvider.family<User, Map<String, String>>((ref, credentials) async {
  final apiService = ref.watch(apiServiceProvider);
  final user = await apiService.login(
      credentials['username']!, credentials['password']!);

  // Access the provider reference and call setUser
  ref.read(userProvider.notifier).setUser(user);

  return user;
});
