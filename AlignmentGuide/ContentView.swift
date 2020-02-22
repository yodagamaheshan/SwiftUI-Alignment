//
//  ContentView.swift
//  AlignmentGuide
//
//  Created by Heshan Yodagama on 2/19/20.
//  Copyright © 2020 Heshan Yodagama. All rights reserved.
//

import SwiftUI

enum Alignment{
    case leading
    case center
    case trailing
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyRect: View {
    let color: Color
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14).frame(width: 200, height: 50)
        .foregroundColor(color)
    }
}
