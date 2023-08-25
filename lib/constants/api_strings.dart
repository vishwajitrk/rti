class ApiStrings {
  static String baseUrl = 'https://dev.renukamatavivahsanstha.com/api/';
  static String websiteUrl = 'https://renukamatavivahsanstha.com';

  static String loginUrl = 'user/login';
  static String loginProfileUrl = 'user/profile';
  static String changePasswordUrl = 'user/change-password';
  static String uploadProfilePhotoUrl = 'user/upload-profile-photo';
  static String uploadBioDataUrl = 'user/upload-biodata';
  static String uploadIdProofUrl = 'user/upload-idproof';
  static String uploadPhotoUrl = 'user/upload-photo';
  static String editProfileUrl = 'user/edit';
  static String updateFamilyUrl = 'user/update-family';
  static String userPackageUrl = 'user/subscription-package';

  static String registerUrl = 'user/register';
  static String packagesUrl = 'subscription-packages';
  static String subscribePackageUrl = 'user/subscribe-package';
  static String makePaymentOfflineUrl = 'user/subscribe-package/make-offline-payment';

  static String userDetailsUrl = 'details';

  static String users = 'users?gender=';

  static String contactedProfiles = 'user/get-contacted_users';
  static String getUserContactUrl = 'user/get-user-contact';
  static String matchProfiles = 'match/match-profiles';
  static String shortlistedProfiles = 'match/shortlisted-profiles';

  static String authoriseUsers({int pageNo = 1, int pageSize = 1000}) => 'user/users?page=$pageNo&per_page=$pageSize';

  static String shortlistProfilenUrl = 'match/shortlist-profile';

  static String countries = 'countries';
  static String states = 'states/';
  static String districts = 'districts/';
  static String talukas = 'talukas/';

  static String adminUsers({int pageNo = 1, int pageSize = 1000}) => 'admin/users?page=$pageNo&per_page=$pageSize';
  static String approveMembershipUrl(id, isAproove) => 'admin/user/approve-offline-payment-membership/$id/$isAproove';
  static String addMembershipUrl(id) => 'admin/user/add-new-membership/$id';
  static String deleteUserUrl(id) => 'admin/user/delete/$id';
  static String changePasswordByAdminUrl = 'admin/user/change-password';
  static String rejectUserIDProofAdminUrl = 'admin/user/reject-idproof';

  static String appNotifications = 'notifications';
  static String userNotifications = 'user/notifications';

  static String aboutUs = '$websiteUrl/about-us/';
  static String contactUs = '$websiteUrl/contact/';
  static String tAndC = '$websiteUrl/terms-and-conditions/';
  static String privacyPolicy = '$websiteUrl/privacy-policy/';
}
