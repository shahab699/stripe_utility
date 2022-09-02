//Base URL
//const String baseUrl = "http://homedish-api.jinnbytedev.com/api";
const String baseUrl = "http://54.254.175.246:81/api";
// const String baseUrlForImages = "http://homedish-api.jinnbytedev.com";
//const String baseUrlForImages = "http://54.254.175.246:81";
const String baseUrlForImages = "";
const String merchantId = "acct_1K5AvOEARkR28KRv";
const String publishKey = "pk_live_51K5AvOEARkR28KRvU7moxzO1EPNAIHNHjH1HJIg6cgC4DfPn9q0xyqtx4CaPAywdhDCPDYS8W5WJc4d4mQEotTa500j2c5FGYL";
const String stripSecretKey = "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";

const String getCategoriesApi = "$baseUrl/Categories/GetCategories";
const String getSubCategoriesApi = "$baseUrl/Categories/GetSubCategories?";
const String getSignUpApi = "$baseUrl/Accounts/Register";
const String getLoginApi = "$baseUrl/Accounts/Login";
const String getForgotPasswordApi = "$baseUrl/Accounts/ForgotPassword?";


// 01/06/2021
const String getUploadUserImageApi = "$baseUrl/Users/UploadProfilePicture";
const String getSubscriptionPlansApi="$baseUrl/SubscriptionPlans/GetSubscriptionPlans?";
const String getSellerDishesApi="$baseUrl/Dishes/GetSellerDishes?";

// 02/06/2021
const String getSaveDishApi="$baseUrl/Dishes/SaveDish";
const String getUploadDishPictureApi="$baseUrl/Dishes/UploadDishPicture";
const String getDeleteDishApi="$baseUrl/Dishes/DeleteDish?";

// 03/06/2020
const String getSubscribePalnApi="$baseUrl/Users/SubscribePlan?";
const String getQueriesApi="$baseUrl/Queries/GetQueries";
const String getSaveQueryApi="$baseUrl/Queries/SaveQuery";

// 04/06/2020
const String getQueryDetailApi="$baseUrl/Queries/GetQueryDetail?";
const String getSellerCategoriesApi="$baseUrl/Categories/GetSellerCategories?";

// 07/06/2020
const String getRequestsForSellerApi="$baseUrl/Requests/GetRequestsForSellers";
const String getBidOnRequestsApi="$baseUrl/Requests/BidOnRequest";
const String getStatsApi="$baseUrl/Users/GetProfileStats?";

// 08/06/2020
const String getUpdateDishApi="$baseUrl/Dishes/UpdateDish";

// 09/06/2020
const String getFeaturedResturantsApi="$baseUrl/Restaurants/GetFeaturedRestaurants";
const String getAllResturantsApi="$baseUrl/Restaurants/GetRestaurants";
const String getAdsApi="$baseUrl/Restaurants/GetAds";

// 10/06/2020
const String getOpenRequestsApi="$baseUrl/Requests/GetOpenCustomerRequests?";
const String getClosedRequestsApi="$baseUrl/Requests/GetCloseCustomerRequests?";
const String getCloseRequestApi="$baseUrl/Requests/CloseRequest?";
const String getShowMoreRequestApi="$baseUrl/Requests/GetRequestOffers?";
const String getSaveRequestApi="$baseUrl/Requests/SaveRequest";

// 15/06/2020
const String getSaveRatingApi="$baseUrl/Ratings/SaveRating";
//(Both customer and seller)
const String getUpdateProfileApi="$baseUrl/Accounts/UpdateProfile";

// 22/06/2021
const String getResturantDetailApi="$baseUrl/Restaurants/GetRestaurantDetail?";
const String getSellerRatingApi="$baseUrl/Ratings/GetRating?";

//06/07/2020
const String getNotificationsApi="$baseUrl/Notifications/Get?";

