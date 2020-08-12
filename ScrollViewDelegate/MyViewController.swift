//
//  MyViewController.swift
//  ScrollViewDelegate
//
//  Created by 李世文 on 2020/8/10.
//

import UIKit

class MyViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet var scrollViews: [UIScrollView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for scrollView in scrollViews {
            scrollView.delegate = self
        }
    }
    
    //scrollView停止滑動的時候觸發
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //scrollView目前滑動到的位置的x除以scrollView的寬，得到目前第幾頁
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        imagePageControl.currentPage = Int(page)
    }
    
    //放大縮小時候觸發
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //返回scrollview裡頭的元件
        return scrollView.subviews[0]
    }

    //點擊pageControl時候觸發
    @IBAction func changePage(_ sender: UIPageControl) {
        //scrollView的x座標乘上第幾個原點，就可以得到畫面要移動到的point
        let point = CGPoint(x: imageScrollView.bounds.width * CGFloat(sender.currentPage), y: 0)
        imageScrollView.setContentOffset(point, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

