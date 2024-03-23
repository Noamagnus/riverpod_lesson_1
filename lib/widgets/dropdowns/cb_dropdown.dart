import 'dart:math' as math;

import 'package:flutter/mater'
    'ial.dart';
import 'package:my_first_riverpod/helpers/animations.dart';
import 'package:my_first_riverpod/data/constants/colors.dart';
import 'package:my_first_riverpod/utils/icons_paths.dart';
import 'package:my_first_riverpod/widgets/boxes_and_containers/CBContainer.dart';
import 'package:my_first_riverpod/widgets/buttons/cb_icon_button.dart';

class CBDropdownController {
  late void Function() _close;

  void attach(
    void Function() onTap,
  ) {
    _close = onTap;
  }

  void close() => _close();
}

class CBDropdown extends StatefulWidget {
  const CBDropdown({
    super.key,
    this.animationDuration,
    this.hasBorder = false,
    this.collapsedColor,
    this.expandedColor,
    this.collapsedBorderColor,
    this.expandedBorderColor,
    this.title,
    this.expandedContentChild,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.allPadding,
    this.allMargin,
    this.borderRadius,
    this.expandedIconColor,
    this.iconColor,
    this.expandedIconBackgroundColor,
    this.iconBackgroundColor,
    this.buttonSize,
    this.iconSize,
    this.onExpansionChanged,
    this.controller,
    this.hideIcon = false,
    this.borderWidth,
    this.gradient,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.childMainAxisSize = MainAxisSize.max,
  });

  final int? animationDuration;
  final bool hasBorder;
  final double? borderRadius;
  final double? borderWidth;
  final Color? collapsedColor;
  final Color? expandedColor;
  final Color? collapsedBorderColor;
  final Color? expandedBorderColor;
  final Widget? title;
  final Widget? expandedContentChild;

  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final double? allPadding;

  final double? allMargin;
  final Gradient? gradient;

  final Color? expandedIconColor;
  final Color? iconColor;
  final Color? expandedIconBackgroundColor;
  final Color? iconBackgroundColor;

  final double? buttonSize;
  final double? iconSize;
  final bool hideIcon;

  final ValueChanged<bool>? onExpansionChanged;

  final CBDropdownController? controller;

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize childMainAxisSize;

  @override
  State<CBDropdown> createState() => _CBDropdownState();
}

class _CBDropdownState extends State<CBDropdown> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  late Animation<double> _heightFactor;
  bool _isExpanded = false;

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration ?? 300),
    );
    _heightFactor = _controller.drive(_easeInTween);
    if (widget.controller != null) {
      widget.controller!.attach(onTileTapped);
    }
    super.initState();
  }

  void onTileTapped() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return GestureDetector(
          onTap: onTileTapped,
          child: CBContainer(
            color: animateColors(
              widget.collapsedColor ?? kColorNewBackground,
              widget.expandedColor ?? kColorPrimaryWhite,
              _controller,
            ),
            hasBorder: widget.hasBorder,
            borderColor: animateColors(
                  widget.collapsedBorderColor ?? kColorBlue20,
                  widget.expandedBorderColor ?? kColorPrimaryWhite,
                  _controller,
                ) ??
                kColorPrimaryWhite,
            borderRadius: widget.borderRadius ?? 10,
            borderWidth: widget.borderWidth ?? 2,
            width: MediaQuery.of(context).size.width,
            gradient: widget.gradient,
            child: Column(
              mainAxisSize: widget.childMainAxisSize,
              children: [
                CBContainer(
                  allPadding: widget.allPadding,
                  leftPadding: widget.leftPadding,
                  rightPadding: widget.rightPadding,
                  topPadding: widget.topPadding,
                  bottomPadding: widget.topPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: widget.crossAxisAlignment,
                    children: [
                      widget.title ?? const SizedBox.shrink(),
                      if (!widget.hideIcon)
                        Transform.rotate(
                          angle: math.pi + (_controller.value * math.pi),
                          child: CBIconButton(
                            path: kAssetToggleUpIcon,
                            size: widget.buttonSize ?? 24,
                            color: animateColors(
                              widget.iconBackgroundColor ?? kColorBlue100,
                              widget.expandedIconBackgroundColor ?? kColorLightBlue10,
                              _controller,
                            ),
                            iconColor: animateColors(
                              widget.iconColor ?? kColorPrimaryWhite,
                              widget.expandedIconColor ?? kColorBlue100,
                              _controller,
                            ),
                            iconSize: widget.iconSize ?? 12,
                          ),
                        ),
                    ],
                  ),
                ),
                ClipRect(
                  child: Align(
                    heightFactor: _heightFactor.value,
                    child: Offstage(
                      offstage: closed,
                      child: TickerMode(
                        enabled: !closed,
                        child: SizedBox(
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: widget.animationDuration ?? 300),
                            opacity: _controller.value,
                            child: widget.expandedContentChild,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
