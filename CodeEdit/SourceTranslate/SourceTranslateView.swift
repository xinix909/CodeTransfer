//
//  SourceTranslateView.swift
//  CodeEdit
//
//  Created by 蒋聪 on 2024/9/6.
//

import SwiftUI
import CodeEditSourceEditor

struct SourceTranslateView: View {

    @ObservedObject private var themeModel: ThemeModel = .shared
    private var currentTheme: Theme {
        themeModel.selectedTheme ?? themeModel.themes.first!
    }
 
    @State var code = ""
    @State var font = NSFont.monospacedSystemFont(ofSize: 11, weight: .regular)
    @State var tabWidth = 4
    @State var lineHeight = 1.2
    @State var editorOverscroll = 0.3
    @State private var cursorPositions: [CursorPosition] = []

    var body: some View {
        HStack {
            CodeEditSourceEditor($code,
                                 language: .objc,
                                 theme: currentTheme.editor.editorTheme,
                                 font: font,
                                 tabWidth: tabWidth,
                                 lineHeight: lineHeight,
                                 wrapLines: true,
                                 cursorPositions: $cursorPositions)
        }
    }
}

#Preview {
    SourceTranslateView()
}
