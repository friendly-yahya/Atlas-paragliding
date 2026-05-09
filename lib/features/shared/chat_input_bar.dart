import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';


class ChatInputBarTheme {
  /// Background of the whole input bar container.
  final Color barBg;

  /// Color of the 1 px top border.
  final Color borderColor;

  /// Background of the rounded text field pill.
  final Color fieldBg;

  /// Style applied to the typed text inside the field.
  final TextStyle textStyle;

  /// Color of the placeholder / hint text.
  final Color hintColor;

  /// Fill color of the circular send button.
  final Color sendButtonColor;

  const ChatInputBarTheme({
    required this.barBg,
    required this.borderColor,
    required this.fieldBg,
    required this.textStyle,
    required this.hintColor,
    required this.sendButtonColor,
  });

  // ── Light — client ──────────────────────────────────────────────────────────
  static ChatInputBarTheme light(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ChatInputBarTheme(
      barBg: cs.surface,
      borderColor: cs.outline,
      fieldBg: cs.surfaceContainerHighest,
      textStyle: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurface),
      hintColor: cs.onSurfaceVariant,
      sendButtonColor: cs.primary,
    );
  }

  // ── Dark — pilot ────────────────────────────────────────────────────────────
  static ChatInputBarTheme dark(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ChatInputBarTheme(
      barBg: cs.surfaceContainerHighest,
      borderColor: cs.outline,
      fieldBg: cs.surfaceContainer,
      textStyle: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurface),
      hintColor: cs.onSurface.withValues(alpha: 0.3),
      sendButtonColor: cs.primary,
    );
  }
}


class ChatInputBar extends StatelessWidget {
  /// The first name of the contact, used to build the hint "Message Alex...".
  final String contactFirstName;

  /// Controller owned by the parent screen's State.
  final TextEditingController controller;

  /// Called when the user taps send or submits via keyboard.
  final VoidCallback onSend;

  /// Controls all color/style decisions.
  final ChatInputBarTheme inputTheme;

  const ChatInputBar({
    super.key,
    required this.contactFirstName,
    required this.controller,
    required this.onSend,
    required this.inputTheme,
  });

  @override
  Widget build(BuildContext context) {
    final t = inputTheme;
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppTheme.space16,
        AppTheme.space8,
        AppTheme.space16,
        AppTheme.space16,
      ),
      decoration: BoxDecoration(
        color: t.barBg,
        border: Border(top: BorderSide(color: t.borderColor)),
      ),
      child: Row(
        children: [
          // ── Text field pill ──────────────────────────────────────────────────
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
              decoration: BoxDecoration(
                color: t.fieldBg,
                borderRadius: BorderRadius.circular(AppTheme.rounded40),
              ),
              child: TextField(
                controller: controller,
                style: t.textStyle,
                decoration: InputDecoration(
                  hintText: 'Message $contactFirstName...',
                  hintStyle: AppTheme.paragraphSmRegular.copyWith(
                    color: t.hintColor,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: AppTheme.space12,
                  ),
                ),
                onSubmitted: (_) => onSend(),
              ),
            ),
          ),

          const SizedBox(width: AppTheme.space8),

          // ── Send button ──────────────────────────────────────────────────────
          GestureDetector(
            onTap: onSend,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: t.sendButtonColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_upward_rounded,
                color: cs.onSurface,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}