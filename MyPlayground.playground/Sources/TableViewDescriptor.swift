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
