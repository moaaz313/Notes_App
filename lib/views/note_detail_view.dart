import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
import '../../models/note_model.dart';
import 'edit_note_screen.dart';
import 'widgets/custom_app_bar.dart';

class NoteDetailView extends StatefulWidget {
  final NoteModel note;

  const NoteDetailView({Key? key, required this.note}) : super(key: key);

  @override
  _NoteDetailViewState createState() => _NoteDetailViewState();
}

class _NoteDetailViewState extends State<NoteDetailView> {
  late NoteModel currentNote;

  @override
  void initState() {
    super.initState();
    currentNote = widget.note; // Initialize with the note passed in
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomAppBar(
              x: () {
                Navigator.pop(context);
              },
              isIcon: true,
              isBack: true,
              title: 'Note Details',
              icon: Icons.edit,
              onPressed: () async {
                final updatedNote = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNoteScreen(note: currentNote),
                  ),
                );

                // If a note was updated, refresh the UI
                if (updatedNote != null) {
                  setState(() {
                    currentNote = updatedNote;
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentNote.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Use RichText with TextSpan to style and handle links
                  RichText(
                    text: _buildTextWithLinks(currentNote.subTitle),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }

  TextSpan _buildTextWithLinks(String text) {
    final RegExp urlRegExp = RegExp(
      r"(https?:\/\/[^\s]+)", // Regex to detect URLs
      caseSensitive: false,
    );

    List<TextSpan> spans = [];
    text.splitMapJoin(
      urlRegExp,
      onMatch: (match) {
        final String url = match.group(0) ?? '';
        spans.add(
          TextSpan(
            text: url,
            style: const TextStyle(
                color: Colors.blue, decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final Uri? uri = Uri.tryParse(url);

                if (uri == null) {
                  print("Invalid URL: $url");
                  return;
                }

                try {
                  // Try launching in in-app web view first
                  bool inAppWebViewSupported = await launchUrl(
                    uri,
                    mode: LaunchMode.platformDefault,
                  );

                  // If in-app web view is not supported or fails, use external browser as fallback
                  if (!inAppWebViewSupported) {
                    bool launched = await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );

                    if (!launched) {
                      print(
                          "Could not launch $url. The URL might be unsupported.");
                    }
                  }
                } catch (e) {
                  print("An error occurred while trying to launch $url: $e");
                }
              },
          ),
        );
        return '';
      },
      onNonMatch: (nonMatch) {
        spans.add(TextSpan(text: nonMatch));
        return '';
      },
    );

    return TextSpan(
        style: const TextStyle(color: Colors.white, fontSize: 18),
        children: spans);
  }
}
