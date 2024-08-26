package org.haxe.extension;

import org.haxe.extension.Extension;

import android.content.Context;
import android.content.pm.PackageManager;

public class Details extends Extension {

    public static String getVersionName() {
        try {
            return mainContext.getPackageManager().getPackageInfo(mainContext.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            throw new RuntimeException("Could not get version name", e);
        }
    }

    public static int getVersionCode() {
        try {
            return mainContext.getPackageManager().getPackageInfo(mainContext.getPackageName(), 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            throw new RuntimeException("Could not get version code", e);
        }
    }
}