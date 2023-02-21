import UIKit
import SnapKit
import RxSwift
import RxCocoa

private class ContactsData {
    let name: String
    init(name: String) {
        self.name = name
    }
}

public class Contacts: UIViewController {
    
    private let tableView: UITableView = .init()
    private let contactsData = Observable.just([
        ContactsData(name: "Killua"),
        ContactsData(name: "Gon"),
        ContactsData(name: "Mickey"),
        ContactsData(name: "Badji"),
        ContactsData(name: "Chifuya"),
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
    ])
    
    let disposeBag = DisposeBag()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Contacts"
        
        onAddSubviews()
        onConfigureTableView()
        onConfigureView()
        onSetupConstraints()
    }
    
    private func onConfigureView() {
        
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

extension Contacts {
    private func onConfigureTableView() {
        tableView.backgroundColor = .clear
        tableView.register(TitleCell.self,
                           forCellReuseIdentifier: String(describing: TitleCell.self))
        
        contactsData.bind(to: tableView.rx.items) { tableView, row, contact in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleCell.self)) as? TitleCell else {
                return TitleCell()
            }
            let cellData = CellData(title: contact.name)
            cell.configure(with: cellData)
            return cell
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(ContactsData.self).subscribe {
            print("You selected: \($0)")
        }.disposed(by: disposeBag)
        
    }
}
