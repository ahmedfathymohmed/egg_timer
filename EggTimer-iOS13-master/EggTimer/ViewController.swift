//






import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    let eggtimes = [ "Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondspassed = 0
    var player: AVAudioPlayer!
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggtimes[hardness]!

        progressBar.progress = 0.0
        secondspassed = 0
        titleLable.text = hardness

        
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondspassed < totalTime {
            secondspassed += 1
            progressBar.progress = Float(secondspassed) / Float(totalTime)
            print(Float(secondspassed) / Float(totalTime))
        } else {
            timer.invalidate()
            titleLable.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}
