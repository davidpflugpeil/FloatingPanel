import UIKit

protocol PanelTableViewDelegate: UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: PanelTableView)
    func scrollViewWillEndDragging(_ scrollView: PanelTableView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
}

extension PanelTableViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: PanelTableView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) { }
    func scrollViewDidEndScrollingAnimation(_ scrollView: PanelTableView) { }
}

public class PanelTableView: UITableView {
    var panelDelegate: PanelTableViewDelegate?

    public init() {
        super.init(frame: .zero, style: .plain)
        delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

extension PanelTableView: UITableViewDelegate {
    private func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        panelDelegate?.scrollViewDidEndScrollingAnimation(self)
    }

    private func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        panelDelegate?.scrollViewWillEndDragging(self, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
}
