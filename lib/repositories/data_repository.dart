import 'package:dio/dio.dart';

class DataRepository {
  DataRepository({required this.dio});
  final Dio dio;

  Future<String> fetchData() async {
    try {
      final response = await dio.get('https://juejin.cn/post/7358450927115370530?searchId=2026041511060585A9734C338FDC0AC0D2');
      final String htmlContent = response.data.toString();
      final RegExp regExp = RegExp(r'<body[^>]*>([\s\S]*?)<\/body>');
      final Match? match = regExp.firstMatch(htmlContent);
      
      if (match != null && match.groupCount >= 1) {
        String bodyContent = match.group(1)!;
        bodyContent = bodyContent.replaceAll(RegExp(r'<script[^>]*>([\s\S]*?)<\/script>'), '');
        bodyContent = bodyContent.replaceAll(RegExp(r'<style[^>]*>([\s\S]*?)<\/style>'), '');
        bodyContent = bodyContent.replaceAll(RegExp(r'\s\s+'), ' ');
        bodyContent = bodyContent.replaceAll(RegExp(r' +'), '');
        bodyContent = bodyContent.trim();
        return bodyContent.isEmpty ? "No readable content found in body." : bodyContent;
      } else {
        return "Could not extract body content from the HTML.";
      }
    } on DioException catch (e) {
      throw Exception('Error fetching data: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
