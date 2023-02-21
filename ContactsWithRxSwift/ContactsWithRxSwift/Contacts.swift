import UIKit
import SnapKit

private class ContactsData {
    let name: String
    init(name: String) {
        self.name = name
    }
}

public class Contacts: UIViewController {
    
    private let tableView: UITableView = .init()
    private let contacts: [ContactsData] = [
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua"),
        ContactsData(name: "Killua")
    ]

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Contacts"
        
        onAddSubviews()
        onConfigureView()
        onSetupConstraints()
    }
    
    private func onConfigureView() {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        tableView.register(TitleCell.self,
                           forCellReuseIdentifier: String(describing: TitleCell.self))
    }

    private func onAddSubviews() {
        view.addSubview(tableView)
    }
    
    private func onSetupConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
extension Contacts: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleCell.self), for: indexPath) as? TitleCell else {
            return TitleCell()
        }
        let contactsData = contacts[indexPath.row]
        let cellData = CellData(title: contactsData.name)
        cell.configure(with: cellData)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

