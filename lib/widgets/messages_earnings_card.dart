import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/avatar.dart';

class MessagesEarningsCard extends StatelessWidget {
  final List<Map<String, dynamic>> recentConversations;
  final double todayEarnings;
  final int flightCount;
  final double rating;
  final VoidCallback onSeeAll;
  final VoidCallback? onEarningsTap;

  const MessagesEarningsCard({
    super.key,
    required this.recentConversations,
    required this.todayEarnings,
    required this.flightCount,
    required this.rating,
    required this.onSeeAll,
    this.onEarningsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.kBgCard,
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Messages side ──
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.space12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        Text(
                          'Messages',
                          style: AppTheme.paragraphSmMedium.copyWith(
                            color: Colors.white.withValues(alpha: 0.85),
                          ),
                        ),
                        const SizedBox(width: AppTheme.space6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.kPrimary,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            '${recentConversations.where((c) => (c['unread'] as int) > 0).length}',
                            style: AppTheme.micro.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space8),
                    // Conversation rows
                    ...recentConversations.take(2).map(
                      (convo) => _MiniConvoRow(convo: convo),
                    ),
                    const SizedBox(height: AppTheme.space8),
                    // See all
                    GestureDetector(
                      onTap: onSeeAll,
                      child: Row(
                        children: [
                          Text(
                            'See all',
                            style: AppTheme.paragraphMiniRegular.copyWith(
                              color: Colors.white.withValues(alpha: 0.45),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 12,
                            color: Colors.white.withValues(alpha: 0.45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ── Earnings side ──
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: onEarningsTap,
                child: Container(
                  padding: const EdgeInsets.all(AppTheme.space12),
                  decoration: BoxDecoration(
                    color: AppTheme.kPrimary,
                    borderRadius: BorderRadius.circular(AppTheme.rounded12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: AppTheme.paragraphSmRegular.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      Text(
                        '\$$todayEarnings',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.1,
                          fontFamily: 'Geist',
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '$flightCount flights',
                            style: AppTheme.paragraphMiniRegular.copyWith(
                              color: Colors.white.withValues(alpha: 0.75),
                            ),
                          ),
                          Text(
                            ' • ',
                            style: AppTheme.paragraphMiniRegular.copyWith(
                              color: Colors.white.withValues(alpha: 0.45),
                            ),
                          ),
                          Icon(Icons.star_rounded, size: 13, color: AppTheme.starColor),
                          const SizedBox(width: 2),
                          Text(
                            '$rating',
                            style: AppTheme.paragraphMiniRegular.copyWith(
                              color: Colors.white.withValues(alpha: 0.75),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
        children: [
          Avatar(name: convo['name'], isOnline: convo['isOnline']),
          const SizedBox(width: AppTheme.space8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        convo['name'],
                        style: AppTheme.paragraphMiniMedium.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      convo['time'],
                      style: AppTheme.micro.copyWith(
                        color: Colors.white.withValues(alpha: 0.35),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        convo['lastMessage'],
                        style: AppTheme.micro.copyWith(
                          color: Colors.white.withValues(alpha: 0.4),
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