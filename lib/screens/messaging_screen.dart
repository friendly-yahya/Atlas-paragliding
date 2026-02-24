import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';

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
                        return _ConversationTile(
                          convo: convo,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(name: convo['name']),
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

class _ConversationTile extends StatelessWidget {
  final Map<String, dynamic> convo;
  final VoidCallback onTap;

  const _ConversationTile({required this.convo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final hasUnread = (convo['unread'] as int) > 0;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      (convo['name'] as String)[0],
                      style: AppTheme.paragraphMedium.copyWith(color: AppTheme.primaryColor),
                    ),
                  ),
                ),
                if (convo['isOnline'] as bool)
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      width: 11,
                      height: 11,
                      decoration: BoxDecoration(
                        color: AppTheme.successColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.backgroundColor, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: AppTheme.space12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        convo['name'],
                        style: hasUnread
                            ? AppTheme.paragraphSmMedium
                            : AppTheme.paragraphSmRegular,
                      ),
                      Text(
                        convo['time'],
                        style: AppTheme.micro.copyWith(
                          color: hasUnread ? AppTheme.primaryColor : AppTheme.textSecondary,
                          fontWeight: hasUnread ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          convo['lastMessage'],
                          style: AppTheme.paragraphMiniRegular.copyWith(
                            color: hasUnread ? AppTheme.textPrimary : AppTheme.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (hasUnread)
                        Container(
                          margin: const EdgeInsets.only(left: AppTheme.space8),
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: AppTheme.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${convo['unread']}',
                              style: AppTheme.micro.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
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

// ── Chat screen ──────────────────────────────────────────────────────────────

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hey! I booked your Essential Flight for Oct 19 🪂', 'isMe': true, 'time': '10:20 AM'},
    {'text': 'Perfect! See you at Aguergour launch site.', 'isMe': false, 'time': '10:22 AM'},
    {'text': 'What should I wear?', 'isMe': true, 'time': '10:25 AM'},
    {'text': 'Comfortable clothes and closed shoes. I\'ll handle the rest!', 'isMe': false, 'time': '10:28 AM'},
    {'text': 'See you at the launch site at 10!', 'isMe': false, 'time': '10:32 AM'},
  ];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add({'text': _controller.text.trim(), 'isMe': true, 'time': 'Now'});
      _controller.clear();
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20, color: AppTheme.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(widget.name[0], style: AppTheme.paragraphSmMedium.copyWith(color: AppTheme.primaryColor)),
              ),
            ),
            const SizedBox(width: AppTheme.space8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: AppTheme.paragraphSmMedium),
                Text('Online', style: AppTheme.micro.copyWith(color: AppTheme.successColor)),
              ],
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppTheme.strokeColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppTheme.space16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _MessageBubble(
                  text: msg['text'],
                  isMe: msg['isMe'],
                  time: msg['time'],
                );
              },
            ),
          ),
          // Input bar
          Container(
            padding: const EdgeInsets.fromLTRB(
              AppTheme.space16,
              AppTheme.space8,
              AppTheme.space16,
              AppTheme.space16,
            ),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppTheme.strokeColor)),
              color: AppTheme.backgroundColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                    decoration: BoxDecoration(
                      color: AppTheme.searchBackgroundColor,
                      borderRadius: BorderRadius.circular(AppTheme.rounded40),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Message ${widget.name.split(' ')[0]}...',
                        hintStyle: AppTheme.paragraphSmRegular.copyWith(color: AppTheme.textSecondary),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
                      ),
                      style: AppTheme.paragraphSmRegular,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.space8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_upward_rounded, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  const _MessageBubble({required this.text, required this.isMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.space8),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.space16,
              vertical: AppTheme.space12,
            ),
            decoration: BoxDecoration(
              color: isMe ? AppTheme.primaryColor : AppTheme.searchBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(AppTheme.rounded12),
                topRight: const Radius.circular(AppTheme.rounded12),
                bottomLeft: Radius.circular(isMe ? AppTheme.rounded12 : AppTheme.rounded4),
                bottomRight: Radius.circular(isMe ? AppTheme.rounded4 : AppTheme.rounded12),
              ),
            ),
            child: Text(
              text,
              style: AppTheme.paragraphSmRegular.copyWith(
                color: isMe ? Colors.white : AppTheme.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            time,
            style: AppTheme.micro.copyWith(color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }
}