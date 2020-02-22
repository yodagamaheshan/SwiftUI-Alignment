//
//  ContentView.swift
//  AlignmentGuide
//
//  Created by Heshan Yodagama on 2/19/20.
//  Copyright © 2020 Heshan Yodagama. All rights reserved.
//

import SwiftUI

enum Alignment: String, CaseIterable{
    case leading = ".leading"
    case center = ".center"
    case trailing = ".trailing"
}

struct ContentView: View {
    @State var horizontalAlignmentName: String = Alignment.center.rawValue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            PresentingVStack(selectedHorizontalAlignmentName: $horizontalAlignmentName)
                .zIndex(1)
                .offset(x: 16, y: 10)
            
            VStack {
                MyRect(color: .blue)
                MyRect(color: .red)
                MyRect(color: .yellow)
            }
                .padding(15)
                .border(Color.black, width: 2)
        }
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

struct PresentingVStack: View {
    @Binding var selectedHorizontalAlignmentName: String
    
    var body: some View {
        HStack {
            Text("VStack(")
            //TODO: me text eke meda saha border eka eka mattame thiyenna oona...add picker here
            
            Text(")")
        }
        .background(StackBackground())
    }
}

struct StackBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
    }
}
