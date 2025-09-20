import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexlabtest/data/model/contact.dart';
import 'package:nexlabtest/utils/color_utils.dart';
import 'package:nexlabtest/utils/text_style_utils.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.contact,
    this.onDelete,
    this.onTap,
    this.onAdd,
    this.onEdit,
  });
  final GestureTapCallback? onDelete;
  final GestureTapCallback? onEdit;
  final GestureTapCallback? onAdd;
  final GestureTapCallback? onTap;

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(12.r),
      decoration: BoxDecoration(color: IStaticColors.white),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            // Avatar tròn
            CircleAvatar(
              radius: 24.r,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 12.w),

            // Tên liên hệ
            Expanded(
              child: Text(
                contact.contactName,
                style: TextStyleUtils.getBodyMediumTextRegular()
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120.h,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: onEdit,
                              child: Center(
                                child: Text(
                                  'Chỉnh sửa',
                                  style: TextStyleUtils.getBodyMediumTextBold(),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: IStaticColors.grayD6D6D6,
                          ), // ngăn cách 2 nút
                          Expanded(
                            child: InkWell(
                              onTap: onDelete,
                              child: Center(
                                child: Text(
                                  'Xóa',
                                  style: TextStyleUtils.getBodyMediumTextBold(
                                    color: IStaticColors.redFF2B2E,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
      ),
    );
  }
}
