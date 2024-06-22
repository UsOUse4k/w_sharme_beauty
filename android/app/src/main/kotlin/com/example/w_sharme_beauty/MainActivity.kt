package com.example.w_sharme_beauty

import io.flutter.embedding.android.FlutterActivity 
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine 
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("1c621de5-d2af-4cac-b61d-c9cf0e28ffb4")
        super.configureFlutterEngine(flutterEngine)
    }
}
