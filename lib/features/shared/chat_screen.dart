import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/shared/chat_header.dart';
import 'package:atlas_paragliding/features/shared/message_bubble.dart';
import 'package:atlas_paragliding/features/shared/chat_input_bar.dart';

class ChatScreenTheme {
  final Color scaffoldBg;
  final ChatHeaderTheme header;
  final MessageBubbleTheme bubble;
  final ChatInputBarTheme input;

  const ChatScreenTheme({
    required this.scaffoldBg,
    required this.header,
    required this.bubble,
    required this.input,
  });

  // ── Light (client) ──────────────────────────────────────────────────────────
  static ChatScreenTheme light(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ChatScreenTheme(
      scaffoldBg: cs.surface,
      header: ChatHeaderTheme.light(cs),
      bubble: MessageBubbleTheme.light(cs),
      // ✅ Pass the BuildContext directly – ChatInputBarTheme expects it
      input: ChatInputBarTheme.light(context),
    );
  }

  // ── Dark (pilot) ────────────────────────────────────────────────────────────
  static ChatScreenTheme dark(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ChatScreenTheme(
      scaffoldBg: cs.surface,
      header: ChatHeaderTheme.dark(cs),
      bubble: MessageBubbleTheme.dark(cs),
      // ✅ Pass the BuildContext directly – ChatInputBarTheme expects it
      input: ChatInputBarTheme.dark(context),
    );
  }
}


class ChatScreen extends StatefulWidget {
  /// Display name of the contact.
  final String name;

  /// Whether the contact is currently online.
  final bool isOnline;

  /// Optional avatar image URL; falls back to initials when null.
  final String? avatarUrl;

  /// Seed messages shown when the screen opens.
  final List<Map<String, dynamic>> initialMessages;

  /// Controls all color/style decisions.
  /// Use [ChatScreenTheme.light(cs)] for clients, [ChatScreenTheme.dark(cs)] for pilots.
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

    return Scaffold(
      backgroundColor: t.scaffoldBg,

      // ── AppBar — delegated to ChatHeader.asAppBar ───────────────────────────
      appBar: ChatHeader.asAppBar(
        name: widget.name,
        isOnline: widget.isOnline,
        avatarUrl: widget.avatarUrl,
        headerTheme: t.header,
        onBack: () => Navigator.pop(context),
      ),

      body: Column(
        children: [
          // ── Message list ──────────────────────────────────────────────────────
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppTheme.space16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return MessageBubble(
                  text: msg['text'] as String,
                  isMe: msg['isMe'] as bool,
                  time: msg['time'] as String,
                  bubbleTheme: t.bubble,
                );
              },
            ),
          ),

          // ── Input bar — delegated to ChatInputBar ─────────────────────────────
          ChatInputBar(
            contactFirstName: widget.name.split(' ').first,
            controller: _controller,
            onSend: _sendMessage,
            inputTheme: t.input,
          ),
        ],
      ),
    );
  }
}