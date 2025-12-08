plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.flutter_demo"
    compileSdk = 36  // KEEPING 36 AS REQUESTED

    defaultConfig {
        applicationId = "com.example.flutter_demo"
        minSdk = flutter.minSdkVersion
        targetSdk = 36  // KEEPING 36 AS REQUESTED
        versionCode = 1
        versionName = "1.0.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// --- ADD THIS BLOCK TO FIX SDK 36 COMPATIBILITY ---
dependencies {
    // Fixes "lStar not found" by forcing a newer Core library compatible with SDK 36
    implementation("androidx.core:core-ktx:1.13.1")

    // Fixes "windowSplashScreen" errors by providing the missing splash definitions
    implementation("androidx.core:core-splashscreen:1.0.1")
}