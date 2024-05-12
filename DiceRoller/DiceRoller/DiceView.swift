//
//  DiceView.swift
//  DiceRoller
//
//  Created by seven on 2024/5/11.
//

import SwiftUI

struct DiceView: View {
    var numberOfPips: Int = 1
        
    var body: some View {
        Image(systemName: "die.face.\(numberOfPips)")
            .resizable()
            .frame(width: 100, height: 100)
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
