//
//  AccessibilityExamplesDataSource.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 07/04/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

enum AccessibilityExamplesDataSource: Int, CaseIterable {
    case accessibilityLabels
    case accessibilityValues
    case accessibilityElements
    case customActions
    case performEscape
    case notifications
    case dynamicTypeAdaptiveUI
    case dynamicTypeAlternativeUI
    case smartInvertColours
    case largeContentViewer
    case switchVoiceOver
    case web

    func viewController() -> UIViewController {
        let viewController: UIViewController

        switch self {
        case .accessibilityLabels: viewController = AccessibilityLabelsViewController()
        case .accessibilityValues: viewController = AccessibilityValuesViewController()
        case .accessibilityElements: viewController = AccessibilityElementsViewController()
        case .customActions: viewController = CustomActionsViewController()
        case .performEscape: viewController = PerformEscapeViewController()
        case .notifications: viewController = AccessibilityNotificationsViewController()
        case .dynamicTypeAdaptiveUI: viewController = DynamicTypesAdaptiveUIViewController()
        case .dynamicTypeAlternativeUI: viewController = DynamicTypesAlternativeUIViewController()
        case .smartInvertColours: viewController = SmartInvertedColorsViewController()
        case .largeContentViewer: viewController = LargeContentViewerViewController()
        case .switchVoiceOver: viewController = SwitchTableViewController()
        case .web: viewController = WebViewController()
        }

        viewController.title = title()

        return viewController
    }

    func title() -> String {
        switch self {
        case .accessibilityLabels: return NSLocalizedString("accessibilityLabels", bundle: .main, comment: "")
        case .accessibilityValues: return NSLocalizedString("adjustTraitValues", bundle: .main, comment: "")
        case .accessibilityElements: return NSLocalizedString("accessibilityElements", bundle: .main, comment: "")
        case .customActions: return NSLocalizedString("customActions", bundle: .main, comment: "")
        case .performEscape: return NSLocalizedString("performZEscapeGesture", bundle: .main, comment: "")
        case .notifications: return NSLocalizedString("accessibilityNotifications", bundle: .main, comment: "")
        case .dynamicTypeAdaptiveUI: return NSLocalizedString("dynamicTypeAdaptiveUI", bundle: .main, comment: "")
        case .dynamicTypeAlternativeUI: return NSLocalizedString("dynamicTypeAlternativeUI", bundle: .main, comment: "")
        case .smartInvertColours: return NSLocalizedString("smartInvertColors", bundle: .main, comment: "")
        case .largeContentViewer: return NSLocalizedString("largeContentViewer", bundle: .main, comment: "")
        case .switchVoiceOver: return NSLocalizedString("uiSwitch", bundle: .main, comment: "")
        case .web: return NSLocalizedString("dynamicTypeInWebViews", bundle: .main, comment: "")
        }
    }
}
