import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
//import 'package:atlas_paragliding/core/widgets/avatar.dart';
import 'package:atlas_paragliding/core/widgets/conversation_tile.dart';
import 'package:atlas_paragliding/features/shared/chat_screen.dart';
class MessagingScreen extends StatelessWidget {
  const MessagingScreen({super.key});

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
      backgroundColor: AppTheme.backgroundColor,
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
              child: Text('Messages', style: AppTheme.heading2),
            ),
            Expanded(
              child: _conversations.isEmpty
                  ? _buildEmpty()
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      itemCount: _conversations.length,
                      separatorBuilder: (_, __) => const Divider(height: 1, color: AppTheme.strokeColor),
                      itemBuilder: (context, index) {
                        final convo = _conversations[index];
                        return ConversationTile(
                          name: convo['name'],
                          lastMessage: convo['lastMessage'],
                          time: convo['time'],
                          unreadCount: convo['unread'],
                          isOnline: convo['isOnline'],
                          tileTheme: ConversationTileTheme.light(),  
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(
                                name: convo['name'],
                                isOnline: convo['isOnline'],
                                chatTheme: ChatScreenTheme.light(),
                                initialMessages: const [
                                  {'text': 'Hey! I booked your Essential Flight for Oct 19 🪂',                           'isMe': true,  'time': '10:20 AM'},
                                  {'text': 'Perfect! See you at Aguergour launch site.',                                  'isMe': false, 'time': '10:22 AM'},
                                  {'text': 'What should I wear?',                                                           'isMe': true,  'time': '10:25 AM'},
                                  {'text': "Comfortable clothes and closed shoes. I'll handle the                           rest!", 'isMe': false, 'time': '10:28 AM'},
                                  {'text': 'See you at the launch site at 10!',                                             'isMe': false, 'time': '10:32 AM'},
                                ],
                              ),
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
          Icon(Icons.chat_bubble_outline_rounded, size: 48, color: AppTheme.textSecondary.withValues(alpha: 0.4)),
          const SizedBox(height: AppTheme.space16),
          Text('No messages yet', style: AppTheme.paragraphMedium.copyWith(color: AppTheme.textSecondary)),
          const SizedBox(height: AppTheme.space4),
          Text('Book a flight to start chatting', style: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary)),
        ],
      ),
    );
  }
}
