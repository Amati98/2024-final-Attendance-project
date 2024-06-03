import 'dart:convert';
import 'dart:io';
import 'package:final_year/service/models/attendance_models.dart';
import 'package:final_year/service/models/user_models.dart';
import 'package:final_year/utils/app_urls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

// Define a provider for the ApiService
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  // Create an HttpClient that bypasses SSL verification
  HttpClient createHttpClient() {
    final httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return httpClient;
  }

  // Method to perform login
  Future<User> login(String username, String password) async {
    try {
      // Prepare the login request payload
      final httpClient = createHttpClient();
      final ioClient = IOClient(httpClient);

      final response = await ioClient.post(
        Uri.parse("${AppUrls.baseUrl}/api/Staffs/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Parse the response body and return the User object
        return User.fromJson(jsonDecode(response.body));
      } else {
        // Handle non-200 responses
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      throw Exception('Error during login: $e');
    }
  }

  Future<List<Attendance>> fetchAttendanceHistories(int id) async {
    final response = await http.get(
      Uri.parse('${AppUrls.baseUrl}/api/AttendanceHistories/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // Parse the response body as a single JSON object
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Convert the single JSON object to an Attendance object and wrap it in a list
      return [Attendance.fromJson(jsonResponse)];
    } else {
      throw Exception('Failed to load attendance histories');
    }
  }

  // New function for posting attendance
  Future<Attendance> postAttendanceHistory(
      int staffId, String date, String timeIn, String timeOut) async {
    final response = await http.post(
      Uri.parse("${AppUrls.baseUrl}/api/AttendanceHistories"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'staffId': staffId,
        'date': date,
        'timeIn': timeIn,
        'timeOut': timeOut,
      }),
    );

    if (response.statusCode == 201) {
      return Attendance.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post attendance');
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

class AttendanceNotifier extends StateNotifier<Attendance?> {
  AttendanceNotifier() : super(null);

  void setAttendance(Attendance attendance) {
    state = attendance;
  }
}

// Define a StateNotifierProvider for the user state
final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});

// Define a StateNotifierProvider for the user state
final attendanceProvider =
    StateNotifierProvider<AttendanceNotifier, Attendance?>((ref) {
  return AttendanceNotifier();
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

//define provider for attendance
final attendanceHistoriesProvider =
    FutureProvider.family<List<Attendance>, int>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.fetchAttendanceHistories(id);
});

// Define a FutureProvider for post attendance
final attendancePostProvider =
    FutureProvider.family<Attendance, Map<String, String>>(
        (ref, postData) async {
  final apiService = ref.watch(apiServiceProvider);
  final attendance = await apiService.postAttendanceHistory(
    int.parse(postData['staffId']!), // Convert staffId to integer
    postData['date']!,
    postData['timeIn']!,
    postData['timeOut']!,
  );

  // Access the provider reference and call setAttendance
  ref.read(attendanceProvider.notifier).setAttendance(attendance);

  return attendance;
});
