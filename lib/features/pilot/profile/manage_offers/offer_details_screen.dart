import 'package:flutter/material.dart';
import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:atlas_paragliding/features/pilot/profile/manage_offers/manage_offers_screen.dart';

// ── Offer types ──────────────────────────────────────────────
const List<String> kOfferTypes = [
  'Tandem Flight',
  'Discovery Flight',
  'Training Course',
  'Cross-Country Tour',
  'Aerial Photography',
  'Private Coaching',
  'Group Package',
];

// ── Flight time options ──────────────────────────────────────
const List<String> kFlightTimes = [
  '5 min', '10 min', '15 min', '20 min', '25 min+',
];

// ── Total duration options ───────────────────────────────────
const List<String> kTotalDurations = [
  '30 min', '1 hour', '2 hours', '3 hours', 'Half day', 'Full day',
];

// ── Preset extras ────────────────────────────────────────────
const List<String> kPresetExtras = [
  'Mint Tea', 'Transport', 'Snacks', 'Photos & Video',
  'Insurance', 'Equipment', 'Lunch', 'Certificate',
];

// ────────────────────────────────────────────────────────────
class OfferDetailsScreen extends StatefulWidget {
  /// Pass [existing] to open in edit mode with pre-filled values.
  const OfferDetailsScreen({super.key, this.existing});
  final SelectedOffer? existing;

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  // When editing we skip step 0 (type is locked) and start at step 1
  late int _step;
  // ignore: unused_field
  final bool _isEditing = false;

  String? _offerName;
  String? _flightTime;
  String? _totalDuration;
  List<String> _extras = [];
  final _customExtraCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  OfferStatus _saveAs = OfferStatus.active;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      // Pre-fill all fields
      _offerName = e.name;
      _flightTime = e.flightTime;
      _totalDuration = e.totalDuration;
      _extras = List.from(e.extras);
      _priceCtrl.text = e.price;
      _saveAs = e.status;
      _step = 1; // skip type selection when editing
    } else {
      _step = 0;
    }
  }

  @override
  void dispose() {
    _customExtraCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  bool get _editing => widget.existing != null;

  // Steps: 0=type (new only)  1=timing  2=extras  3=price
  static const _titles = ['Offer Type', 'Duration', 'Includes', 'Price & Save'];

  // Total steps shown in progress bar
  int get _totalSteps => _editing ? 3 : 4;
  // Progress bar index (0-based, offset by 1 when editing skips step 0)
  int get _progressIndex => _editing ? _step - 1 : _step;

  void _next() => setState(() => _step++);
  void _back() {
    // When editing, step 1 is the first step — go back to ManageOffers
    if (_step == 0 || (_editing && _step == 1)) {
      Navigator.pop(context);
    } else {
      setState(() => _step--);
    }
  }

  void _toggleExtra(String label) {
    setState(() {
      _extras.contains(label)
          ? _extras.remove(label)
          : _extras.add(label);
    });
  }

  void _addCustomExtra() {
    final val = _customExtraCtrl.text.trim();
    if (val.isNotEmpty && !_extras.contains(val)) {
      setState(() {
        _extras.add(val);
        _customExtraCtrl.clear();
      });
    }
  }

  void _confirm() {
    Navigator.pop(
      context,
      SelectedOffer(
        name: _offerName!,
        flightTime: _flightTime!,
        totalDuration: _totalDuration!,
        price: _priceCtrl.text.trim(),
        extras: List.from(_extras),
        status: _saveAs,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.kBgDeep,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Header ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _back,
                    child: Container(
                      width: 40, height: 40,
                      decoration: BoxDecoration(
                          color: AppTheme.kBgCard, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppTheme.kTextPrimary, size: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    _editing
                        ? 'Edit  ${_offerName ?? ''}'
                        : _titles[_step],
                    style: AppTheme.heading3
                        .copyWith(color: AppTheme.kTextPrimary),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Step progress bar ────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(_totalSteps, (i) {
                  final done = i < _progressIndex;
                  final active = i == _progressIndex;
                  return Expanded(
                    child: Container(
                      height: 3,
                      margin: EdgeInsets.only(
                          right: i < _totalSteps - 1 ? 6 : 0),
                      decoration: BoxDecoration(
                        color: done || active
                            ? AppTheme.kPrimary
                            : AppTheme.kBgCard,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 24),

            // ── Step content ─────────────────────────────
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                child: KeyedSubtree(
                  key: ValueKey(_step),
                  child: _buildStep(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep() {
    switch (_step) {
      case 0:
        return _StepType(
          selected: _offerName,
          onPick: (name) {
            setState(() => _offerName = name);
            _next();
          },
        );
      case 1:
        return _StepTiming(
          flightTime: _flightTime,
          totalDuration: _totalDuration,
          onFlightTime: (v) => setState(() => _flightTime = v),
          onTotalDuration: (v) => setState(() => _totalDuration = v),
          onNext: (_flightTime != null && _totalDuration != null)
              ? _next
              : null,
        );
      case 2:
        return _StepExtras(
          selected: _extras,
          customCtrl: _customExtraCtrl,
          onToggle: _toggleExtra,
          onAddCustom: _addCustomExtra,
          onNext: _next,
        );
      case 3:
        return _StepPrice(
          priceCtrl: _priceCtrl,
          saveAs: _saveAs,
          onSaveAs: (v) => setState(() => _saveAs = v),
          onConfirm:
              _priceCtrl.text.trim().isNotEmpty ? _confirm : null,
          onChanged: () => setState(() {}),
          isEditing: _editing,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

// ════════════════════════════════════════════════════════════
// STEP 0 — Offer type (new only, no icons/emojis)
// ════════════════════════════════════════════════════════════
class _StepType extends StatelessWidget {
  const _StepType({required this.selected, required this.onPick});
  final String? selected;
  final void Function(String name) onPick;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: kOfferTypes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final name = kOfferTypes[i];
        final isSelected = selected == name;
        return GestureDetector(
          onTap: () => onPick(name),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: isSelected ? AppTheme.kPrimary : AppTheme.kBgCard,
              borderRadius: BorderRadius.circular(AppTheme.rounded12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(name,
                      style: AppTheme.paragraphMedium.copyWith(
                        color: AppTheme.kTextPrimary,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Icon(
                  isSelected
                      ? Icons.check_circle_rounded
                      : Icons.chevron_right_rounded,
                  color: isSelected
                      ? Colors.white
                      : AppTheme.kTextSecondary,
                  size: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ════════════════════════════════════════════════════════════
// STEP 1 — Flight time + total duration (no emojis)
// ════════════════════════════════════════════════════════════
class _StepTiming extends StatelessWidget {
  const _StepTiming({
    required this.flightTime,
    required this.totalDuration,
    required this.onFlightTime,
    required this.onTotalDuration,
    required this.onNext,
  });

  final String? flightTime;
  final String? totalDuration;
  final void Function(String) onFlightTime;
  final void Function(String) onTotalDuration;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Flight time',
                    style: AppTheme.paragraphMedium.copyWith(
                        color: AppTheme.kTextPrimary,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('How long is the actual flight?',
                    style: AppTheme.paragraphSmRegular
                        .copyWith(color: AppTheme.kTextSecondary)),
                const SizedBox(height: 12),
                _PillGrid(
                    options: kFlightTimes,
                    selected: flightTime,
                    onTap: onFlightTime),
                const SizedBox(height: 24),
                Text('Total experience duration',
                    style: AppTheme.paragraphMedium.copyWith(
                        color: AppTheme.kTextPrimary,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('Including briefing, gearing up, extras…',
                    style: AppTheme.paragraphSmRegular
                        .copyWith(color: AppTheme.kTextSecondary)),
                const SizedBox(height: 12),
                _PillGrid(
                    options: kTotalDurations,
                    selected: totalDuration,
                    onTap: onTotalDuration),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        _BottomButton(label: 'Next', onTap: onNext),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════
// STEP 2 — Extras (preset pills + custom input, no emojis)
// ════════════════════════════════════════════════════════════
class _StepExtras extends StatelessWidget {
  const _StepExtras({
    required this.selected,
    required this.customCtrl,
    required this.onToggle,
    required this.onAddCustom,
    required this.onNext,
  });

  final List<String> selected;
  final TextEditingController customCtrl;
  final void Function(String) onToggle;
  final VoidCallback onAddCustom;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final customItems =
        selected.where((s) => !kPresetExtras.contains(s)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('What\'s included?',
                    style: AppTheme.heading2
                        .copyWith(color: AppTheme.kTextPrimary)),
                const SizedBox(height: 4),
                Text('Select everything that comes with this offer.',
                    style: AppTheme.paragraphSmRegular
                        .copyWith(color: AppTheme.kTextSecondary)),
                const SizedBox(height: 20),

                // Preset pills
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: kPresetExtras.map((label) {
                    final isPicked = selected.contains(label);
                    return GestureDetector(
                      onTap: () => onToggle(label),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isPicked
                              ? AppTheme.kPrimary
                              : AppTheme.kBgCard,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(label,
                            style: AppTheme.paragraphSmRegular.copyWith(
                              color: isPicked
                                  ? Colors.white
                                  : AppTheme.kTextPrimary,
                            )),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                // Custom extra input
                Text('Add custom',
                    style: AppTheme.paragraphMedium.copyWith(
                        color: AppTheme.kTextPrimary,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.kBgCard,
                          borderRadius: BorderRadius.circular(
                              AppTheme.rounded12),
                        ),
                        child: TextField(
                          controller: customCtrl,
                          style: AppTheme.paragraphSmRegular
                              .copyWith(color: AppTheme.kTextPrimary),
                          decoration: InputDecoration(
                            hintText:
                                'e.g. Sunset flight, Hammam visit…',
                            hintStyle: AppTheme.paragraphSmRegular
                                .copyWith(
                                    color: AppTheme.kTextSecondary),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: onAddCustom,
                      child: Container(
                        width: 46, height: 46,
                        decoration: BoxDecoration(
                          color: AppTheme.kPrimary,
                          borderRadius: BorderRadius.circular(
                              AppTheme.rounded12),
                        ),
                        child: const Icon(Icons.add_rounded,
                            color: Colors.white, size: 22),
                      ),
                    ),
                  ],
                ),

                // Custom extras chips
                if (customItems.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: customItems
                        .map((s) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.kPrimary
                                    .withValues(alpha: 0.15),
                                borderRadius:
                                    BorderRadius.circular(999),
                                border: Border.all(
                                    color: AppTheme.kPrimary
                                        .withValues(alpha: 0.4)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(s,
                                      style: AppTheme
                                          .paragraphMiniMedium
                                          .copyWith(
                                              color: AppTheme.kPrimary)),
                                  const SizedBox(width: 6),
                                  GestureDetector(
                                    onTap: () => onToggle(s),
                                    child: Icon(Icons.close_rounded,
                                        color: AppTheme.kPrimary,
                                        size: 14),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ],
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        _BottomButton(label: 'Next', onTap: onNext),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════
// STEP 3 — Price + save as (no emojis)
// ════════════════════════════════════════════════════════════
class _StepPrice extends StatelessWidget {
  const _StepPrice({
    required this.priceCtrl,
    required this.saveAs,
    required this.onSaveAs,
    required this.onConfirm,
    required this.onChanged,
    required this.isEditing,
  });

  final TextEditingController priceCtrl;
  final OfferStatus saveAs;
  final void Function(OfferStatus) onSaveAs;
  final VoidCallback? onConfirm;
  final VoidCallback onChanged;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Set your price',
                    style: AppTheme.heading2
                        .copyWith(color: AppTheme.kTextPrimary)),
                const SizedBox(height: 4),
                Text('Clients will see this price on your offer.',
                    style: AppTheme.paragraphSmRegular
                        .copyWith(color: AppTheme.kTextSecondary)),
                const SizedBox(height: 20),

                // Price field — no icon, just text prefix
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.kBgCard,
                    borderRadius:
                        BorderRadius.circular(AppTheme.rounded12),
                  ),
                  child: TextField(
                    controller: priceCtrl,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => onChanged(),
                    style: AppTheme.heading3
                        .copyWith(color: AppTheme.kTextPrimary),
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: AppTheme.heading3
                          .copyWith(color: AppTheme.kTextSecondary),
                      suffixText: 'USD',
                      suffixStyle: AppTheme.paragraphMedium
                          .copyWith(color: AppTheme.kTextSecondary),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 20),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                Text('Save as',
                    style: AppTheme.paragraphMedium.copyWith(
                        color: AppTheme.kTextPrimary,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),

                _SaveAsOption(
                  title: 'Active',
                  desc: 'Visible to clients immediately.',
                  selected: saveAs == OfferStatus.active,
                  onTap: () => onSaveAs(OfferStatus.active),
                ),
                const SizedBox(height: 10),
                _SaveAsOption(
                  title: 'Draft',
                  desc: 'Save for later, not visible yet.',
                  selected: saveAs == OfferStatus.draft,
                  onTap: () => onSaveAs(OfferStatus.draft),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        _BottomButton(
          label: isEditing ? 'Save Changes' : 'Confirm',
          onTap: onConfirm,
        ),
      ],
    );
  }
}

class _SaveAsOption extends StatelessWidget {
  const _SaveAsOption({
    required this.title,
    required this.desc,
    required this.selected,
    required this.onTap,
  });
  final String title, desc;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? AppTheme.kPrimary : AppTheme.kBgCard,
          borderRadius: BorderRadius.circular(AppTheme.rounded12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppTheme.paragraphMedium.copyWith(
                          color: AppTheme.kTextPrimary,
                          fontWeight: FontWeight.w600)),
                  Text(desc,
                      style: AppTheme.paragraphSmRegular.copyWith(
                          color: selected
                              ? AppTheme.kTextPrimary
                                  .withValues(alpha: 0.7)
                              : AppTheme.kTextSecondary)),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle_rounded,
                  color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Shared — pill grid for duration options (no emojis)
// ════════════════════════════════════════════════════════════
class _PillGrid extends StatelessWidget {
  const _PillGrid({
    required this.options,
    required this.selected,
    required this.onTap,
  });
  final List<String> options;
  final String? selected;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.4,
      ),
      itemCount: options.length,
      itemBuilder: (context, i) {
        final label = options[i];
        final isSelected = selected == label;
        return GestureDetector(
          onTap: () => onTap(label),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected ? AppTheme.kPrimary : AppTheme.kBgCard,
              borderRadius: BorderRadius.circular(AppTheme.rounded12),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: AppTheme.paragraphSmRegular.copyWith(
                color:
                    isSelected ? Colors.white : AppTheme.kTextPrimary,
                fontWeight: isSelected
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }
}

// ════════════════════════════════════════════════════════════
// Shared — bottom button
// ════════════════════════════════════════════════════════════
class _BottomButton extends StatelessWidget {
  const _BottomButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.kPrimary,
            disabledBackgroundColor: AppTheme.kBgCard,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.rounded40),
            ),
            elevation: 0,
          ),
          child: Text(label,
              style: AppTheme.paragraphMedium
                  .copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}