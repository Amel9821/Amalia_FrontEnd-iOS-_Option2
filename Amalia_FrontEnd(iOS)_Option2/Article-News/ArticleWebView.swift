//
//  ArticleWebView.swift
//  Amalia_FrontEnd(iOS)_Option2
//
//  Created by Amalia . on 28/08/23.
//

import UIKit
import WebKit
import Alamofire

class ArticleWebView: UIViewController, WKNavigationDelegate {

    let webView = WKWebView()
    let isAllowZoom: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        setNav()
        self.updateUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        webView.frame = view.bounds
    }
    
    func setNav() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .white
        
        let customView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth - (screenWidth/3), height: 60.0))
        let tapGestureback = UITapGestureRecognizer(target: self, action: #selector(viewTapped(tapGestureRecognizer:)))
        customView.isUserInteractionEnabled = true
        customView.addGestureRecognizer(tapGestureback)
        
        let button = UIButton.init(type: .custom)
        button.setBackgroundImage(.init(systemName: "chevron.backward.circle.fill"), for: .normal)
        button.frame = CGRect(x: 0.0, y: 13, width: 20.0, height: 20.0)
        button.addTarget(self, action: #selector(menuBack), for: .touchUpInside)
        customView.addSubview(button)
        
        let label_nav = UILabel(frame: CGRect(x: 40, y: 8, width: screenWidth - (screenWidth/3), height: 30.0))
        label_nav.text = "News Preview"
        label_nav.textColor = UIColor.black
        label_nav.textAlignment = .left
        label_nav.font = .boldSystemFont(ofSize: 18)
        customView.addSubview(label_nav)
        
        let leftButton = UIBarButtonItem(customView: customView)
        self.navigationItem.leftBarButtonItem = leftButton
        
    }
    
    func updateUI() {
        view.addSubview(webView)
        guard let url = URL(string: globalURLArticles)
        else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if(isAllowZoom){
          let javascript = "var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=0.7, minimum-scale= 0.7, maximum-scale=3.0, user-scalable=yes');document.getElementsByTagName('head')[0].appendChild(meta);"
            webView.evaluateJavaScript(javascript, completionHandler: nil)
        }
        else
        {
             let javascript = "var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');document.getElementsByTagName('head')[0].appendChild(meta);"
            webView.evaluateJavaScript(javascript, completionHandler: nil)
        }
    }
    
    @objc func viewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func menuBack() {
        navigationController?.popViewController(animated: true)
    }


}
