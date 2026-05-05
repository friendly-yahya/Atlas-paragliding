import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/core/widgets/avatar.dart';

class ChatScreenTheme {
  // Scaffold / AppBar
  final Color scaffoldBg;
  final Color appBarBg;
  final Color appBarDividerColor;
  final Color backIconColor;
  final TextStyle nameStyle;

  // Input bar
  final Color inputBarBg;
  final Color inputBarBorderColor;
  final Color inputFieldBg;
  final TextStyle inputTextStyle;
  final Color inputHintColor;
  final Color sendButtonColor;

  // Bubbles — sent ("me")
  final Color meBubbleBg;
  final Color meTextColor;

  // Bubbles — received ("other")
  final Color otherBubbleBg;
  final Color otherTextColor;

  // Timestamp
  final Color timestampColor;

  const ChatScreenTheme({
    required this.scaffoldBg,
    required this.appBarBg,
    required this.appBarDividerColor,
    required this.backIconColor,
    required this.nameStyle,
    required this.inputBarBg,
    required this.inputBarBorderColor,
    required this.inputFieldBg,
    required this.inputTextStyle,
    required this.inputHintColor,
    required this.sendButtonColor,
    required this.meBubbleBg,
    required this.meTextColor,
    required this.otherBubbleBg,
    required this.otherTextColor,
    required this.timestampColor,
  });

  // ── Light — client ──────────────────────────────────────────────────────────
  static ChatScreenTheme light() => ChatScreenTheme(
        scaffoldBg: AppTheme.backgroundColor,
        appBarBg: AppTheme.backgroundColor,
        appBarDividerColor: AppTheme.strokeColor,
        backIconColor: AppTheme.textPrimary,
        nameStyle: AppTheme.paragraphSmMedium,
        inputBarBg: AppTheme.backgroundColor,
        inputBarBorderColor: AppTheme.strokeColor,
        inputFieldBg: AppTheme.searchBackgroundColor,
        inputTextStyle: AppTheme.paragraphSmRegular,
        inputHintColor: AppTheme.textSecondary,
        sendButtonColor: AppTheme.primaryColor,
        meBubbleBg: AppTheme.primaryColor,
        meTextColor: Colors.white,
        otherBubbleBg: AppTheme.searchBackgroundColor,
        otherTextColor: AppTheme.textPrimary,
        timestampColor: AppTheme.textSecondary,
      );

  // ── Dark — pilot ────────────────────────────────────────────────────────────
  static ChatScreenTheme dark() => ChatScreenTheme(
        scaffoldBg: AppTheme.kBgDeep,
        appBarBg: AppTheme.kBgCard,
        appBarDividerColor: Colors.white.withValues(alpha: 0.08),
        backIconColor: Colors.white,
        nameStyle: AppTheme.paragraphSmMedium.copyWith(color: Colors.white),
        inputBarBg: AppTheme.kBgCard,
        inputBarBorderColor: Colors.white.withValues(alpha: 0.08),
        inputFieldBg: AppTheme.kBgElevated,
        inputTextStyle: AppTheme.paragraphSmRegular.copyWith(color: Colors.white),
        inputHintColor: Colors.white.withValues(alpha: 0.3),
        sendButtonColor: AppTheme.kPrimary,
        meBubbleBg: AppTheme.kPrimary,
        meTextColor: Colors.white,
        otherBubbleBg: AppTheme.kBgCard,
        otherTextColor: Colors.white.withValues(alpha: 0.85),
        timestampColor: Colors.white.withValues(alpha: 0.3),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// ChatScreen  (shared)
// ─────────────────────────────────────────────────────────────────────────────

class ChatScreen extends StatefulWidget {
  /// Display name of the contact.
  final String name;

  /// Whether the contact is currently online (drives the green dot on Avatar).
  final bool isOnline;

  /// Optional avatar image URL; falls back to initials when null.
  final String? avatarUrl;

  /// Seed messages shown when the screen opens. Defaults to empty.
  final List<Map<String, dynamic>> initialMessages;

  /// Controls all color/style decisions.
  /// Use [ChatScreenTheme.light()] for clients and [ChatScreenTheme.dark()] for pilots.
  final ChatScreenTheme chatTheme;

  const ChatScreen({
    super.key,
    required this.name,
    required this.chatTheme,
    this.isOnline = true,
    this.avatarUrl,
    this.initialMessages = const [],
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final List<Map<String, dynamic>> _messages;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _messages = List<Map<String, dynamic>>.from(widget.initialMessages);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'text': text, 'isMe': true, 'time': 'Now'});
      _controller.clear();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.chatTheme;
    final firstName = widget.name.split(' ').first;

    return Scaffold(
      backgroundColor: t.scaffoldBg,
      appBar: AppBar(
        backgroundColor: t.appBarBg,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, size: 20, color: t.backIconColor),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            // ── Avatar ────────────────────────────────────────────────────────
            Avatar(
              name: widget.name,
              isOnline: widget.isOnline,
              imageUrl: widget.avatarUrl,
              size: 34,
            ),
            const SizedBox(width: AppTheme.space8),

            // ── Name + status ─────────────────────────────────────────────────
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: t.nameStyle),
                Text(
                  widget.isOnline ? 'Online' : 'Offline',
                  style: AppTheme.micro.copyWith(
                    color: widget.isOnline
                        ? AppTheme.successColor
                        : t.timestampColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: t.appBarDividerColor),
        ),
      ),
      body: Column(
        children: [
          // ── Message list ────────────────────────────────────────────────────
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppTheme.space16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _MessageBubble(
                  text: msg['text'] as String,
                  isMe: msg['isMe'] as bool,
                  time: msg['time'] as String,
                  chatTheme: t,
                );
              },
            ),
          ),

          // ── Input bar ───────────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(
              AppTheme.space16,
              AppTheme.space8,
              AppTheme.space16,
              AppTheme.space16,
            ),
            decoration: BoxDecoration(
              color: t.inputBarBg,
              border: Border(top: BorderSide(color: t.inputBarBorderColor)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                    decoration: BoxDecoration(
                      color: t.inputFieldBg,
                      borderRadius: BorderRadius.circular(AppTheme.rounded40),
                    ),
                    child: TextField(
                      controller: _controller,
                      style: t.inputTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Message $firstName...',
                        hintStyle: AppTheme.paragraphSmRegular.copyWith(
                          color: t.inputHintColor,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: AppTheme.space12,
                        ),
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
                    decoration: BoxDecoration(
                      color: t.sendButtonColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
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

// ─────────────────────────────────────────────────────────────────────────────
// _MessageBubble  (private — only used inside this file)
// ─────────────────────────────────────────────────────────────────────────────

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;
  final ChatScreenTheme chatTheme;

  const _MessageBubble({
    required this.text,
    required this.isMe,
    required this.time,
    required this.chatTheme,
  });

  @override
  Widget build(BuildContext context) {
    final t = chatTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.space8),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
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