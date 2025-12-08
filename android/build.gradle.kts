import com.android.build.gradle.BaseExtension

plugins {
    id("com.android.application") apply false
    id("org.jetbrains.kotlin.android") apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// --- SDK OVERRIDE LOGIC (MUST BE FIRST) ---
subprojects {
    // 1. Force dependencies immediately (fixes lStar / splash screen crashes)
    project.configurations.all {
        resolutionStrategy {
            force("androidx.core:core-ktx:1.13.1")
            force("androidx.core:core:1.13.1")
            force("androidx.core:core-splashscreen:1.0.1")
        }
    }

    // 2. Force Compile SDK to 36 safely
    // We check if the project is ALREADY evaluated. If so, we configure immediately.
    // If not, we use afterEvaluate. This handles both race conditions.
    fun configureSdk() {
        if (plugins.hasPlugin("com.android.library") || plugins.hasPlugin("com.android.application")) {
            extensions.configure<BaseExtension> {
                compileSdkVersion(36)
                defaultConfig {
                    targetSdkVersion(36)
                }
            }
        }
    }

    if (state.executed) {
        configureSdk()
    } else {
        afterEvaluate {
            configureSdk()
        }
    }
}
// ------------------------------------------

// --- EVALUATION DEPENDENCY (MUST BE LAST) ---
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}