//
//  ViewController.swift
//  EasySideMenu
//
//  Created by iostienvv on 03/28/2024.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rootView = SwiftUIRootView()

        let hostingView = UIHostingController(rootView: rootView)

        let swiftUIView = hostingView.view ?? UIView()
        swiftUIView.translatesAutoresizingMaskIntoConstraints = false

        addChild(hostingView)
        view.addSubview(swiftUIView)

        // Create and activate the constraints for the swiftui's view.
        NSLayoutConstraint.activate([
            swiftUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftUIView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            swiftUIView.widthAnchor.constraint(equalToConstant: view.frame.width),
            swiftUIView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])

        hostingView.didMove(toParent: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

