import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class RoundCheckbox extends StatefulWidget {
  final bool? isChecked;
  final ValueChanged<bool> onChanged;

  const RoundCheckbox({
    super.key,
    this.isChecked,
    required this.onChanged,
  });

  @override
  _RoundCheckboxState createState() => _RoundCheckboxState();
}

class _RoundCheckboxState extends State<RoundCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked ?? false;
  }

  @override
void didUpdateWidget(RoundCheckbox oldWidget) {
  super.didUpdateWidget(oldWidget);
  if (widget.isChecked != oldWidget.isChecked) {
    _isChecked = widget.isChecked ?? false; 
  }
}


  void _toggleChecked() {
    setState(() {
      _isChecked = !_isChecked;
      widget.onChanged(_isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleChecked,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        width: 26.w,
        height: 26.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isChecked ? AppColors.purple : Colors.transparent,
          border: Border.all(
            color: _isChecked ? AppColors.purple : AppColors.grey,
            width: 1.5,
          ),
        ),
        child: Center(
          child: _isChecked
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14,
                )
              : const Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.transparent,
                  size: 14,
                ),
        ),
      ),
    );
  }
}
