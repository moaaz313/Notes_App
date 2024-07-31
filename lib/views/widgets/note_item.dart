import 'package:flutter/material.dart';

import '../edit_note_screen.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const EditNoteScreen();
          }),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blueGrey.withOpacity(0.8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  "Flutter Tips",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    "Build Your Career With Me ans dfdf dfdf rtrt erererer ererer ererer erere erere wewr rtrtr rtrt rtrt rtrt moaax ",
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                trailing: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "May 21,2022",
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
