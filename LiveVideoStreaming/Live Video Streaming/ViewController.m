//
//  ViewController.m
//  Live Video Streaming
//
//  Created by Brianna Przybysz on 8/11/15.
//  Copyright (c) 2015 MohammadSUsman. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

{
//    TestingViewController * mainView;
    //  MPMoviePlayerViewController *_player;
    MPMoviePlayerController *_player;
    UIView *videoView;
}

@synthesize menuString;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self sublayout];
    //mainView = [[ViewController alloc]init];
    [self videoPlayer];
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        NSLog(@"Portrait");
    }
    else {
        NSLog(@"Landscape");
        NSURL *videoURL = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];
        
        _player = [[MPMoviePlayerController alloc]initWithContentURL:videoURL];
        _player =[[MPMoviePlayerController alloc]initWithContentURL:videoURL];
        //        _player.view.frame = CGRectMake(0, 0, 640, 320);
        //        [_player play];
        
        [_player.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
        [videoView addSubview:_player.view];
        _player.fullscreen = YES;
        _player.repeatMode = MPMovieRepeatModeOne;
        _player.controlStyle = MPMovieControlStyleNone;
        [_player play];
        
    }
}
-(void)sublayout{
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //NSString * sdf= mainView.cellLabel;
    subView.backgroundColor = [UIColor clearColor];
    UILabel *cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/2, 200, 44)];
    cellLabel.text = menuString;
    [subView addSubview:cellLabel];
    [self.view addSubview:subView];
}

-(void)videoPlayer{
    videoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
    videoView.backgroundColor = [UIColor whiteColor];
    NSURL *videoURL = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];
    
    // _player = [[MPMoviePlayerViewController alloc]initWithContentURL:videoURL];
    _player =[[MPMoviePlayerController alloc]initWithContentURL:videoURL];
    _player.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 320);
    [videoView addSubview:_player.view];
    [_player play];
    
    [self.view addSubview:videoView];
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewwillapper");
}
-(void)viewWillDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
