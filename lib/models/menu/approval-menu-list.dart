import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ApprovalMenu {
  ApprovalMenu({
    required this.title,
    required this.subMenu,
  });

  final String title;
  final List<ApprovalSubMenu> subMenu;
}

class ApprovalSubMenu {
  const ApprovalSubMenu(
      {required this.icon, required this.title, required this.pathNavigate});

  final String title;
  final IconData icon;
  final String pathNavigate;
}

List<ApprovalMenu> approvalMenu = [
  ApprovalMenu(title: "Attendance", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.app_shortcut,
        title: "Manual Attendance",
        pathNavigate: "approval-manual-attendance")
  ]),
  ApprovalMenu(title: "Sick and Leave", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.medication_outlined, title: "Sick", pathNavigate: "sick"),
    ApprovalSubMenu(
        icon: Symbols.digital_out_of_home,
        title: "Out From Work",
        pathNavigate: "ofw"),
    ApprovalSubMenu(
        icon: Symbols.tab_move, title: "Out From Office", pathNavigate: "ofo")
  ]),
  ApprovalMenu(title: "Work", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.pending_actions, title: "Overtime", pathNavigate: "feature-soon")
  ]),
  ApprovalMenu(title: "Finance", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.request_quote,
        title: "Reimbursement",
        pathNavigate: "feature-soon"),
    ApprovalSubMenu(
        icon: Icons.receipt, title: "Salary Slip", pathNavigate: "feature-soon")
  ]),
  ApprovalMenu(title: "Other", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.handshake,
        title: "Resign Application",
        pathNavigate: "feature-soon")
  ]),
];
