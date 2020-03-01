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
    @State var horizontalAlignment: Alignment = Alignment.center
    
    var body: some View {
        ZStack(alignment: .top){
            
            VStack(alignment: getAlignmentValue(userSelectedAlignment: horizontalAlignment)) {
                MyRect(color: .blue)
                    .alignmentGuide(HorizontalAlignment.center) { _ in 10 }
                MyRect(color: .red)
                MyRect(color: .yellow)
            }
            .padding(15)
            .border(Color.black, width: 2)
            .animation(.default)
            
            PresentingVStack(selectedHorizontalAlignmentName: $horizontalAlignment)
                .alignmentGuide(.top) { (viewDimensions) -> CGFloat in
                viewDimensions.height/2
            }
        }
    }
    
    func getAlignmentValue(userSelectedAlignment: Alignment) -> HorizontalAlignment {
        switch userSelectedAlignment {
        case .center:
            return HorizontalAlignment.center
        case .leading:
            return HorizontalAlignment.leading
        case .trailing:
            return HorizontalAlignment.trailing
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
    @Binding var selectedHorizontalAlignmentName: Alignment
    
    var body: some View {
        HStack {
            Text("VStack(")
            //TODO: me text eke meda saha border eka eka mattame thiyenna oona...add picker here
            Picker("", selection: $selectedHorizontalAlignmentName) {
                ForEach(Alignment.allCases, id: \.self) { (element)  in
                    Text(element.rawValue).tag(element)
                }
            }
            .frame(width: 100, height: 30, alignment: .center)
            .clipShape(Rectangle())
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
