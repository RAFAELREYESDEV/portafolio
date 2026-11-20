import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/projects_screen.dart';
import '../screens/hobbies_screen.dart';
import '../screens/comments_screen.dart';
import '../screens/signature_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String about = '/about';
  static const String projects = '/projects';
  static const String hobbies = '/hobbies';
  static const String comments = '/comments';
  static const String signature = '/signature';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initialRoute: (context) => const HomeScreen(),
      about: (context) => const AboutScreen(),
      projects: (context) => const ProjectsScreen(),
      hobbies: (context) => const HobbiesScreen(),
      comments: (context) => const CommentsScreen(),
      signature: (context) => const SignatureScreen(),
    };
  }
}
