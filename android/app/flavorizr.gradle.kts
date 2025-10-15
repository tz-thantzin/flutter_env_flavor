import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.env.dev"
            resValue(type = "string", name = "app_name", value = "Flutter Dev App")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.env.staging"
            resValue(type = "string", name = "app_name", value = "Flutter Staging App")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.env"
            resValue(type = "string", name = "app_name", value = "Flutter App")
        }
    }
}