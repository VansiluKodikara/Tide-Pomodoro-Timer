import java.util.Properties
import java.io.FileInputStream

// 1. Properly load local.properties from the root project folder
val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.inputStream().use { localProperties.load(it) }
}

val flutterVersionCode = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

plugins {
    id("com.android.application")
    id("kotlin-android")
    // This connects the file to Flutter's internal build tools
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.pomodoro_timer"
    compileSdk = flutter.compileSdkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    // 2. FIXED: Modern way to set jvmTarget (Migrated to compilerOptions)
    kotlinOptions {
        jvmTarget = "17"
    }

    // If you want to remove the warning entirely, use this instead of kotlinOptions:
    /*
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }
    */

    buildFeatures {
        // This fixes the original Firebase Auth error
        buildConfig = true
    }

    defaultConfig {
        applicationId = "com.example.pomodoro_timer"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        // 3. FIXED: Correctly assign versioning
        versionCode = flutterVersionCode.toInt()
        versionName = flutterVersionName
    }
}

flutter {
    source = "../.."
}