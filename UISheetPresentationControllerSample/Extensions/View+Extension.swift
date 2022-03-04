//
//  View+Extension.swift
//  UISheetPresentationControllerSample
//
//  Created by 鶴本賢太朗 on 2022/03/04.
//

import SwiftUI

extension View {
    func halfModal<Sheet: View>(
        isShow: Binding<Bool>,
        detents: [UISheetPresentationController.Detent] = [.medium()],
        @ViewBuilder sheet: @escaping () -> Sheet,
        onDismiss: @escaping () -> ()) -> some View {
        return self
            .background(
                HalfModalViewController(
                    isShow: isShow,
                    sheet: sheet(),
                    detents: detents,
                    onDismiss: onDismiss))
    }
}
