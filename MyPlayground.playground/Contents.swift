/**
 Copyright (c) 2017 Simon Ljungberg

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import PlaygroundSupport
import Foundation
import UIKit

public enum FeedbackAction: TableViewDescriptor {
    case email
    case rate
    case tellFriend

    public static var layout: [[FeedbackAction]] {
        return [
            [
                .email,
                .rate,
            ],
            [
                .tellFriend
            ]
        ]
    }

    public static var sectionHeaders: [Int : String]? = [
        0: "We'd love to hear from you"
    ]
    public static var sectionFooters: [Int: String]? = [
        0: "For support errands it is easier for us to help via email.",
        1: "Tell a friend about this app by sending them a link via text or email."
    ]

    public var icon: UIImage? {
        switch self {
        case .email: return "💌".image()
        case .rate: return "🌟".image()
        case .tellFriend: return "💏".image()
        }
    }

    public var label: String {
        switch self {
        case .email: return "Personal Feedback"
        case .rate: return "Rate us"
        case .tellFriend: return "Tell a Friend"
        }
    }

    public var detailLabel: String? {
        switch self {
        case .email: return "Email"
        case .rate: return "App Store"
        default: return nil
        }
    }
}

let vc = StaticTableViewController<FeedbackAction>(style: .grouped)
vc.title = "Send Feedback"
vc.selectionCallback = { action, vc in
    if let indexPath = vc.tableView.indexPathForSelectedRow {
        vc.tableView.deselectRow(at: indexPath, animated: true)
    }
    print(action)
}
let nav = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = nav.view
