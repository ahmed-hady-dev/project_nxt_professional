import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_nxt_professional/core/resources/style.dart';
import 'package:project_nxt_professional/core/routes/imports.dart';
import 'package:project_nxt_professional/core/widgets/buttons/main_button.dart';
import 'package:project_nxt_professional/core/widgets/buttons/outline_buttons.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../controller/splash_cubit.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        final cubit = SplashCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/nxt_logo.svg",
                      height: 130.h,
                    ),
                    if (cubit.data != null)
                      for (int i = 0; cubit.data!.template.sponsoredLogos.length > i; i++)
                        Image.network(
                          cubit.data!.template.sponsoredLogos[i],
                          height: 130.h,
                        ),
                  ],
                ),
                FixedSizeBox.height46,
                // FixedSizeBox.height16,
                const Text(
                  "الرجاء تحديد لغة التطبيق",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                FixedSizeBox.height8,
                const Text(
                  "Please select the language of the App",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                FixedSizeBox.height46,
                const Row(
                  children: [
                    PrimaryButton(
                      title: "English",
                    ),
                    SizedBox(width: 12),
                    OutlineButton(
                      title: "العربية",
                    )
                  ],
                ),
                FixedSizeBox.height24,
                ContinueButton(
                  title: "CONTINUE",
                  onTap: () {
                    cubit.prefHelper.firstTime = true;
                    AppRouter.push(clickToStart);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
