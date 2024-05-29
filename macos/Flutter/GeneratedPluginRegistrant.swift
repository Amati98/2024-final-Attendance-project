//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import geolocator_apple
import shared_preferences_foundation
import video_player_avfoundation
import wakelock_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  FVPVideoPlayerPlugin.register(with: registry.registrar(forPlugin: "FVPVideoPlayerPlugin"))
  WakelockMacosPlugin.register(with: registry.registrar(forPlugin: "WakelockMacosPlugin"))
}
