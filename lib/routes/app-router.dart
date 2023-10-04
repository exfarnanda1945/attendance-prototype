import 'package:attendance_prototype/pages/auth/sign_in.page.dart';
import 'package:attendance_prototype/pages/auth/sign_up.page.dart';
import 'package:attendance_prototype/pages/main/main.page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getRoutes(bool isUserAlreadyLogin) {
    return GoRouter(
        initialLocation: isUserAlreadyLogin ? "/main" : '/signIn',
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: '/signUp',
            builder: (context, state) {
              return const SignUpPage();
            },
          ),
          GoRoute(
            path: '/signIn',
            builder: (context, state) {
              return const SignInPage();
            },
          ),
          GoRoute(
            path: '/main',
            builder: (context, state) {
              return const MainPage();
            },
          )
        ]);
  }
}
