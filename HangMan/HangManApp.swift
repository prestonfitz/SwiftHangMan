//
//  HangManApp.swift
//  HangMan
//
//  Created by IS 543 on 12/16/24.
//

import SwiftUI

@main
struct HangManApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
