import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/core/widgets/avatar.dart';

class ChatHeaderTheme {
  /// Background of the AppBar itself.
  final Color appBarBg;

  /// Color of the leading back-arrow icon.
  final Color backIconColor;

  /// Style of the contact name text.
  final TextStyle nameStyle;

  /// Color of the "Offline" status label
  /// (the "Online" label always uses [AppTheme.successColor]).
  final Color offlineStatusColor;

  /// Color of the 1 px bottom divider.
  final Color dividerColor;

  const ChatHeaderTheme({
    required this.appBarBg,
    required this.backIconColor,
    required this.nameStyle,
    required this.offlineStatusColor,
    required this.dividerColor,
  });

  // ── Light — client ──────────────────────────────────────────────────────────
  static ChatHeaderTheme light() => ChatHeaderTheme(
        appBarBg: cs.surface,
        backIconColor: cs.primary,
        nameStyle: AppTheme.paragraphSmMedium,
        offlineStatusColor: cs.onSurfaceVariant,
        dividerColor: cs.outline,
      );

  // ── Dark — pilot ────────────────────────────────────────────────────────────
  static ChatHeaderTheme dark() => ChatHeaderTheme(
        appBarBg: cs.surfaceContainerHighest,
        backIconColor: Colors.white,
        nameStyle: AppTheme.paragraphSmMedium.copyWith(color: Colors.white),
        offlineStatusColor: Colors.white.withValues(alpha: 0.3),
        dividerColor: Colors.white.withValues(alpha: 0.08),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// ChatHeader
//
// Drop-in AppBar for ChatScreen. Build it inside Scaffold.appBar by wrapping
// with a standard AppBar and passing [ChatHeader] as the title, or use the
// [ChatHeader.asAppBar] convenience factory to get a pre-wired AppBar directly.
// ─────────────────────────────────────────────────────────────────────────────

class ChatHeader extends StatelessWidget {
  /// Contact display name shown next to the avatar.
  final String name;

  /// Whether the contact is currently online.
  final bool isOnline;

  /// Optional avatar image URL; falls back to initials when null.
  final String? avatarUrl;

  /// Controls all color/style decisions.
  final ChatHeaderTheme headerTheme;

  const ChatHeader({
    super.key,
    required this.name,
    required this.isOnline,
    required this.headerTheme,
    this.avatarUrl,
  });

  // ── Convenience factory — returns a fully wired AppBar ─────────────────────
  static AppBar asAppBar({
    required String name,
    required bool isOnline,
    required ChatHeaderTheme headerTheme,
    required VoidCallback onBack,
    String? avatarUrl,
  }) {
    return AppBar(
      backgroundColor: headerTheme.appBarBg,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          size: 20,
          color: headerTheme.backIconColor,
        ),
        onPressed: onBack,
      ),
      titleSpacing: 0,
      title: ChatHeader(
        name: name,
        isOnline: isOnline,
        headerTheme: headerTheme,
        avatarUrl: avatarUrl,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: headerTheme.dividerColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = headerTheme;

    return Row(
      children: [
        // ── Avatar with online indicator ───────────────────────────────────────
        Avatar(
          name: name,
          isOnline: isOnline,
          imageUrl: avatarUrl,
          size: 34,
        ),

        const SizedBox(width: AppTheme.space8),

        // ── Name + status ──────────────────────────────────────────────────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: t.nameStyle),
            Text(
              isOnline ? 'Online' : 'Offline',
              style: AppTheme.micro.copyWith(
                color: isOnline ? AppTheme.successColor : t.offlineStatusColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}