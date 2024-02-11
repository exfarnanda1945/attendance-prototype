import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class FilePicker extends StatelessWidget {
  const FilePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Attachments",
              style: TextStyle( fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {},
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [5, 5],
                      color: Colors.grey,
                      strokeWidth: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "Choose File",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Image.network(
                                      "https://images.unsplash.com/photo-1706722267667-16cdc2a095a1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      height: 120,
                                      width: 120,
                                    ),
                                    const Text("Example.jpg")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.network(
                                      "https://images.unsplash.com/photo-1706180484683-5c8230e92f30?q=80&w=2148&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      height: 120,
                                      width: 120,
                                    ),
                                    const Text("Example.jpg")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.network(
                                      "https://images.unsplash.com/photo-1586105251261-72a756497a11?q=80&w=2158&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      height: 120,
                                      width: 120,
                                    ),
                                    const Text("Example.jpg")
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
