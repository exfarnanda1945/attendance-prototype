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
      {required this.icon, required this.title, required this.onNavigate});

  final String title;
  final IconData icon;
  final String onNavigate;
}

List<ApprovalMenu> approvalMenu = [
  ApprovalMenu(title: "Attendance", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.app_shortcut,
        title: "Manual Attendance",
        onNavigate: "manual-attendance")
  ]),
  ApprovalMenu(title: "Sick and Leave", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.medication_outlined, title: "Sick", onNavigate: "sick"),
    ApprovalSubMenu(
        icon: Symbols.digital_out_of_home,
        title: "Out From Work",
        onNavigate: "ofw"),
    ApprovalSubMenu(
        icon: Symbols.tab_move, title: "Out From Office", onNavigate: "ofo")
  ]),
  ApprovalMenu(title: "Work", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.pending_actions, title: "Overtime", onNavigate: "overtime")
  ]),
  ApprovalMenu(title: "Finance", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.request_quote,
        title: "Reimbursement",
        onNavigate: "reimbursement"),
    ApprovalSubMenu(
        icon: Icons.receipt, title: "Salary Slip", onNavigate: "salary-slip")
  ]),
  ApprovalMenu(title: "Other", subMenu: const [
    ApprovalSubMenu(
        icon: Icons.handshake,
        title: "Resign Application",
        onNavigate: "resign")
  ]),
];
