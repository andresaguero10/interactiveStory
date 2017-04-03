//
//  Audio.swift
//  InteractiveStory
//
//  Created by Andres Aguero on 4/2/17.
//  Copyright © 2017 Treehouse Island. All rights reserved.
//

import Foundation
import AudioToolbox


extension Story {
    
    var soundEffectName: String {
        switch self {
        case .droid, .home:
            return "HappyEnding"
        case .monster:
            return "Ominous"
        default:
            return "PageTurn"
        }
    }
    
    
    var soundEffectURL: URL {
        let path = Bundle.main.path(forResource: soundEffectName, ofType: "wav")!
        return URL(fileURLWithPath: path)
    }

}
class SoundEffectsPlayer {
    
    //stores the sound that we want to play
    // the reason why it is 0 is because the systemtypeid is of type integer
    var sound: SystemSoundID = 0
    
    // now that we have a url for the sound effect it is time to play it
    func playSound(story: Story){
        let soundURL = story.soundEffectURL as CFURL
        AudioServicesCreateSystemSoundID(soundURL, &sound)
        AudioServicesPlaySystemSound(sound)
    }
    
    
}
