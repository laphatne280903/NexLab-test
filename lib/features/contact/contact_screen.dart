import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexlabtest/data/model/contact.dart';
import 'package:nexlabtest/features/authentication/sign_in_screen.dart';
import 'package:nexlabtest/features/contact/bloc/contact_bloc.dart';
import 'package:nexlabtest/features/contact/bloc/contact_state.dart';
import 'package:nexlabtest/features/contact/widgets/contact_item.dart';
import 'package:nexlabtest/features/contact/widgets/upsert_contact_sheet.dart';
import 'package:nexlabtest/gen/assets.gen.dart';
import 'package:nexlabtest/injection.dart';
import 'package:nexlabtest/share_widgets/cached_image.dart';
import 'package:nexlabtest/utils/color_utils.dart';
import 'package:nexlabtest/utils/text_style_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ContactBloc bloc;

  @override
  void initState() {
    bloc = getIt<ContactBloc>();
    bloc.getUserInfo();
    bloc.getContactList();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<ContactBloc, ContactState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Liên lạc',
                style: TextStyleUtils.getBodyExtraLargeTextBold(),
              ),
              centerTitle: true,
              actionsPadding: REdgeInsets.only(right: 12.r),
              actions: [
                InkWell(
                  onTap: () {
                    showContactFormBottomSheet(
                      context,
                      onSave: () async {
                        await bloc.addContact(context);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  customBorder: const CircleBorder(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      size: 28,
                      color: IStaticColors.black,
                    ),
                  ),
                ),
              ],
              leadingWidth: 30.w,
              leading: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      final url = state.userInfo?.avatarUrl ?? '';
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 1.0,
                          child: Material(
                            color: Colors.white,
                            elevation: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 50),

                                IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: const Icon(Icons.arrow_back_ios),
                                ),

                                Center(
                                  child: Column(
                                    children: [
                                      ClipOval(
                                        child: url.isEmpty
                                            ? Container(
                                                width: 120.w,
                                                height: 120.w,
                                                color: Colors.grey[200],
                                                child: const Icon(
                                                  Icons.person,
                                                  size: 60,
                                                ),
                                              )
                                            : CachedImage(
                                                imageUrl: url,
                                                width: 120.w,
                                                height: 120.w,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        state.userInfo?.userName ?? '',
                                        style:
                                            TextStyleUtils.getBodyMediumTextBold(),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 24),

                                /// Menu căn trái
                                Expanded(
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.person),
                                        title: const Text("Trang cá nhân"),
                                        onTap: () {},
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.settings),
                                        title: const Text("Cài đặt"),
                                        onTap: () {},
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.logout),
                                        title: const Text("Đăng xuất"),
                                        onTap: () {
                                          bloc.logout();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: RPadding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Assets.icons.drawer.svg(color: IStaticColors.black),
                ),
              ),
            ),

            body: Container(
              height: MediaQuery.of(context).size.height,
              padding: REdgeInsets.only(top: 12.r),
              child: state.contact?.isNotEmpty ?? false
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.contact?.length,
                      itemBuilder: (context, index) {
                        final item = state.contact?[index];
                        if (item != null) {
                          return ContactItem(
                            contact: item,
                            onDelete: () async {
                              await bloc.deleteContact(context, item.id);
                              Navigator.of(context).pop();
                            },
                            onEdit: () async {
                              showContactFormBottomSheet(
                                context,
                                contact: item,
                                onSave: () async {
                                  await bloc.updateContact(context, item);
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          );
                        }
                      },
                    )
                  : Center(
                      child: Text(
                        'Không có liên hệ nào',
                        style: TextStyleUtils.getBodyLargeTextRegular(
                          color: IStaticColors.gray585858,
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  Future<void> showContactFormBottomSheet(
    BuildContext context, {
    Contact? contact,
    required GestureTapCallback onSave,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return BlocProvider.value(
          value: bloc,
          child: ContactFormBottomSheet(contact: contact, onSave: onSave),
        );
      },
    );
  }
}
