import '../../data/models/icon/icon_type.dart';

class AppIcons {
  // images

  static const String testAvatar = "assets/images/test_avatar.png";
  static const String barcode = "assets/images/barcode.png";
  static const String emptyProfile = "assets/images/empty_profile.png";
  static const String enterPassword = "assets/images/enter_password.png";
  static const String fingerPrint = "assets/images/finger_print.png";
  static const String onBoarding1 = "assets/images/on_boarding1.png";
  static const String onBoarding2 = "assets/images/on_boarding2.png";
  static const String onBoarding3 = "assets/images/on_boarding3.png";
  static const String onBoardingDark1 = "assets/images/on_boarding_dark1.png";
  static const String onBoardingDark2 = "assets/images/on_boarding_dark2.png";
  static const String onBoardingDark3 = "assets/images/on_boarding_dark3.png";
  static const String searchNotFound = "assets/images/search_not_found.png";
  static const String signIn = "assets/images/sign_in.png";
  static const String splashScreen = "assets/images/splash_screen.png";
  static const String successPassword = "assets/images/success_password.png";
  static const String taxiLogo = "assets/images/taxi_logo.png";
  static const String uzbFlag = "assets/images/uzb.png";
  static const String createNewPasswordDialog =
      "assets/images/create_new_password_dialog.png";
  static const String forgotPasswordDarkImage =
      "assets/images/forgot_password_dark.png";
  static const String createNewPasswordDarkImage =
      "assets/images/create_new_password_dark.png";
  static const String locationInSearchDb =
      "assets/images/location_in_search.png";

  // smile images
  static const String smileAngry = "assets/images/mood/smile_angry.png";
  static const String smileCry = "assets/images/mood/smile_cry.png";
  static const String smileExcited = "assets/images/mood/smile_excited.png";
  static const String smileEyeGlass = "assets/images/mood/smile_eye_glass.png";
  static const String smileHappy = "assets/images/mood/smile_happy.png";
  static const String smileQuiet = "assets/images/mood/smile_quiet.png";
  static const String smileTired = "assets/images/mood/smile_tired.png";
  static const String smileUnhappy = "assets/images/mood/smile_unhappy.png";
  static const String smileVeryHappy =
      "assets/images/mood/smile_very_happy.png";

  static String getSvg({required String name, IconType? iconType}) {
    if (iconType != null) {
      return "assets/svg/${iconType.name}/${name.substring(name.lastIndexOf("/") + 1, name.indexOf("."))}.svg";
    }
    return name;
  }

  // svg
  static IconType it = IconType.lightOutline;
  static final String search = "assets/svg/${it.name}/search.svg";
  static final String user2 = "assets/svg/${it.name}/two_users.svg";
  static final String user3 = "assets/svg/${it.name}/three_users.svg";
  static final String activity = "assets/svg/${it.name}/activity.svg";
  static final String addUser = "assets/svg/${it.name}/add_user.svg";
  static final String arrowDown = "assets/svg/${it.name}/arrow_down.svg";
  static final String arrowDown2 = "assets/svg/${it.name}/arrow_down_2.svg";
  static final String arrowDown3 = "assets/svg/${it.name}/arrow_down_3.svg";
  static final String arrowDownCircle =
      "assets/svg/${it.name}/arrow_down_circle.svg";
  static final String arrowDownSquare =
      "assets/svg/${it.name}/arrow_down_square.svg";
  static final String arrowLeft = "assets/svg/${it.name}/arrow_left.svg";
  static final String arrowLeft2 = "assets/svg/${it.name}/arrow_left_2.svg";
  static final String arrowLeft3 = "assets/svg/${it.name}/arrow_left_3.svg";
  static final String arrowLeftCircle =
      "assets/svg/${it.name}/arrow_left_circle.svg";
  static final String arrowLeftSquare =
      "assets/svg/${it.name}/arrow_left_square.svg";
  static final String arrowRight = "assets/svg/${it.name}/arrow_right.svg";
  static final String arrowRight2 = "assets/svg/${it.name}/arrow_right_2.svg";
  static final String arrowRight3 = "assets/svg/${it.name}/arrow_right_3.svg";
  static final String arrowRightCircle =
      "assets/svg/${it.name}/arrow_right_circle.svg";
  static final String arrowRightSquare =
      "assets/svg/${it.name}/arrow_right_square.svg";
  static final String arrowUp = "assets/svg/${it.name}/arrow_up.svg";
  static final String arrowUp2 = "assets/svg/${it.name}/arrow_up_2.svg";
  static final String arrowUp3 = "assets/svg/${it.name}/arrow_up_3.svg";
  static final String arrowUpCircle =
      "assets/svg/${it.name}/arrow_up_circle.svg";
  static final String arrowUpSquare =
      "assets/svg/${it.name}/arrow_up_square.svg";
  static final String bag = "assets/svg/${it.name}/bag.svg";
  static final String bag2 = "assets/svg/${it.name}/bag_2.svg";
  static final String bookmark = "assets/svg/${it.name}/bookmark.svg";
  static final String buy = "assets/svg/${it.name}/buy.svg";
  static final String calendar = "assets/svg/${it.name}/calendar.svg";
  static final String call = "assets/svg/${it.name}/call.svg";
  static final String callMissed = "assets/svg/${it.name}/call_missed.svg";
  static final String callSilent = "assets/svg/${it.name}/call_silent.svg";
  static final String calling = "assets/svg/${it.name}/calling.svg";
  static final String camera = "assets/svg/${it.name}/camera.svg";
  static final String category = "assets/svg/${it.name}/category.svg";
  static final String chart = "assets/svg/${it.name}/chart.svg";
  static final String chat = "assets/svg/${it.name}/chat.svg";
  static final String closeSquare = "assets/svg/${it.name}/close_square.svg";
  static final String dangerTriangle =
      "assets/svg/${it.name}/danger_triangle.svg";
  static final String delete = "assets/svg/${it.name}/delete.svg";
  static final String discount = "assets/svg/${it.name}/discount.svg";
  static final String discovery = "assets/svg/${it.name}/discovery.svg";
  static final String document = "assets/svg/${it.name}/document.svg";
  static final String download = "assets/svg/${it.name}/download.svg";
  static final String edit = "assets/svg/${it.name}/edit.svg";
  static final String editSquare = "assets/svg/${it.name}/edit_square.svg";
  static final String filter = "assets/svg/${it.name}/filter.svg";
  static final String filter3 = "assets/svg/${it.name}/filter_3.svg";
  static final String folder = "assets/svg/${it.name}/folder.svg";
  static final String game = "assets/svg/${it.name}/game.svg";
  static final String graph = "assets/svg/${it.name}/graph.svg";
  static final String heart = "assets/svg/${it.name}/heart.svg";
  static final String hide = "assets/svg/${it.name}/hide.svg";
  static final String home = "assets/svg/${it.name}/home.svg";
  static final String image = "assets/svg/${it.name}/image.svg";
  static final String image2 = "assets/svg/${it.name}/image_2.svg";
  static final String infoCircle = "assets/svg/${it.name}/info_circle.svg";
  static final String infoSquare = "assets/svg/${it.name}/info_square.svg";
  static final String location = "assets/svg/${it.name}/location.svg";
  static final String lock = "assets/svg/${it.name}/lock.svg";
  static final String logOut = "assets/svg/${it.name}/log_out.svg";
  static final String login = "assets/svg/${it.name}/login.svg";
  static final String message = "assets/svg/${it.name}/message.svg";
  static final String moreCircle = "assets/svg/${it.name}/more_circle.svg";
  static final String moreSquare = "assets/svg/${it.name}/more_square.svg";
  static final String notification = "assets/svg/${it.name}/notification.svg";
  static final String paper = "assets/svg/${it.name}/paper.svg";
  static final String paperDownload =
      "assets/svg/${it.name}/paper_download.svg";
  static final String paperFail = "assets/svg/${it.name}/paper_fail.svg";
  static final String paperNegative =
      "assets/svg/${it.name}/paper_negative.svg";
  static final String paperPlus = "assets/svg/${it.name}/paper_plus.svg";
  static final String paperUpload = "assets/svg/${it.name}/paper_upload.svg";
  static final String password = "assets/svg/${it.name}/password.svg";
  static final String play = "assets/svg/${it.name}/play.svg";
  static final String plus = "assets/svg/${it.name}/plus.svg";
  static final String profile = "assets/svg/${it.name}/profile.svg";
  static final String scan = "assets/svg/${it.name}/scan.svg";
  static final String send = "assets/svg/${it.name}/send.svg";
  static final String setting = "assets/svg/${it.name}/setting.svg";
  static final String shieldDone = "assets/svg/${it.name}/shield_done.svg";
  static final String shieldFail = "assets/svg/${it.name}/shield_fail.svg";
  static final String show = "assets/svg/${it.name}/show.svg";
  static final String star = "assets/svg/${it.name}/star.svg";
  static final String swap = "assets/svg/${it.name}/swap.svg";
  static final String tickSquare = "assets/svg/${it.name}/tick_square.svg";
  static final String ticket = "assets/svg/${it.name}/ticket.svg";
  static final String ticketStar = "assets/svg/${it.name}/ticket_star.svg";
  static final String timeCircle = "assets/svg/${it.name}/time_circle.svg";
  static final String timeSquare = "assets/svg/${it.name}/time_square.svg";
  static final String unlock = "assets/svg/${it.name}/unlock.svg";
  static final String upload = "assets/svg/${it.name}/upload.svg";
  static final String video = "assets/svg/${it.name}/video.svg";
  static final String voice = "assets/svg/${it.name}/voice.svg";
  static final String voice2 = "assets/svg/${it.name}/voice_2.svg";
  static final String volumeDown = "assets/svg/${it.name}/volume_down.svg";
  static final String volumeOff = "assets/svg/${it.name}/volume_off.svg";
  static final String volumeUp = "assets/svg/${it.name}/volume_up.svg";
  static final String wallet = "assets/svg/${it.name}/wallet.svg";
  static final String work = "assets/svg/${it.name}/work.svg";
  static const String gps = "assets/svg/bold/gps.svg";

  //auth svg
  static const String facebook = "assets/svg/auth_svg/facebook.svg";
  static const String google = "assets/svg/auth_svg/google.svg";
  static const String apple = "assets/svg/auth_svg/apple.svg";

  // lottie
  static const String splashCircular = "assets/lottie/splash_circular.json";
  static const String cameraSelect = "assets/lottie/camera_select.json";
  static const String loader = "assets/lottie/loader.json";

  //others
  static const String checked = "assets/svg/others/checked.svg";
  static const String unchecked = "assets/svg/others/unchecked.svg";
  static const String frame = "assets/svg/others/fram.svg";
  static const String blueOffer = "assets/svg/others/blue_offer.svg";
  static const String greenOffer = "assets/svg/others/green_offer.svg";
  static const String purpleOffer = "assets/svg/others/purple_offer.svg";
  static const String redOffer = "assets/svg/others/red_offer.svg";
  static const String yellowOffer = "assets/svg/others/yellow_offer.svg";
  static const String promoCode = "assets/svg/others/promo_code.svg";

}
