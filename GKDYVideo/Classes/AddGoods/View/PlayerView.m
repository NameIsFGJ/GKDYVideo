//
//  PlayerView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView
- (AVPlayer *)player {
    return self.playerLayer.player;
}

- (void)setPlayer:(AVPlayer *)player {
    self.playerLayer.player = player;
}

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayerLayer *)playerLayer {
    return (AVPlayerLayer *)self.layer;
}

@end
