//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import audioplayers
import path_provider_foundation
import sqflite
import wakelock_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AudioplayersPlugin.register(with: registry.registrar(forPlugin: "AudioplayersPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
  WakelockMacosPlugin.register(with: registry.registrar(forPlugin: "WakelockMacosPlugin"))
}
