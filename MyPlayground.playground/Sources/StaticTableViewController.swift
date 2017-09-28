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

open class StaticTableViewController<Descriptor: TableViewDescriptor>: UITableViewController {

    open var selectionCallback: ((Descriptor, StaticTableViewController) -> Void)?

    // MARK: Data Source

    override open func numberOfSections(in tableView: UITableView) -> Int {
        return Descriptor.layout.count
    }

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Descriptor.layout[section].count
    }

    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let action = Descriptor(indexPath: indexPath)
        action.configure(cell: cell)
        return cell
    }

    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Descriptor.sectionHeaders?[section]
    }

    override open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return Descriptor.sectionFooters?[section]
    }

    // MARK: Delegate

    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectionCallback?(Descriptor(indexPath: indexPath), self)
    }
    
}
