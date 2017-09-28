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
