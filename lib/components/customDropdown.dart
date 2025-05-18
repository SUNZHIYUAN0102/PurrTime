import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String label;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const CustomDropdown({
    Key? key,
    required this.options,
    required this.label,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final GlobalKey _key = GlobalKey();

  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? widget.options.first;
  }

  @override
  void didUpdateWidget(covariant CustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialValue != null &&
        widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != selectedValue) {
      setState(() {
        selectedValue = widget.initialValue!;
      });
    }
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _removeDropdown();
    }
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder:
          (context) => GestureDetector(
            onTap: _removeDropdown,
            behavior: HitTestBehavior.translucent,
            child: Stack(
              children: [
                Positioned(
                  width: size.width,
                  child: CompositedTransformFollower(
                    link: _layerLink,
                    showWhenUnlinked: false,
                    offset: Offset(0, size.height - 10.h),
                    child: Material(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.sp),
                      elevation: 12, // 添加这一行，数值越大阴影越明显
                      shadowColor: Colors.black.withOpacity(0.3),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children:
                            widget.options.map((option) {
                              return ListTile(
                                selectedColor: Colors.black,
                                textColor: Colors.grey[600],
                                selected: selectedValue == option,
                                title: Text(option),
                                onTap: () {
                                  setState(() {
                                    selectedValue = option;
                                  });
                                  widget.onChanged?.call(option);
                                  _removeDropdown();
                                },
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  @override
  void dispose() {
    _removeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          key: _key,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          margin: EdgeInsets.only(bottom: 10.h),
          width: double.infinity,
          height: 65.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.label,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              ),
              Text(selectedValue, style: TextStyle(fontSize: 15.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
