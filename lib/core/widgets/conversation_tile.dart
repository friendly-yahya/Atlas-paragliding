import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/core/widgets/avatar.dart';



class ConversationTileTheme {
  /// Text color for the contact name when there are unread messages.
  final TextStyle nameUnread;

  /// Text color for the contact name when all messages are read.
  final TextStyle nameRead;

  /// Color of the timestamp when there are unread messages.
  final Color timeUnreadColor;

  /// Color of the timestamp when all messages are read.
  final Color timeReadColor;

  /// Color of the last-message preview when there are unread messages.
  final Color previewUnreadColor;

  /// Color of the last-message preview when all messages are read.
  final Color previewReadColor;

  /// Fill color of the unread badge circle.
  final Color badgeColor;

 final Color badgeTextColor;

  const ConversationTileTheme({
    required this.nameUnread,
    required this.nameRead,
    required this.timeUnreadColor,
    required this.timeReadColor,
    required this.previewUnreadColor,
    required this.previewReadColor,
    required this.badgeColor,
    required this.badgeTextColor,
  });

  // ── Light (client) ──────────────────────────────────────────────────────────
  static ConversationTileTheme light(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ConversationTileTheme(
      nameUnread: AppTheme.paragraphSmMedium.copyWith(color: cs.onSurface),
      nameRead: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurface),
      timeUnreadColor: cs.primary,
      timeReadColor: cs.onSurfaceVariant,
      previewUnreadColor: cs.onSurface,
      previewReadColor: cs.onSurfaceVariant,
      badgeColor: cs.primary,
      badgeTextColor: cs.surface
    );
  }

  // ── Dark (pilot) ────────────────────────────────────────────────────────────
  static ConversationTileTheme dark(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ConversationTileTheme(
      nameUnread: AppTheme.paragraphSmMedium.copyWith(color: cs.onSurface),
      nameRead: AppTheme.paragraphSmRegular.copyWith(color: cs.onSurface),
      timeUnreadColor: cs.primary,
      timeReadColor: cs.onSurface.withValues(alpha: 0.3),
      previewUnreadColor: cs.onSurface.withValues(alpha: 0.85),
      previewReadColor: cs.onSurface.withValues(alpha: 0.35),
      badgeColor: cs.primary,
      badgeTextColor: cs.onSurface,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ConversationTile
// ─────────────────────────────────────────────────────────────────────────────

class ConversationTile extends StatelessWidget {
  /// Display name of the contact.
  final String name;

  /// Last message preview text.
  final String lastMessage;

  /// Formatted timestamp string (e.g. '10:32 AM', 'Yesterday', 'Mon').
  final String time;

  /// Number of unread messages. Pass 0 for none.
  final int unreadCount;

  /// Whether the contact is currently online.
  final bool isOnline;

  /// Optional avatar image URL; falls back to initials when null.
  final String? avatarUrl;

  /// Avatar diameter in logical pixels.
  final double avatarSize;

  /// Called when the tile is tapped.
  final VoidCallback onTap;

  /// Controls all color/style decisions — use [ConversationTileTheme.light()]
  /// for the client side and [ConversationTileTheme.dark()] for the pilot side.
  final ConversationTileTheme tileTheme;

  const ConversationTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.isOnline,
    required this.onTap,
    required this.tileTheme,
    this.avatarUrl,
    this.avatarSize = 48,
  });

  @override
  Widget build(BuildContext context) {
    final hasUnread = unreadCount > 0;
    // ignore: unused_local_variable
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
        child: Row(
          children: [
            // ── Avatar ────────────────────────────────────────────────────────
            Avatar(
              name: name,
              isOnline: isOnline,
              imageUrl: avatarUrl,
              size: avatarSize,
            ),

            const SizedBox(width: AppTheme.space12),

            // ── Text content ──────────────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + timestamp row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: hasUnread
                            ? tileTheme.nameUnread
                            : tileTheme.nameRead,
                      ),
                      Text(
                        time,
                        style: AppTheme.micro.copyWith(
                          color: hasUnread
                              ? tileTheme.timeUnreadColor
                              : tileTheme.timeReadColor,
                          fontWeight: hasUnread
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 2),

                  // Preview + unread badge row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          lastMessage,
                          style: AppTheme.paragraphMiniRegular.copyWith(
                            color: hasUnread
                                ? tileTheme.previewUnreadColor
                                : tileTheme.previewReadColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // ── Unread badge ─────────────────────────────────────
                      if (hasUnread)
                        Container(
                          margin: const EdgeInsets.only(left: AppTheme.space8),
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: tileTheme.badgeColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '$unreadCount',
                              style: AppTheme.micro.copyWith(
                                color: tileTheme.badgeTextColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}