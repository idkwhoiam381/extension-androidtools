package;

import lime.system.JNI;

class AppDetails {
    public static function getAppVersionName():String {
        return JNI.createStaticMethod("android/content/pm/PackageManager", "getPackageInfo", "(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;", true).call(["your.package.name", 0].map(String));
    }

    public static function getAppPackageName():String {
        var context = JNI.createStaticMethod("android/app/Activity", "getPackageName", "()Ljava/lang/String;", false);
        return context.call();
    }

    public static function getAppName():String {
        // Get PackageInfo for our app
        var packageInfo = JNI.createStaticMethod("android/content/pm/PackageManager", "getPackageInfo", "(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;", true).call(["your.package.name", 0].map(String));

        // Get application info from PackageInfo
        var appInfo = JNI.createMemberField("android/content/pm/PackageInfo", "applicationInfo", "Landroid/content/pm/ApplicationInfo;", true);

        // Get label resource ID from ApplicationInfo
        var labelResId = JNI.createMemberField("android/content/pm/ApplicationInfo", "labelRes", "I", true);

        // Get label string resource
        var labelString = JNI.createStaticMethod("android/content/res/Resources", "getString", "(I)Ljava/lang/String;", false).call([labelResId].map(String));

        return labelString;
    }
}