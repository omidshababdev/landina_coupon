//AppTranslation.dart
abstract class Translation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": en,
    "fa": fa,
  };
}

final Map<String, String> en = {
  "appName": "Landina Coupon",
  "profile": "profile",
  "account": "account",
  "landinaID": "Landina ID",
  "email": "email",
  "emailAddress": "email address",
  "password": "password",
  "coupon": "coupon",
  "coupons": "coupons",
  "brand": "brand",
  "category": "category",
  "categories": "categories",
  "filter": "filter",
  "filters": "filters",
  "follow": "follow",
  "contact": "contact",
  "website": "website",
  "searchField": "What are you looking for?",
  "couponTextTitle": "Coupon Text Title",
  "couponDescription":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  "copyCouponCode": "Copy coupon code to clipboard",
  "brandName": "Brand Name",
  "setFilter": "Set Filter",
  "chooseYourFilter": "Choose your filter",
  "loginPageDescription": "Please enter your landina id and password.",
  "loginToAccount": "Login to my account",
  "forgetPass": "Forget password",
  "createAnAccount": "Create an account",
  "emailPageDescription":
      "Please enter a valid email address for your account.",
  "passPageDescription": "Please enter an strong password for your account.",
  "goToTheNextLevel": "go to the next level",
  "forgetPassPageDescription":
      "Please enter your email address to retrieve your password.",
  "sendRecoveryEmail": "Send a recovery email"
};

final Map<String, String> fa = {
  "appName": "لندینا کوپن",
  "profile": "پروفایل",
  "account": "حساب کاربری",
  "landinaID": "شناسه لندینا",
  "email": "ایمیل",
  "emailAddress": "آدرس ایمیل",
  "password": "رمز عبور",
  "coupon": "کوپن",
  "coupons": "کوپن ها",
  "brand": "برند",
  "category": "دسته بندی",
  "categories": "دسته بندی ها",
  "filter": "فیلتر",
  "filters": "فیلترها",
  "follow": "دنبال کردن",
  "contact": "تماس",
  "website": "وبسایت",
  "searchField": "دنبال چی می گردی؟",
  "couponTextTitle": "عنوان تخفیف موجود",
  "couponDescription":
      "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد",
  "copyCouponCode": "کد تخفیف رو کپی کن",
  "brandName": "نام برند",
  "setFilter": "اعمال فیتر",
  "chooseYourFilter": "لطفا فیلتر مورد نظرت رو انتخاب کن",
  "loginPageDescription":
      "لطفا برای ورود به حساب کاربری خود اطلاعات زیر را وارد کنید.",
  "loginToAccount": "ورود به حساب من",
  "forgetPass": "فراموشی رمز",
  "createAnAccount": "ایجاد حساب کاربری",
  "emailPageDescription":
      "لطفا یک آدرس ایمیل معتبر برای حساب کاربری خود وارد کنید.",
  "passPageDescription": "لطفا یک رمز عبور قوی برای حساب کاربری خود وارد کنید.",
  "goToTheNextLevel": "برو به مرحله بعد",
  "forgetPassPageDescription":
      "لطفا برای بازیابی رمز آدرس ایمیل خود را وارد کنید.",
  "sendRecoveryEmail": "ارسال ایمیل بازیابی"
};
