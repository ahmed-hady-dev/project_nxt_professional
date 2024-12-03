part of 'imports.dart';

class AppRouter {
  static final appKey = GlobalKey<NavigatorState>();
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      //   case chooseLanguage:
      //     return MaterialPageRoute(builder: (_) => const ChooseLanguageView());
      //   case clickToStart:
      //     return MaterialPageRoute(builder: (_) => const ClickToStartView());
      //   case login:
      //     return MaterialPageRoute(builder: (_) => const LoginView());
      //   case verification:
      //     return MaterialPageRoute(builder: (_) => VerificationScreen(number: args));
      //   case register:
      //     return MaterialPageRoute(builder: (_) => const RegisterScreen());
      //   case home:
      //     return MaterialPageRoute(builder: (_) => const HomeView());
      //   case tabBar:
      //     return MaterialPageRoute(builder: (_) => const NxtTabBarView());
      //   case bundle:
      //     return MaterialPageRoute(builder: (_) => BundlesView(bundle: args));
      //   case paymentMethod:
      //     return MaterialPageRoute(builder: (_) => PaymentMethodView(bundle: args));
      //   case workshopDetails:
      //     return MaterialPageRoute(builder: (_) => WorkshopDetailsView(slug: args));
      //   case challengeDetails:
      //     return MaterialPageRoute(builder: (_) => ChallengeDetailsView(slug: args));
      //   case jobDetails:
      //     return MaterialPageRoute(builder: (_) => JobDetailsView(job: args));
      //   case workshopQrCode:
      //     return MaterialPageRoute(builder: (_) => WorkshopQrcodeView(workshop: args));
      //   case classDetails:
      //     return MaterialPageRoute(builder: (_) => ClassDetailsView(classArgs: args));
      //   case readDetails:
      //     return MaterialPageRoute(builder: (_) => ReadDetailsView(slug: args));
      //   case partnerDetails:
      //     return MaterialPageRoute(builder: (_) => PartnerDetailsScreen(partner: args));
      //   case more:
      //     return MaterialPageRoute(builder: (_) => const MoreView());
      //   case storyView:
      //     return MaterialPageRoute(builder: (_) => HighlightWidget(arguments: args));
      //   case editProfile:
      //     return MaterialPageRoute(builder: (_) => const EditProfileView());
      //   case editAbout:
      //     return MaterialPageRoute(builder: (_) => const EditAboutView());
      //   case onlinePayment:
      //     return MaterialPageRoute(builder: (_) => OnlinePayment(url: args));
      //   case editAppearance:
      //     return MaterialPageRoute(builder: (_) => const EditAppearanceView());
      //   case editEducationalExperiences:
      //     return MaterialPageRoute(builder: (_) => const EditEducationalExperiencesView());
      //   case editUnionMembership:
      //     return MaterialPageRoute(builder: (_) => const EditUnionMembershipView());
      //   case editSkills:
      //     return MaterialPageRoute(builder: (_) => const EditSkillsView());
      //   case editInterests:
      //     return MaterialPageRoute(builder: (_) => const EditInterestsView());
      //   case editSocialMediaProfiles:
      //     return MaterialPageRoute(builder: (_) => const EditSocialMediaProfilesView());
      //   case editGallery:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(value: args as GalleryCubit, child: const EditGalleryView()));
      //   case editShowReals:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as GalleryCubit,
      //               child: const EditShowRealsView(),
      //             ));
      //   case editPastExperiences:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as GalleryCubit,
      //               child: EditPastExperiencesView(cubit: args),
      //             ));
      //   case addPastExperiences:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //             value: args['cubit'] as GalleryCubit,
      //             child: AddPastExperienceView(
      //               pastExperience: args['pastExperiences'],
      //             )));
      //   case notification:
      //     return MaterialPageRoute(builder: (_) => const NotificationView());
      //   case subscriptionScreen:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as MoreCubit..getUserSubscription(),
      //               child: SubscriptionScreen(
      //                 cubit: args,
      //               ),
      //             ));
      //   case legalScreen:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as MoreCubit..getLegalDetails(),
      //               child: LegalScreen(cubit: args),
      //             ));
      //   case faqScreen:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as MoreCubit..getFAQ(),
      //               child: FAQScreen(cubit: args),
      //             ));
      //   case contactUsView:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as MoreCubit,
      //               child: ContactUsView(cubit: args),
      //             ));
      //   case createPost:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as CommunityCubit,
      //               child: CreatePostScreen(cubit: args),
      //             ));
      //   case commentPost:
      //     return MaterialPageRoute(builder: (_) {
      //       PostCommentArguments args = settings.arguments as PostCommentArguments;
      //       return BlocProvider.value(
      //         value: args.cubit,
      //         child: PostCommentView(arguments: args),
      //       );
      //     });
      //   case languageScreen:
      //     return MaterialPageRoute(builder: (_) => const LanguageScreen());
      //   case winnersView:
      //     return MaterialPageRoute(builder: (_) {
      //       ChallengeDetailsCubit args = settings.arguments as ChallengeDetailsCubit;
      //       return BlocProvider.value(
      //         value: args,
      //         child: WinnersScreen(cubit: args),
      //       );
      //     });
      //   case editEducationalExperiences:
      //     return MaterialPageRoute(builder: (_) => const EditEducationalExperiencesView());
      //   case editPastExperiences:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as GalleryCubit,
      //               child: EditPastExperiencesView(cubit: args),
      //             ));
      //   case viewSubmission:
      //     return MaterialPageRoute(builder: (_) {
      //       return BlocProvider.value(
      //         value: args as ChallengeDetailsCubit,
      //         child: ViewSubmission(cubit: args),
      //       );
      //     });
      //   case userChallenge:
      //     return MaterialPageRoute(builder: (_) {
      //       UserChallengeArgument args = settings.arguments as UserChallengeArgument;
      //       return BlocProvider.value(
      //         value: args.cubit,
      //         child: UserChallengePageViewBuilder(argument: args),
      //       );
      //     });
      //   case addPastExperiences:
      //     return MaterialPageRoute(builder: (_) => const AddPastExperienceView());
      //   case profileWorkshops:
      //     return MaterialPageRoute(builder: (_) => const ProfileWorkshopsView());
      //   case profileClasses:
      //     return MaterialPageRoute(builder: (_) => const ProfileClassesView());
      //   case profileReads:
      //     return MaterialPageRoute(builder: (_) => const ProfileReadsView());
      //   case profileJobs:
      //     return MaterialPageRoute(builder: (_) => const ProfileJobsView());
      //   case editCredits:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as ProfileCubit,
      //               child: const EditCredit(),
      //             ));
      //   case editAwards:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args as ProfileCubit,
      //               child: const EditAwards(),
      //             ));
      //   case editCredit:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args['cubit'] as ProfileCubit,
      //               child: EditAddCredit(
      //                 credit: args['credit'],
      //               ),
      //             ));
      //   case editAward:
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider.value(
      //               value: args['cubit'] as ProfileCubit,
      //               child: EditAddAward(
      //                 award: args['award'],
      //               ),
      //             ));
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("no Views for that root")),
          );
        });
    }
  }

  static void pop({dynamic result}) {
    appKey.currentState!.pop(result);
  }

  static void popUntil(String name) {
    appKey.currentState!.popUntil(ModalRoute.withName(name));
  }

  static Future push(String routeName, {arguments, bool replace = false, bool clean = false, dynamic result}) async {
    if (clean) {
      return appKey.currentState!.pushNamedAndRemoveUntil(
        routeName,
        (_) => false,
        arguments: arguments,
      );
    } else if (replace) {
      return appKey.currentState!.pushReplacementNamed(
        routeName,
        arguments: arguments,
        result: result,
      );
    } else {
      return appKey.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }
}
