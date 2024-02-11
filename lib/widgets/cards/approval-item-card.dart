import 'package:flutter/material.dart';

class ApprovalItemCard extends StatelessWidget {
  const ApprovalItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        // surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      Text(
                        "25 April 2023 - 27 April 2023",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0XFFfafdf5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Approved",
                        style:
                        TextStyle(color: Color(0XFFa3d139), fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: const BoxDecoration(
                    border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1))),
              ),
              const SizedBox(
                height: 8,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apply Days",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "7 Days",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Approved By",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Tosin Abasi",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
