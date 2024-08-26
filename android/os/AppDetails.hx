package android.os;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end

import lime.system.JNI;

class AppDetails {
     public static function getAppVersionName():Int 
        return JNI.createStaticMethod("org.haxe.extension.Details", "getVersionName", "(Landroid/content/Context;)Ljava/lang/String;");
     public static function getAppName():String 
        return JNI.createStaticMethod("org.haxe.extension.Details", "getVersionCode", "(Landroid/content/Context;)I");       
}