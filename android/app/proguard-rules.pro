# Add any specific rules you need here
# For example, to keep all classes in a specific package:
# -keep class com.example.myapp.** { *; }

# Flutter specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.** { *; }
-keep class androidx.lifecycle.DefaultLifecycleObserver
-keepclassmembers class * {
    @androidx.lifecycle.OnLifecycleEvent *;
}