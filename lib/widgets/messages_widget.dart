import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/avatar.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({super.key});

  static const _conversations = [
    {'name': 'Ahmed Sami', 'lastMessage': 'See you at 9!', 'time': '9:41', 'unread': 1, 'isOnline': true},
    {'name': 'Sara K.', 'lastMessage': 'Can we reschedule?', 'time': '8:20', 'unread': 0, 'isOnline': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppTheme.kBgElevated,
        border: Border.all(
          color: AppTheme.backgroundColor.withValues(alpha: .1)
        ),
        borderRadius: BorderRadius.circular(AppTheme.space32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Header ──
          Row(
            children: [
              Text(
                'Today',
                style: AppTheme.paragraphSmRegular.copyWith(
                  color: AppTheme.backgroundColor.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.kPrimary,
                  borderRadius: BorderRadius.circular(99),
                ),
                /* child: Text(
                  '${recentConversations.where((c) => (c['unread'] as int) > 0).length}',
                  style: AppTheme.micro.copyWith(
                    color: AppTheme.backgroundColor,
                    fontWeight: FontWeight.w700,
                  ), */
                child: Text(
                  '3',
                  style: AppTheme.paragraphMiniRegular.copyWith(
                    color: AppTheme.backgroundColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          // ── Conversation tiles ──
          ..._conversations.map((convo) => _MiniConvoRow(convo: convo)),

          // ── See all ──
          Row(
            children: [
              Text(
                'See all',
                style: AppTheme.paragraphMiniRegular.copyWith(
                  color: AppTheme.backgroundColor.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: AppTheme.space4),
              Icon(
                Icons.chevron_right_rounded,
                color: AppTheme.backgroundColor.withValues(alpha: 0.6),
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniConvoRow extends StatelessWidget {
  final Map<String, dynamic> convo;
  const _MiniConvoRow({required this.convo});

  @override
  Widget build(BuildContext context) {
    final hasUnread = (convo['unread'] as int) > 0;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.space8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Avatar ──
          Avatar(
            name: convo['name'] as String,
            isOnline: convo['isOnline'] as bool,
            size: 32,
          ),
          const SizedBox(width: AppTheme.space8),
          // ── Name/time + message/dot ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name + time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        convo['name'] as String,
                        style: AppTheme.paragraphMiniMedium.copyWith(
                          color: AppTheme.backgroundColor.withValues(alpha: 0.85),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      convo['time'] as String,
                      style: AppTheme.micro.copyWith(
                        color: AppTheme.backgroundColor.withValues(alpha: 0.35),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                // last message + unread dot
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        convo['lastMessage'] as String,
                        style: AppTheme.micro.copyWith(
                          color: AppTheme.backgroundColor.withValues(alpha: 0.4),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (hasUnread)
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: AppTheme.kPrimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}