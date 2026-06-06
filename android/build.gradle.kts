import com.android.build.gradle.BaseExtension

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

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

// --- MASTER FIX FOR AGP 8.0+ COMPATIBILITY ---
subprojects {
    // This looks for any subproject (like firebase_auth) using an Android plugin
    plugins.withType<com.android.build.gradle.api.AndroidBasePlugin> {
        configure<BaseExtension> {
            // 1. Fixes the "BuildConfig disabled" error
            buildFeatures.buildConfig = true

            // 2. Fixes the "Namespace not specified" error
            if (namespace == null) {
                namespace = project.group.toString().ifEmpty {
                    "com.example.${project.name.replace("-", "_")}"
                }
            }
        }
    }
}