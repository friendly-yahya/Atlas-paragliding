import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/pilot/profile/manage_offers/offer_details_screen.dart';

// ── Data model ───────────────────────────────────────────────
class SelectedOffer {
  const SelectedOffer({
    required this.name,
    required this.flightTime,
    required this.totalDuration,
    required this.price,
    required this.extras,
    this.status = OfferStatus.active,
  });

  final String name;
  final String flightTime;
  final String totalDuration;
  final String price;
  final List<String> extras;
  final OfferStatus status;

  SelectedOffer copyWith({
    String? name,
    String? flightTime,
    String? totalDuration,
    String? price,
    List<String>? extras,
    OfferStatus? status,
  }) =>
      SelectedOffer(
        name: name ?? this.name,
        flightTime: flightTime ?? this.flightTime,
        totalDuration: totalDuration ?? this.totalDuration,
        price: price ?? this.price,
        extras: extras ?? this.extras,
        status: status ?? this.status,
      );
}

enum OfferStatus { active, draft, inactive }

const _kTabs = [OfferStatus.active, OfferStatus.draft, OfferStatus.inactive];
const _kTabLabels = ['Active', 'Drafts', 'Inactive'];

// ────────────────────────────────────────────────────────────
class ManageOffersScreen extends StatefulWidget {
  const ManageOffersScreen({super.key, required this.offers});
  final List<SelectedOffer> offers;

  @override
  State<ManageOffersScreen> createState() => _ManageOffersScreenState();
}

class _ManageOffersScreenState extends State<ManageOffersScreen> {
  late List<SelectedOffer> _offers;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _offers = List.from(widget.offers);
  }

  List<SelectedOffer> get _filtered =>
      _offers.where((o) => o.status == _kTabs[_tabIndex]).toList();

  Future<void> _addOffer() async {
    final result = await Navigator.push<SelectedOffer>(
      context,
      MaterialPageRoute(builder: (_) => const OfferDetailsScreen()),
    );
    if (result != null) setState(() => _offers.add(result));
  }

  // Opens OfferDetailsScreen pre-filled with the existing offer
  Future<void> _editOffer(SelectedOffer offer) async {
    final idx = _offers.indexOf(offer);
    if (idx == -1) return;
    final result = await Navigator.push<SelectedOffer>(
      context,
      MaterialPageRoute(
        builder: (_) => OfferDetailsScreen(existing: offer),
      ),
    );
    if (result != null) {
      // Preserve current status unless the pilot explicitly changed it
      setState(() => _offers[idx] = result.copyWith(status: offer.status));
    }
  }

  void _deleteOffer(SelectedOffer o) =>
      setState(() => _offers.remove(o));

  void _toggleStatus(SelectedOffer o, OfferStatus newStatus) {
    final idx = _offers.indexOf(o);
    if (idx == -1) return;
    setState(() => _offers[idx] = o.copyWith(status: newStatus));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final listed = _filtered;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Header ────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context, _offers),
                    child: Container(
                      width: 40, height: 40,
                      decoration: BoxDecoration(
                          color: cs.surfaceContainerHighest, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: cs.onSurface, size: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text('Manage Offers',
                      style: AppTheme.heading3
                          .copyWith(color: cs.onSurface)),
                  const Spacer(),
                  GestureDetector(
                    onTap: _addOffer,
                    child: Container(
                      width: 40, height: 40,
                      decoration: BoxDecoration(
                          color: cs.primary, shape: BoxShape.circle),
                      child: const Icon(Icons.add_rounded,
                          color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ── 3-tab pill navbar ─────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 44,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  children: List.generate(_kTabLabels.length, (i) {
                    final selected = _tabIndex == i;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _tabIndex = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: selected
                                ? cs.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _kTabLabels[i],
                            style: AppTheme.paragraphSmRegular.copyWith(
                              color: selected
                                  ? Colors.white
                                  : cs.onSurfaceVariant,
                              fontWeight: selected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ── Offer list ────────────────────────────────
            Expanded(
              child: listed.isEmpty
                  ? _EmptyState(tab: _kTabLabels[_tabIndex])
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: listed.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, i) => _OfferCard(
                        offer: listed[i],
                        onEdit: () => _editOffer(listed[i]),
                        onDelete: () => _deleteOffer(listed[i]),
                        onToggleStatus: (s) =>
                            _toggleStatus(listed[i], s),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Offer card — no icons anywhere ──────────────────────────
class _OfferCard extends StatelessWidget {
  const _OfferCard({
    required this.offer,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleStatus,
  });

  final SelectedOffer offer;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final void Function(OfferStatus) onToggleStatus;

  Color _statusColor(OfferStatus s, ColorScheme cs) {
    switch (s) {
      case OfferStatus.active:   return cs.primary;
      case OfferStatus.draft:    return Colors.orangeAccent;
      case OfferStatus.inactive: return cs.onSurfaceVariant;
    }
  }

  String _statusLabel(OfferStatus s) {
    switch (s) {
      case OfferStatus.active:   return 'Active';
      case OfferStatus.draft:    return 'Draft';
      case OfferStatus.inactive: return 'Inactive';
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppTheme.rounded12),
        border: Border.all(
          color: offer.status == OfferStatus.active
              ? cs.primary.withValues(alpha: 0.35)
              : Colors.transparent,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Title + status badge
          Row(
            children: [
              Expanded(
                child: Text(offer.name,
                    style: AppTheme.paragraphMedium.copyWith(
                        color: cs.onSurface,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      _statusColor(offer.status, cs).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(_statusLabel(offer.status),
                    style: AppTheme.paragraphMiniMedium
                        .copyWith(color: _statusColor(offer.status, cs))),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Details — plain text, no icons
          Wrap(
            spacing: 16,
            runSpacing: 4,
            children: [
              _InfoText(label: 'Flight', value: offer.flightTime),
              _InfoText(label: 'Total', value: offer.totalDuration),
              _InfoText(label: 'Price', value: offer.price),
            ],
          ),

          // Extras
          if (offer.extras.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: offer.extras
                  .map((e) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: cs.surfaceContainer,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(e,
                            style: AppTheme.paragraphMiniRegular.copyWith(
                                color: cs.onSurfaceVariant)),
                      ))
                  .toList(),
            ),
          ],

          const SizedBox(height: 12),
          const Divider(height: 1, color: Colors.white10),
          const SizedBox(height: 10),

          // Action row
          Row(
            children: [
              if (offer.status != OfferStatus.active)
                _ActionBtn(
                  label: 'Set Active',
                  color: cs.primary,
                  onTap: () => onToggleStatus(OfferStatus.active),
                ),
              if (offer.status == OfferStatus.active)
                _ActionBtn(
                  label: 'Deactivate',
                  color: cs.onSurfaceVariant,
                  onTap: () => onToggleStatus(OfferStatus.inactive),
                ),
              const SizedBox(width: 8),
              if (offer.status != OfferStatus.draft)
                _ActionBtn(
                  label: 'Move to Draft',
                  color: cs.onSurfaceVariant,
                  onTap: () => onToggleStatus(OfferStatus.draft),
                ),
              const Spacer(),
              _ActionBtn(
                label: 'Edit',
                color: cs.primary,
                onTap: onEdit,
              ),
              const SizedBox(width: 8),
              _ActionBtn(
                label: 'Delete',
                color: Colors.redAccent,
                onTap: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Plain label + value, no icons ────────────────────────────
class _InfoText extends StatelessWidget {
  const _InfoText({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return RichText(
      text: TextSpan(
        style: AppTheme.paragraphMiniRegular
            .copyWith(color: cs.onSurfaceVariant),
        children: [
          TextSpan(text: '$label  '),
          TextSpan(
            text: value,
            style: AppTheme.paragraphMiniMedium
                .copyWith(color: cs.onSurface),
          ),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  const _ActionBtn(
      {required this.label, required this.color, required this.onTap});
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(label,
            style: AppTheme.paragraphMiniMedium.copyWith(color: color)),
      ),
    );
  }
}

// ── Empty state — 🪂 is the only emoji/icon used ─────────────
class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.tab});
  final String tab;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🪂', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 16),
          Text('No $tab offers',
              style:
                  AppTheme.heading4.copyWith(color: cs.onSurface)),
          const SizedBox(height: 8),
          Text(
            tab == 'Active'
                ? 'Activate a draft or tap + to create one.'
                : tab == 'Drafts'
                    ? 'Tap + to start building a new offer.'
                    : 'Deactivated offers will appear here.',
            style: AppTheme.paragraphSmRegular
                .copyWith(color: cs.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}