import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/shared/chat_screen.dart';
import 'package:atlas_paragliding/core/widgets/conversation_tile.dart';

class PilotMessages extends StatelessWidget {
  const PilotMessages({super.key});

  final List<Map<String, dynamic>> _conversations = const [
    {
      'name': 'Hicham L.',
      'lastMessage': 'See you at the launch site at 10!',
      'time': '10:32 AM',
      'unread': 2,
      'isOnline': true,
    },
    {
      'name': 'Mouad Pi.',
      'lastMessage': 'Your flight video is ready 🎥',
      'time': 'Yesterday',
      'unread': 0,
      'isOnline': false,
    },
    {
      'name': 'Atlas Support',
      'lastMessage': 'Your booking has been confirmed.',
      'time': 'Mon',
      'unread': 0,
      'isOnline': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.kBgDeep,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppTheme.space16,
                AppTheme.space24,
                AppTheme.space16,
                AppTheme.space16,
              ),
              child: Text(
                'Messages',
                style: AppTheme.heading2.copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: _conversations.isEmpty
                  ? _buildEmpty()
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      itemCount: _conversations.length,
                      separatorBuilder: (_, __) => const Divider(
                        height: 1,
                        color: AppTheme.kBgElevated,
                      ),
                      itemBuilder: (context, index) {
                        final convo = _conversations[index];
                        return ConversationTile(
                          name: convo['name'],
                          lastMessage: convo['lastMessage'],
                          time: convo['time'],
                          unreadCount: convo['unread'],
                          isOnline: convo['isOnline'],
                          tileTheme: ConversationTileTheme.dark(),
                          onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(
                                name: convo['name'],
                                isOnline: convo['isOnline'],
                                chatTheme: ChatScreenTheme.dark(), 
                                initialMessages: const [
                                  {'text': 'Hey! I booked your Essential Flight for Oct 19 🪂', 'isMe': false, 'time': '10:20 AM'},
                                  {'text': 'Perfect! See you at Aguergour launch site.',         'isMe': true,  'time': '10:22 AM'},
                                  {'text': 'What should I wear?',                                 'isMe': false, 'time': '10:25 AM'},
                                  {'text': "Comfortable clothes and closed shoes. I'll handle the rest!", 'isMe': true, 'time': '10:28 AM'},
                                  {'text': 'See you at the launch site at 10!',                   'isMe': true,  'time': '10:32 AM'},
                                ],
                              ),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                final slideTween = Tween(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).chain(CurveTween(curve: Curves.easeOutCubic));

                                final fadeTween = Tween(begin: 0.0, end: 1.0)
                                    .chain(CurveTween(curve: Curves.easeOut));

                                return SlideTransition(
                                  position: animation.drive(slideTween),
                                  child: FadeTransition(
                                    opacity: animation.drive(fadeTween),
                                    child: child,
                                  ),
                                );
                              },
                              transitionDuration: const Duration(milliseconds: 320),
                            ),
                          ),

                          );
 

                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: 48,
            color: Colors.white.withValues(alpha: 0.15),
          ),
          const SizedBox(height: AppTheme.space16),
          Text(
            'No messages yet',
            style: AppTheme.paragraphMedium.copyWith(color: Colors.white.withValues(alpha: 0.4)),
          ),
          const SizedBox(height: AppTheme.space4),
          Text(
            'Your client conversations will appear here',
            style: AppTheme.paragraphSmRegular.copyWith(color: Colors.white.withValues(alpha: 0.25)),
          ),
        ],
      ),
    );
  }
}
