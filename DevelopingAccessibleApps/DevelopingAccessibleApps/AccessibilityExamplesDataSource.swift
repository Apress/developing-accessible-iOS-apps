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
        case .accessibilityLabels: return NSLocalizedString("accessibilityLabels", comment: "")
        case .accessibilityValues: return NSLocalizedString("adjustTraitValues", comment: "")
        case .accessibilityElements: return NSLocalizedString("accessibilityElements", comment: "")
        case .customActions: return NSLocalizedString("customActions", comment: "")
        case .performEscape: return NSLocalizedString("performZEscapeGesture", comment: "")
        case .notifications: return NSLocalizedString("accessibilityNotifications", comment: "")
        case .dynamicTypeAdaptiveUI: return NSLocalizedString("dynamicTypeAdaptiveUI", comment: "")
        case .dynamicTypeAlternativeUI: return NSLocalizedString("dynamicTypeAlternativeUI", comment: "")
        case .smartInvertColours: return NSLocalizedString("smartInvertColors", comment: "")
        case .largeContentViewer: return NSLocalizedString("largeContentViewer", comment: "")
        case .switchVoiceOver: return NSLocalizedString("uiSwitch", comment: "")
        case .web: return NSLocalizedString("dynamicTypeInWebViews", comment: "")
        }
    }
}
