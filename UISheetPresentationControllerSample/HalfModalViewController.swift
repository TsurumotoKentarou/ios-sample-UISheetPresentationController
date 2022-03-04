//
//  HalfModalViewController.swift
//  UISheetPresentationControllerSample
//
//  Created by 鶴本賢太朗 on 2022/03/04.
//

import SwiftUI

struct HalfModalViewController<Sheet: View>: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    @Binding var isShow: Bool
    var sheet: Sheet
    var detents: [UISheetPresentationController.Detent] = [.medium()]
    var onDismiss: () -> Void
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        return UIViewController()
    }
    
    func updateUIViewController(_ viewController: UIViewControllerType, context: Context) {
        if isShow {
            let sheetController = UIHostingController(rootView: sheet)
            sheetController.presentationController!.delegate = context.coordinator
            if let sheetPresentation = sheetController.sheetPresentationController {
                sheetPresentation.detents = detents
                sheetPresentation.prefersGrabberVisible = true
                sheetPresentation.prefersScrollingExpandsWhenScrolledToEdge = false
            }
            viewController.present(sheetController, animated: true)
        } else {
            viewController.dismiss(animated: true) {
                onDismiss()
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    final class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        var parent: HalfModalViewController
        
        init(parent: HalfModalViewController) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.isShow = false
        }
    }
}

