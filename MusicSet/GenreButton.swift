//
//  GenreButton.swift
//  MusicSet
//
//  Created by 翰 on 2021/7/12.
//

import UIKit
import MediaPlayer


let constraintsButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 100, height: 30))


class GenreButton: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(constraintsButton)
    }

    @IBAction func GenreBtnTappedOne(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
            
        }
       
        
    }
    
    
    @IBAction func StopBtnTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    
    @IBAction func NextBtnTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre:String){
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)//pass in query on 41
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
    
}

