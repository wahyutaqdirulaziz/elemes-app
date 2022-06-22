Build an APK
Although app bundles are preferred over APKs, there are stores that don’t yet support app bundles. In this case, build a release APK for each target ABI (Application Binary Interface).

If you completed the signing steps, the APK will be signed. At this point, you might consider obfuscating your Dart code to make it more difficult to reverse engineer. Obfuscating your code involves adding a couple flags to your build command.

From the command line:

1 . Enter cd [project]
2 . Run flutter build apk --split-per-abi
(The flutter build command defaults to --release.)
This command results in three APK files:

-[project]/build/app/outputs/apk/release/app-armeabi-v7a-release.apk
-[project]/build/app/outputs/apk/release/app-arm64-v8a-release.apk
-[project]/build/app/outputs/apk/release/app-x86_64-release.apk
Removing the --split-per-abi flag results in a fat APK that contains your code compiled for all the target ABIs. Such APKs are larger in size than their split counterparts, causing the user to download native binaries that are not applicable to their device’s architecture.

