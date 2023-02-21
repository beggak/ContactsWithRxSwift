import UIKit
import SnapKit

public class TitleCell: Cell<CellData> {
        
    internal let titleLabel: UILabel = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func onConfigureView() {
        titleLabel.text = "Title"
        titleLabel.font = .systemFont(ofSize: 16)
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    open override func configure(with data: CellData) {
        titleLabel.text = data.title
    }
    
    public override func onAddSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    public override func setupConstraints() {
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(8)
            $0.right.equalTo(contentView.snp.right).offset(-8)
            $0.top.equalTo(contentView.snp.top).offset(16)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-16)
        }
    }
}
