package com.example.w_sharme_beauty

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity 
import io.flutter.embedding.engine.FlutterEngine 
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("f906bf57-b0ed-48a8-a695-c54ea91e962b")
        super.configureFlutterEngine(flutterEngine)
    }
}
