import 'package:attendance_prototype/widgets/cards/approval-item-card.dart';
import 'package:attendance_prototype/widgets/cards/counter-card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OfoApprovalPage extends StatelessWidget {
  const OfoApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton:
      FloatingActionButton(onPressed: () {
        context.pushNamed("ofo-add-edit");
      }, child: const Icon(Icons.add)),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CounterCard(title:"Total",count: 32),
              CounterCard(title:"Approved",count: 18),
              CounterCard(title:"Pending",count: 2),
              CounterCard(title:"Cancelled",count: 12),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Records",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    children: [
                      Text(
                        "Filter",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.tune),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const ApprovalItemCard(),
              ),
            ),
          )
        ],
      ),
    );;
  }
}
