import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("development") {
            dimension = "flavor-type"
            applicationId = "com.example.flutter_env_flavor.dev"
            resValue(type = "string", name = "app_name", value = "Flutter Dev App")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.example.flutter_env_flavor.staging"
            resValue(type = "string", name = "app_name", value = "Flutter Staging App")
        }
        create("production") {
            dimension = "flavor-type"
            applicationId = "com.example.flutter_env_flavor"
            resValue(type = "string", name = "app_name", value = "Flutter App")
        }
    }
}