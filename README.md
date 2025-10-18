Project Name
This project is an Application(Nextgen App). It is built using Flutter and requires the following dependencies and environment settings to run successfully.

Requirements
To ensure the project runs successfully, make sure the following tools and versions are installed:

Flutter SDK: 3.22.2 (flutter --version Flutter 3.22.2 • channel stable • https://github.com/flutter/flutter.git Framework • revision 761747bfc5 (8 months ago) • 2024-06-05 22:15:13 +0200
Engine • revision edd8546116 Tools • Dart 3.4.3 • DevTools 2.34.3)
Dart SDK: 3.4.3 (dart --version Dart SDK version: 3.4.3 (stable) (Tue Jun 4 19:51:39 2024 +0000) on "windows_x64")
Android Studio: Android Studio Koala | 2024.1.1 Patch 1 Build #AI-241.18034.62.2411.12071903, built on July 11, 2024 Runtime version: 17.0.11+0--11852314 amd64 VM: OpenJDK 64-Bit Server VM by JetBrains s.r.o. Windows 11.0 GC: G1 Young Generation, G1 Old Generation Memory: 2048M Cores: 8 Registry: ide.experimental.ui=true Non-Bundled Plugins: Dart (241.18808) io.flutter (80.0.2)

Gradle Version: 7.6.3

Android Gradle Plugin (AGP): 7.3.0
Java: JDK 11 or 17
Setup Instructions
Clone the repository:

git clone <repository-url>
cd <repository-directory>
Ensure you have the correct Flutter version installed:

flutter --version
If not, install the correct version using FVM or Flutter installation guide.
Install project dependencies:

flutter pub get
Clean the project to avoid conflicts:

flutter clean
Connect a physical device or start an emulator.

Run the project:

flutter run
Key Configurations
pubspec.lock: Locks dependency versions to ensure consistency across environments.
gradle-wrapper.properties: Ensures the Gradle version is 7.6.3. Example:
distributionUrl=https\://services.gradle.org/distributions/gradle-7.6.3-all.zip
android/build.gradle: Locks the Android Gradle Plugin (AGP) version to 7.3.0.
Note: Do not modify these files unless necessary to maintain compatibility.
Flutter Doctor Output
For reference, ensure your setup matches the following output:

[✓] Flutter (Channel stable, 3.10.5, on macOS 12.6)
[✓] Android toolchain - develop for Android devices
[✓] Android Studio (version 2022.1)
[✓] Connected device
Common Issues and Fixes
1. Gradle Build Errors
Ensure your gradle-wrapper.properties file matches the locked version:
distributionUrl=https\://services.gradle.org/distributions/gradle-7.6.3-all.zip
2. Dependency Mismatches
Run flutter clean and then flutter pub get to resolve dependency conflicts.
3. Missing SDK
Install the correct version of Flutter using FVM:
fvm use 3.10.5
Where to Check Versions and Configurations
Flutter SDK Version:

flutter --version
Dart SDK Version:

dart --version
Gradle Version: Check gradle-wrapper.properties:

distributionUrl=https\://services.gradle.org/distributions/gradle-7.6.3-all.zip
Android Gradle Plugin (AGP) Version: Check android/build.gradle:

classpath 'com.android.tools.build:gradle:7.3.0'
Java Version:

java --version
Installed Dependencies: Check pubspec.lock for exact dependency versions.

How to Ensure Consistency Across Teams
Share this README.md file in your repository.
Commit and push pubspec.lock to lock dependency versions.
Add local.properties to .gitignore:
# Android local configuration
local.properties
Use version management tools like FVM to manage Flutter versions.
Ensure all teammates follow the setup instructions strictly.
