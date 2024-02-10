//
//  ViewController.swift
//  XO game
//
//  Created by Apple on 01/02/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var player: Int=1
    var  arrayState = [0,0,0,0,0,0,0,0,0]
    var winningIndexes = [[0,1,2], [3,4,5], [6,7,8],[0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6]]
    var gameIsActive: Bool=true
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var pos1: UIButton!
    
    @IBOutlet weak var pos2: UIButton!
    
    @IBOutlet weak var pos3: UIButton!
    
    @IBOutlet weak var pos4: UIButton!
    
    @IBOutlet weak var pos5: UIButton!
    
    @IBOutlet weak var pos6: UIButton!
    
    @IBOutlet weak var pos7: UIButton!
    
    @IBOutlet weak var pos8: UIButton!
    
    @IBOutlet weak var pos9: UIButton!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        selectPos(button: sender)
    }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        resetGame()
    }
    
    func resetGame() {
        pos1.setImage(nil, for: UIControl.State.normal)
        pos2.setImage(nil, for: UIControl.State.normal)
        pos3.setImage(nil, for: UIControl.State.normal)
        pos4.setImage(nil, for: UIControl.State.normal)
        pos5.setImage(nil, for: UIControl.State.normal)
        pos6.setImage(nil, for: UIControl.State.normal)
        pos7.setImage(nil, for: UIControl.State.normal)
        pos8.setImage(nil, for: UIControl.State.normal)
        pos9.setImage(nil, for: UIControl.State.normal)
        
        resultLabel.text =  ""
        
        for i in 0...8 {
            arrayState[i]=0
        }
        gameIsActive=true
    }
    
    func selectPos(button: UIButton){
        if gameIsActive {
            
            if button.image( for: UIControl.State.normal)==nil {
                if player == 1{
                    button.setImage(UIImage(named: "x"), for: UIControl.State.normal)
                }
                else {
                    button.setImage(UIImage(named: "o"), for: UIControl.State.normal)
                }
                arrayState[button.tag]=player
                determinWinner()
                if player==1 {
                    player=2
                }else{
                    player=1
                }
            }
        }
    }
    func determinWinner(){
        for index in winningIndexes {
            if arrayState[index[0]]==arrayState[index[1]]
            && arrayState[index[1]]==arrayState[index[2]]
                && arrayState[index[2]] != 0
            {
                resultLabel.text = "Player \(player) won"
                gameIsActive=false
                
                break
            }
        }
    }
    
}
