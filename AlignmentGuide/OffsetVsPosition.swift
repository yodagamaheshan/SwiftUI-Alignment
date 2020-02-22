//
//  OffsetVsPosition.swift
//  AlignmentGuide
//
//  Created by Heshan Yodagama on 2/22/20.
//  Copyright © 2020 Heshan Yodagama. All rights reserved.
//

import SwiftUI

struct OffsetVsPosition: View {
    var body: some View {
        Text("Hello, World!")
            .position(x: 100, y: 100)
            .background(Color.red)
    }
}

struct OffsetVsPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffsetVsPosition()
    }
}
