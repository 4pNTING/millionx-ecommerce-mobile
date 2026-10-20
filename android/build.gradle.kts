plugins {
    id("org.jetbrains.kotlin.android") version "2.3.20" apply false
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
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
        val javaTaskName = name.replace("Kotlin", "JavaWithJavac")
        val javaCompile = tasks.named<org.gradle.api.tasks.compile.JavaCompile>(javaTaskName)
        compilerOptions.jvmTarget.set(
            javaCompile.map {
                org.jetbrains.kotlin.gradle.dsl.JvmTarget.fromTarget(it.targetCompatibility)
            },
        )
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
