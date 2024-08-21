import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';

import '../edit_note_screen.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note, required this.onPress});
  final NoteModel note;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteScreen(
              note: note,
            );
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
                title: Text(
                  note.title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    note.subTitle,
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                trailing: IconButton(
                  onPressed: onPress,
                  icon: const Icon(Icons.delete),
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                note.date,
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
