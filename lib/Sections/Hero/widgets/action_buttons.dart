import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

class ActionButtons extends StatelessWidget {
  final Function(String)? onNavigate;

  const ActionButtons({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 15,
      alignment: WrapAlignment.center,
      children: [
        _buildPrimaryButton(HeroConstants.viewProjectsButton),
        _buildSecondaryButton(context, HeroConstants.downloadCvButton),
      ],
    );
  }

  Widget _buildPrimaryButton(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Navigate to projects section
          if (onNavigate != null) {
            onNavigate!('Projects');
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(BuildContext context, String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _downloadCV(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[400]!),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.download,
                color: Colors.grey[300],
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _downloadCV(BuildContext context) async {
    try {
      if (kIsWeb) {
        // For web platform
        final ByteData data = await rootBundle.load('assets/Ameur_Menouer_CV.pdf');
        final Uint8List bytes = data.buffer.asUint8List();
        
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = 'Ameur_Menouer_CV.pdf';
        html.document.body?.children.add(anchor);
        anchor.click();
        html.document.body?.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      } else {
        // For mobile platforms - show message since actual file saving requires platform-specific implementation
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('CV download started! Check your downloads folder.'),
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error downloading CV: ${e.toString()}'),
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
