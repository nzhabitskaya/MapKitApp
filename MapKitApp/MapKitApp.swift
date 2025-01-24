//
//  MapKitAppApp.swift
//  MapKitApp
//
//  Created by Natalia on 1/23/25.
//

import SwiftUI

@main
struct MapKitApp: App {
    
    @StateObject private var vm = LocationViewModel()

        var body: some Scene {
            WindowGroup {
                MapView()
                    .environmentObject(vm)
            }
        }
    }
