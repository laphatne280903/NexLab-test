import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexlabtest/features/contact/bloc/contact_bloc.dart';
import 'package:nexlabtest/utils/color_utils.dart';
import 'package:nexlabtest/utils/text_style_utils.dart';

import '../../../data/model/contact.dart';

class ContactFormBottomSheet extends StatefulWidget {
  final Contact? contact;
  final GestureTapCallback onSave;

  const ContactFormBottomSheet({super.key, this.contact, required this.onSave});

  @override
  State<ContactFormBottomSheet> createState() => _ContactFormBottomSheetState();
}

class _ContactFormBottomSheetState extends State<ContactFormBottomSheet> {
  late final bloc = context.read<ContactBloc>();

  @override
  void initState() {
    super.initState();
    bloc.nameController = TextEditingController(
      text: widget.contact?.contactName ?? "",
    );
    bloc.phoneController = TextEditingController(
      text: widget.contact?.contactPhone ?? "",
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleSave() {
    final name = bloc.nameController.text.trim();
    final phone = bloc.phoneController.text.trim();
    if (name.isNotEmpty && phone.isNotEmpty) {
      widget.onSave;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.contact == null ? "Thêm liên hệ mới" : "Chỉnh sửa liên hệ",
            style: TextStyleUtils.getBodyExtraLargeTextBold(),
          ),
          const SizedBox(height: 16),

          TextField(
            controller: bloc.nameController,
            style: TextStyleUtils.getBodyMediumTextRegular(),
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                color: IStaticColors.orangeFE8019, // màu chữ label
              ),
              hint: Text(
                'Nhập số tên liên hệ',
                style: TextStyleUtils.getBodyMediumTextRegular(
                  color: IStaticColors.gray585858,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: IStaticColors.grayD6D6D6, // màu viền khi chưa focus
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: IStaticColors.orangeFE8019, // màu viền khi focus
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            controller: bloc.phoneController,
            keyboardType: TextInputType.phone,
            style: TextStyleUtils.getBodyMediumTextRegular(),
            decoration: InputDecoration(
              labelStyle: TextStyleUtils.getBodyMediumTextRegular(
                color: IStaticColors.orangeFE8019, // màu chữ label
              ),
              hint: Text(
                'Nhập số điện thoại',
                style: TextStyleUtils.getBodyMediumTextRegular(
                  color: IStaticColors.gray585858,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: IStaticColors.grayD6D6D6, // màu viền khi chưa focus
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: IStaticColors.orangeFE8019, // màu viền khi focus
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: IStaticColors.orangeFE8019,
                foregroundColor: Colors.white,
                padding: REdgeInsets.symmetric(
                  vertical: 14.r,
                  horizontal: 24.r,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Lưu",
                style: TextStyleUtils.getBodyLargeTextBold(
                  color: IStaticColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
