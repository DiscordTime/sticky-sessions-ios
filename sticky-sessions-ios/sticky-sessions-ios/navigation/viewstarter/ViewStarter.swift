//
//  ViewStarter.swift
//  sticky-sessions-ios
//
//  Created by Temp on 28/11/18.
//  Copyright © 2018 DiscordTime. All rights reserved.
//

import UIKit

class ViewStarter: ViewStarterProtocol {
    
    func show(route: Route?, navigation: UINavigationController?) {
        if let name = route?.storyboardName, let viewControllerId = route?.viewControllerId {
            let storyboard = UIStoryboard(name: name, bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerId)
            navigation?.pushViewController(viewController, animated: true)
        }
    }
}
