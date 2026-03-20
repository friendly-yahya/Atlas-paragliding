import 'package:flutter/material.dart';
import 'package:atlas_paragliding/theme/app_theme.dart';
import 'package:atlas_paragliding/widgets/avatar.dart';

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
                        return _ConversationTile(
                          convo: convo,
                          onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  PilotChatScreen(name: convo['name']),
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
            Avatar(name: convo['name'], isOnline: convo['isOnline']),
            const SizedBox(width: AppTheme.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        convo['name'],
                        style: (hasUnread
                                ? AppTheme.paragraphSmMedium
                                : AppTheme.paragraphSmRegular)
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        convo['time'],
                        style: AppTheme.micro.copyWith(
                          color: hasUnread
                              ? AppTheme.kPrimary
                              : Colors.white.withValues(alpha: 0.3),
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
                            color: hasUnread
                                ? Colors.white.withValues(alpha: 0.85)
                                : Colors.white.withValues(alpha: 0.35),
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
                            color: AppTheme.kPrimary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${convo['unread']}',
                              style: AppTheme.micro.copyWith(
                                color: Colors.white,
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

// ── Chat screen ──────────────────────────────────────────────────────────────

class PilotChatScreen extends StatefulWidget {
  final String name;
  const PilotChatScreen({super.key, required this.name});

  @override
  State<PilotChatScreen> createState() => _PilotChatScreenState();
}

class _PilotChatScreenState extends State<PilotChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hey! I booked your Essential Flight for Oct 19 🪂', 'isMe': false, 'time': '10:20 AM'},
    {'text': 'Perfect! See you at Aguergour launch site.', 'isMe': true, 'time': '10:22 AM'},
    {'text': 'What should I wear?', 'isMe': false, 'time': '10:25 AM'},
    {'text': 'Comfortable clothes and closed shoes. I\'ll handle the rest!', 'isMe': true, 'time': '10:28 AM'},
    {'text': 'See you at the launch site at 10!', 'isMe': true, 'time': '10:32 AM'},
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
      backgroundColor: AppTheme.kBgDeep,
      appBar: AppBar(
        backgroundColor: AppTheme.kBgCard,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 20, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Avatar(name: widget.name, isOnline: true),
            const SizedBox(width: AppTheme.space8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: AppTheme.paragraphSmMedium.copyWith(color: Colors.white),
                ),
                Text(
                  'Online',
                  style: AppTheme.micro.copyWith(color: AppTheme.successColor),
                ),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
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
          Container(
            padding: const EdgeInsets.fromLTRB(
              AppTheme.space16,
              AppTheme.space8,
              AppTheme.space16,
              AppTheme.space16,
            ),
            decoration: BoxDecoration(
              color: AppTheme.kBgCard,
              border: Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                    decoration: BoxDecoration(
                      color: AppTheme.kBgElevated,
                      borderRadius: BorderRadius.circular(AppTheme.rounded40),
                    ),
                    child: TextField(
                      controller: _controller,
                      style: AppTheme.paragraphSmRegular.copyWith(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Message ${widget.name.split(' ')[0]}...',
                        hintStyle: AppTheme.paragraphSmRegular.copyWith(
                          color: Colors.white.withValues(alpha: 0.3),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
                      ),
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
                      color: AppTheme.kPrimary,
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
              color: isMe ? AppTheme.kPrimary : AppTheme.kBgCard,
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
                color: isMe ? Colors.white : Colors.white.withValues(alpha: 0.85),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            time,
            style: AppTheme.micro.copyWith(color: Colors.white.withValues(alpha: 0.3)),
          ),
        ],
      ),
    );
  }
}