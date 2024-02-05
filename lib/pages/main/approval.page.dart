import 'package:attendance_prototype/models/menu/approval-menu-list.dart';
import 'package:flutter/material.dart';

class ApprovalPage extends StatelessWidget {
  const ApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: ListView.builder(
            itemCount: approvalMenu.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = approvalMenu[index];
              return approvalMenuItem(item);
            },
          ),
        ),
      ),
    );
  }

  Widget approvalMenuItem(ApprovalMenu item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12, bottom: 8),
            child: approvalSubMenuItem(item),
          )
        ],
      ),
    );
  }

  ListView approvalSubMenuItem(ApprovalMenu item) {
    return ListView.builder(
      itemCount: item.subMenu.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final subMenuItem = item.subMenu[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Icon(
                subMenuItem.icon,
                size: 32,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(subMenuItem.title)
            ],
          ),
        );
      },
    );
  }
}
