//
//  TabMenuView.swift
//  BlogClient
//
//  Created by LongMac on 2020/5/17.
//  Copyright © 2020 LongMac. All rights reserved.
//

import UIKit


protocol TabMenuViewDelegate: NSObjectProtocol {
    
}

protocol TabMenuItemProtocol {
    var title: String { get }
}

class TabMenuView: UIBaseView {
    weak var delegate: TabMenuViewDelegate?
    
    var scrollView: UIScrollView!
    var containerView: UIView!
    var selectedIndex: Int = 0
    
    
    lazy var markView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.red_F15A43()
        view.lc.addCorner(1.5)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - InitViewProtocol
extension TabMenuView: InitViewProtocol {
    func initView() {
        scrollView = UIScrollView.lc.initScrollView(frame: CGRect.zero, delegate: self, showIndicator: false)
        self.addSubview(scrollView)
    
        containerView = UIView()
        containerView.backgroundColor = R.color.white_FFFFFF()
        scrollView.addSubview(containerView)
    }
    
    func autoLayoutView() {
        scrollView.mas_makeConstraints { (make) in
            make?.leading.trailing()?.top()?.bottom()?.mas_equalTo()(self)?.offset()(0)
        }
        containerView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(scrollView)?.offset()(0)
        }
    }
}

// MARK: - UIScrollViewDelegate
extension TabMenuView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

// MARK: - Public Method
extension TabMenuView {
    func loadTabMenu(datas: [TabMenuItemProtocol], selectedIndex: Int) {
        if datas.count <= 0  { return }
        self.selectedIndex = selectedIndex
        
        var previous: UIView?
        for index: Int in 0..<datas.count {
            let itemModel = datas.lc.objectAtIndex(index) as! TabMenuItemProtocol
            let itemButton = UIButton.lc.initButton(frame: CGRect.zero, title: itemModel.title, font: R.font.stHeitiSCMedium(size: 12), titleColor: R.color.black_444444())
            itemButton.addTarget(self, action: #selector(selectItemAction(_:)), for: .touchUpInside)
            containerView.addSubview(itemButton)
            
            let width = itemModel.title.lc.stringWidth(font: R.font.stHeitiSCMedium(size: 12), maxWidth: self.lc.width)
            itemButton.mas_makeConstraints { (make) in
                if let preView = previous {
                    make?.leading.mas_equalTo()(preView.mas_trailing)?.offset()(20)
                } else {
                    make?.leading.mas_equalTo()(containerView)?.offset()(20)
                }
                make?.top.bottom()?.mas_equalTo()(containerView)?.offset()(0)
                make?.width.mas_equalTo()(width)
            }
            previous = itemButton
            
            if index == selectedIndex {
                addBottomLineMark(itemButton: itemButton)
            }
        }
        
        if let preView = previous {
            containerView.mas_updateConstraints { (make) in
                make?.trailing.mas_equalTo()(preView.mas_trailing)?.offset()(20)
            }
        }
    }
    
    @objc func selectItemAction(_ itemButton: UIButton) {
        log("selectItemAction")
    }
}

// MARK: - Private Method
extension TabMenuView {
    func addBottomLineMark(itemButton: UIButton) {
        self.addSubview(markView)
        markView.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(itemButton.mas_centerX)?.offset()(0)
            make?.bottom.mas_equalTo()(self)?.offset()(0)
            make?.width.mas_equalTo()(12)
            make?.height.mas_equalTo()(3)
        }
    }
}

