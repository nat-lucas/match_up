import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/utils/color.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final void Function()? ontap;
  final bool isBorder;
  final Duration duration;
  final double scaleFactor;

  const CustomButton({
    super.key,
    required this.text,
    this.ontap,
    this.isBorder = false,
    this.duration = const Duration(milliseconds: 100),
    this.scaleFactor = 0.95,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = widget.scaleFactor;
    });
  }

  void _onTapUp(TapUpDetails details) {
    _resetScale();
  }

  void _onTapCancel() {
    _resetScale();
  }

  void _resetScale() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: widget.duration,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15.r),
          decoration: BoxDecoration(
            color: widget.isBorder ? Colors.transparent : const Color(0xffFF5050),
            borderRadius: BorderRadius.circular(12.r),
            border: widget.isBorder
                ? Border.all(color: AppColor.blackborder, width: 1.5)
                : null,
          ),
          child: Center(
            child: CustomTextPopins(
              text: widget.text,
              fontWeight: FontWeight.w600,
              color: widget.isBorder ? AppColor.blackborder : Colors.white,
              size: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
