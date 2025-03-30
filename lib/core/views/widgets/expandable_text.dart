import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../styles/fonts.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;

  const ExpandableText({
    super.key,
    required this.text,
    this.maxLines = 4,
    required this.style,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: widget.style,
          maxLines: _isExpanded ? null : widget.maxLines,
          overflow: _isExpanded ? null : TextOverflow.ellipsis,
        ),
        if (widget.text.length > 100) // Only show button for long text
          TextButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Show Less' : 'Show More',
              style: AppFonts.bodyText16.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
