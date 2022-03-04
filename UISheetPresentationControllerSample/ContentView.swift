//
//  ContentView.swift
//  UISheetPresentationControllerSample
//
//  Created by 鶴本賢太朗 on 2022/03/04.
//

import SwiftUI

struct ContentView: View {
    @State var isShowLarge: Bool = false
    
    @State var isShowMedium: Bool = false
    
    @State var isShowLargeAndMedium: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                isShowLarge = true
            } label: {
                Text("Large Only")
            }
            .halfModal(isShow: $isShowLarge, detents: [.large()]) {
                Text("Large")
            } onDismiss: {
    
            }
            
            Button {
                isShowMedium = true
            } label: {
                Text("Medium Only")
            }
            .halfModal(isShow: $isShowMedium, detents: [.medium()]) {
                Text("Medium")
            } onDismiss: {
                
            }
            
            Button {
                isShowLargeAndMedium = true
            } label: {
                Text("Large and Medium")
            }
            .halfModal(isShow: $isShowLargeAndMedium, detents: [.large(), .medium()]) {
                Text("Large and Medium")
            } onDismiss: {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
