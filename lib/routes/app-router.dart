import 'package:attendance_prototype/pages/attendance/attendance.page.dart';
import 'package:attendance_prototype/pages/auth/sign_in.page.dart';
import 'package:attendance_prototype/pages/auth/sign_up.page.dart';
import 'package:attendance_prototype/pages/main/main.page.dart';
import 'package:attendance_prototype/pages/manual-attendance/manual_attendance.page.dart';
import 'package:attendance_prototype/utils/constant.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getRoutes(bool isUserAlreadyLogin) {
    return GoRouter(
        initialLocation: isUserAlreadyLogin
            ? "/approval/attendance/manual-attendance"
            : '/signIn',
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
          ),
          GoRoute(
            name: "attendance",
            path: '/attendance/:userId/:isUserClickIn/:attendanceId',
            builder: (context, state) {
              final attendanceIdParam = state.pathParameters["attendanceId"];
              final userId = state.pathParameters["userId"];
              final isUserClickIn = state.pathParameters["isUserClickIn"];

              bool userState = false;
              if (isUserClickIn != null && isUserClickIn == "true") {
                userState = true;
              }

              if (isUserClickIn != null && isUserClickIn == "false") {
                userState = false;
              }

              String? attendanceId = attendanceIdParam == Constants.nullAsString
                  ? null
                  : attendanceIdParam;

              return AttendancePage(
                attendanceId: attendanceId,
                userId: userId!,
                isUserClickIn: userState,
              );
            },
          ),
          GoRoute(
            name: "approval-manual-attendance",
            path: "/approval/attendance/manual-attendance",
            builder: (context, state) {
              return const ManualAttendancePage();
            },
          ),
        ]);
  }
}
