//
//  View+Extensions.swift
//  GreenGarden
//
//  Created by Mohammad Azam on 7/6/21.
//

import Foundation

import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
