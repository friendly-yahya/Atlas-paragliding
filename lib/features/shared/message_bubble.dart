import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';


class MessageBubbleTheme {
  /// Background of bubbles sent by the current user.
  final Color meBubbleBg;

  /// Text color inside sent bubbles.
  final Color meTextColor;

  /// Background of bubbles received from the other person.
  final Color otherBubbleBg;

  /// Text color inside received bubbles.
  final Color otherTextColor;

  /// Color of the timestamp label below each bubble.
  final Color timestampColor;

  const MessageBubbleTheme({
    required this.meBubbleBg,
    required this.meTextColor,
    required this.otherBubbleBg,
    required this.otherTextColor,
    required this.timestampColor,
  });

  // ── Light — client ──────────────────────────────────────────────────────────
  static MessageBubbleTheme light(ColorScheme cs) => MessageBubbleTheme(
        meBubbleBg: cs.primary,
        meTextColor: Colors.white,
        otherBubbleBg: cs.surfaceContainerHighest,
        otherTextColor: cs.onSurface,
        timestampColor: cs.onSurfaceVariant,
      );

  // ── Dark — pilot ────────────────────────────────────────────────────────────
  static MessageBubbleTheme dark(ColorScheme cs) => MessageBubbleTheme(
        meBubbleBg: cs.primary,
        meTextColor: Colors.white,
        otherBubbleBg: cs.surfaceContainerHighest,
        otherTextColor: cs.onSurface.withValues(alpha: 0.85),
        timestampColor: cs.onSurface.withValues(alpha: 0.3),
      );
}

class MessageBubble extends StatelessWidget {
  /// The message text to display.
  final String text;

  /// True when this bubble was sent by the current user (aligns right).
  final bool isMe;

  /// Formatted timestamp string shown below the bubble.
  final String time;

  /// Controls bubble and text colors for light/dark surfaces.
  final MessageBubbleTheme bubbleTheme;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
    required this.bubbleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final t = bubbleTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.space8),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // ── Bubble ──────────────────────────────────────────────────────────
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.72,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.space16,
              vertical: AppTheme.space12,
            ),
            decoration: BoxDecoration(
              color: isMe ? t.meBubbleBg : t.otherBubbleBg,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(AppTheme.rounded12),
                topRight: const Radius.circular(AppTheme.rounded12),
                bottomLeft: Radius.circular(
                  isMe ? AppTheme.rounded12 : AppTheme.rounded4,
                ),
                bottomRight: Radius.circular(
                  isMe ? AppTheme.rounded4 : AppTheme.rounded12,
                ),
              ),
            ),
            child: Text(
              text,
              style: AppTheme.paragraphSmRegular.copyWith(
                color: isMe ? t.meTextColor : t.otherTextColor,
              ),
            ),
          ),

          // ── Timestamp ────────────────────────────────────────────────────────
          const SizedBox(height: 2),
          Text(
            time,
            style: AppTheme.micro.copyWith(color: t.timestampColor),
          ),
        ],
      ),
    );
  }
}