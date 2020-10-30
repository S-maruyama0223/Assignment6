//
//  ViewController.swift
//  Assignment6
//
//  Created by 丸山翔太郎 on 2020/10/30.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var randomNumLabel: UILabel!
    private var randomNum:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.maximumValue = 100
        resetGame()
    }
    
    @IBAction func tapJudgeButton(_ sender: Any){
        //判定処理は他から呼ばれる必要がないのでネスト
        func judge() ->String{
            if(Int(slider.value) == randomNum){
                return "正解!\nあなたの値:\(Int(slider.value))"
            }else{
                return "残念!\nあなたの値:\(Int(slider.value))"
            }
        }
        let dialog = UIAlertController(title: "結果", message: judge(), preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "再挑戦",
                                       style: .default,
                                       handler: {(alert: UIAlertAction!) in self.resetGame()}))
        self.present(dialog, animated: true, completion: nil)
    }
    
    private func resetGame(){
        slider.value = 50
        randomNum = Int.random(in: 0...100)
        randomNumLabel.text = String(randomNum)
    }

}

