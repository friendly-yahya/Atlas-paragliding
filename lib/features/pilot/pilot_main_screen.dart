import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/pilot/home/pilot_home_screen.dart';
import 'package:atlas_paragliding/features/pilot/messages/pilot_messages.dart';
import 'package:atlas_paragliding/features/pilot/scheduling/pilot_booking.dart';
import 'package:atlas_paragliding/features/pilot/forecast/pilot_offer.dart';
import 'package:atlas_paragliding/features/pilot/profile/pilot_profile.dart';

class PilotMainScreen extends StatefulWidget {
  const PilotMainScreen({super.key, required this.onSwitchToClient});
  final VoidCallback onSwitchToClient;

  @override
  State<PilotMainScreen> createState() => _PilotMainScreenState();
}

class _PilotMainScreenState extends State<PilotMainScreen> {
  int _currentIndex = 0;

  // Track which tabs have been visited so we only build them lazily.
  final Set<int> _visitedTabs = {0};

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    5,
    (_) => GlobalKey<NavigatorState>(),
  );

  static const _items = [
    _NavItem(icon: Icons.home_rounded,           label: 'Home'),
    _NavItem(icon: Icons.chat_bubble_rounded,    label: 'Messages'),
    _NavItem(icon: Icons.flight_rounded,         label: 'Flights'),
    _NavItem(icon: Icons.calendar_month_rounded, label: 'Schedule'),
    _NavItem(icon: Icons.person_rounded,         label: 'Profile'),
  ];

  Future<bool> _onWillPop() async {
    final canPop = _navigatorKeys[_currentIndex].currentState?.canPop() ?? false;
    if (canPop) {
      _navigatorKeys[_currentIndex].currentState?.pop();
      return false;
    }
    return true;
  }

  void _onTabTap(int i) {
    setState(() {
      _visitedTabs.add(i);
      _currentIndex = i;
    });
  }

  Widget _buildTabScreen(int index) {
    // Don't build screens that haven't been visited yet.
    if (!_visitedTabs.contains(index)) return const SizedBox.shrink();

    final screens = [
      const PilotHomeScreen(),
      const PilotMessages(),
      const PilotBooking(),
      const PilotOffer(),
      PilotProfile(onSwitchToClient: widget.onSwitchToClient),
    ];

    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (_) => screens[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop) await _onWillPop();
      },
      child: Scaffold(
        backgroundColor: cs.surface,
        body: Stack(
          fit: StackFit.expand,
          children: List.generate(5, (i) {
            return Offstage(
              offstage: i != _currentIndex,
              child: TickerMode(
                enabled: i == _currentIndex,
                child: _buildTabScreen(i),
              ),
            );
          }),
        ),
        bottomNavigationBar: _PilotBottomNavBar(
          currentIndex: _currentIndex,
          items: _items,
          onTap: (i) {
            HapticFeedback.lightImpact();
            _onTabTap(i);
          },
        ),
      ),
    );
  }
}

// ── Nav bar ────────────────────────────────────────────────
class _PilotBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<_NavItem> items;
  final ValueChanged<int> onTap;

  const _PilotBottomNavBar({
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final cs = Theme.of(context).colorScheme;
    return Container(
      color: cs.surface,
      padding: EdgeInsets.fromLTRB(12, 10, 12, bottomPadding + 14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            items.length,
            (i) => _NavTile(
              item: items[i],
              isActive: i == currentIndex,
              onTap: () => onTap(i),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Tile ───────────────────────────────────────────────────
class _NavTile extends StatelessWidget {
  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavTile({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
        height: 54,
        padding: EdgeInsets.all(isActive ? 4 : 0),
        decoration: BoxDecoration(
          color: isActive ? cs.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: isActive ? cs.surfaceContainer : cs.onSurface,
                end:   isActive ? cs.onSurface        : cs.surfaceContainer,
              ),
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeInOut,
              builder: (context, circleColor, _) {
                return TweenAnimationBuilder<Color?>(
                  tween: ColorTween(
                    begin: isActive ? cs.onSurface.withValues(alpha: 0.55) : cs.primary,
                    end:   isActive ? cs.primary                           : cs.onSurface.withValues(alpha: 0.55),
                  ),
                  duration: const Duration(milliseconds: 280),
                  curve: Curves.easeInOut,
                  builder: (context, iconColor, _) {
                    return Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: circleColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(item.icon, size: 20, color: iconColor),
                    );
                  },
                );
              },
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeInOut,
              child: isActive
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8, right: 10),
                      child: Text(
                        item.label,
                        style: AppTheme.paragraphSmMedium.copyWith(
                          color: cs.onSurface,
                          letterSpacing: 0.1,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data class ─────────────────────────────────────────────
class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}