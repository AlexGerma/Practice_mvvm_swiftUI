//
//  DropDownMenu.swift
//  MVVMpractice
//
//  Created by Alexis German Hurtado on 02/04/20.
//  Copyright © 2020 Alexis German Hurtado. All rights reserved.
//

import Foundation
import SwiftUI

struct DropdownOption: Hashable {
    static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.val == rhs.val
    }

    var key: Int
    var val: String
}


struct DropdownOptionElement: View {
    var val: String
    var key: Int
    var onSelect: ((_ value: String,_ key: Int) -> Void)?
    var fontSize: CGFloat
    var body: some View {
        Button(action: {
            if let onSelect = self.onSelect {
                onSelect(self.val, self.key)
            }
        }) {
            VStack {
                HStack {
                    Text(self.val).foregroundColor(Color.black).font(Font.system(size: fontSize))
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    var onSelect: ((_ value: String,_ key: Int) -> Void)?
     var fontSize: CGFloat
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.options, id: \.self) { option in
                DropdownOptionElement(val: option.val, key: option.key, onSelect: self.onSelect, fontSize: self.fontSize)
            }
        }
        .background(Rectangle().fill(Color.white).shadow(color: .gray, radius: 5,x: 5, y: 5))
        .overlay(
            Rectangle()
                .stroke(Color.white, lineWidth: 1)
        ).frame(width: 300)
    }
}

struct DropdownButton: View {
    @State var shouldShowDropdown = false
    @State var displayText: String = ""
    var options: [DropdownOption]
    var onSelect: ((_ value: String,_ key: Int) -> Void)?
    var buttonHeight: CGFloat
    var fontSize: CGFloat
    var fontColor: Color? = Color.black
    var iconColor: Color? = Color.black
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(displayText).foregroundColor(fontColor).font(Font.system(size: fontSize))
                Spacer()
                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill").foregroundColor(iconColor)
            }
        }
        .padding(.horizontal)
        .frame(height: self.buttonHeight)
        .background(Color.white)
        .cornerRadius(30)
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: 0)
                    Dropdown(options: self.options, onSelect: { value, key in
                        self.onSelect!(value, key)
                        self.shouldShowDropdown.toggle()
                        self.displayText = value
                    }, fontSize: self.fontSize)
                }
            }, alignment: .topLeading
        )
    }

}

struct DropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
         DropdownButton(displayText: "Test", options: [ DropdownOption(key: 1, val: "This week"), DropdownOption(key: 2, val: "This month"), DropdownOption(key: 3, val: "This year")], buttonHeight: 60, fontSize: 13)
    }
}
