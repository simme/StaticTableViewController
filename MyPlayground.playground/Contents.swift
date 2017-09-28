//: Playground - noun: a place where people can play

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

public final class FeedbackViewController: StaticTableViewController<FeedbackAction> {}


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
