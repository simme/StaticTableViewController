import UIKit

public protocol TableViewDescriptor {
    var icon: UIImage? { get }
    var label: String { get }
    var detailLabel: String? { get }
    static var layout: [[Self]] { get }
    init(indexPath: IndexPath)
    func configure(cell: UITableViewCell)

    static var sectionHeaders: [Int: String]? { get }
    static var sectionFooters: [Int: String]? { get }
}

extension TableViewDescriptor {

    public init(indexPath: IndexPath) {
        self = Self.layout[indexPath.section][indexPath.row]
    }

    public func configure(cell: UITableViewCell) {
        cell.textLabel?.text = self.label
        cell.imageView?.image = self.icon
        cell.detailTextLabel?.text = self.detailLabel
    }
}
