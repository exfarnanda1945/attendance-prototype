import 'package:attendance_prototype/pages/approval/ofo/ofo-add-edit-page.dart';
import 'package:attendance_prototype/pages/approval/ofo/ofo-approval-page.dart';
import 'package:attendance_prototype/pages/approval/ofw/ofw-add-edit-page.dart';
import 'package:attendance_prototype/pages/approval/ofw/ofw-approval-screen.dart';
import 'package:attendance_prototype/pages/approval/sick/sick-add-edit-page.dart';
import 'package:attendance_prototype/pages/approval/sick/sick-page.dart';
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
        initialLocation: isUserAlreadyLogin ? "/approval/ofo" : '/signIn',
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
          GoRoute(
            name: "sick",
            path: "/approval/sick",
            routes: [
              GoRoute(
                path: "add-edit",
                name: "sick-add-edit",
                builder: (context, state) {
                  return const SickAddEditPage();
                },
              )
            ],
            builder: (context, state) {
              return const SickPage();
            },
          ),
          GoRoute(
            name: "ofw",
            path: "/approval/ofw",
            routes: [
              GoRoute(
                path: "add-edit",
                name: "ofw-add-edit",
                builder: (context, state) {
                  return const OfwAddEditPage();
                },
              )
            ],
            builder: (context, state) {
              return const OfwApprovalScreen();
            },
          ),
          GoRoute(
            name: "ofo",
            path: "/approval/ofo",
            routes: [
              GoRoute(
                path: "add-edit",
                name: "ofo-add-edit",
                builder: (context, state) {
                  return const OfoAddEditPage();
                },
              )
            ],
            builder: (context, state) {
              return const OfoApprovalPage();
            },
          ),
        ]);
  }
}
