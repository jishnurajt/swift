//
//  ViewController.m
//  button
//
//  Created by Appzoc on 20/06/17.
//  Copyright © 2017 Appzoc. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()


@end

NSString *a;
UIActivityIndicatorView *activityIndicator;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //text field and label
    
    
    UILabel *Label = [[UILabel alloc]initWithFrame:CGRectZero];
    Label.text =@" Type -> ";
    [Label setFont:[UIFont boldSystemFontOfSize:14]];
    [Label sizeToFit];
    
    textField = [[UITextField  alloc] initWithFrame:CGRectMake(20, 50, 280, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [textField setFont:[UIFont boldSystemFontOfSize:12]];
    textField.placeholder = @"Simple Text field";
    textField.leftView = Label;
    textField.leftViewMode = UITextFieldViewModeUnlessEditing;
    [self.view addSubview:textField];
    
    UILabel *label2 = [[UILabel alloc]init];
   label2.frame=CGRectMake(60, 200, 200, 50);
    //label2.backgroundColor=[UIColor redColor];
    label2.text= a;
    label2.textColor=[UIColor blackColor];
   [self.view addSubview:label2];
 
    
    
    
    
    
    
    //button
    UIButton *Button = [[UIButton alloc]init];
    [Button setFrame:CGRectMake(60, 150, 150, 40)];
    [Button setBackgroundColor:[UIColor blueColor] ];
    [Button setTitle:@"click" forState:UIControlStateNormal];
     [Button setTitle:@"done" forState:UIControlStateHighlighted];
    
    [Button addTarget:nil  action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Button];
   
    //button
    UIButton *Button1 = [[UIButton alloc]init];
    [Button1 setFrame:CGRectMake(60, 510, 150, 40)];
    [Button1 setBackgroundColor:[UIColor blueColor] ];
    [Button1 setTitle:@"NEXT PAGE" forState:UIControlStateNormal];
   
    
    [Button1 addTarget:nil  action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Button1];
    
    
    // switch
    UISwitch  *mySwitch = [[UISwitch alloc] init];
    [self.view addSubview:mySwitch];
    mySwitch.center = CGPointMake(100,270);
    [mySwitch addTarget:self action:@selector(switched:)
       forControlEvents:UIControlEventValueChanged];
    
    
    
    
    
    //toolbar
  
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 600, 500, 50)];
    [toolbar setBarStyle:UIBarStyleBlackOpaque];
   
    UIBarButtonItem *message = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:nil];
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithObjects:message, nil];
    [toolbar setItems:items animated:NO];

    [self.view addSubview:toolbar];
   // [toolbar setItems:toolbarItems];
    
    
    
    
    //slider
    CGRect frame = CGRectMake(0,400, 200, 10);
    UISlider *slider = [[UISlider alloc] initWithFrame:frame];
    [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [slider setBackgroundColor:[UIColor clearColor]];
    slider.minimumValue = 0.0;
    slider.maximumValue = 50.0;
    slider.continuous = YES;
   // slider.value = 25.0;
    
    //NSLog(@"%d",Int(slider.value));
    [self.view addSubview:slider];
    
    
    
    //stepper
    
    
    
    UIStepper *Stepper = [[UIStepper alloc]initWithFrame:CGRectMake(150, 250, 0, 0)];
    Stepper.wraps = true;
    Stepper.autorepeat = true;
    Stepper.maximumValue = 10;
    [Stepper addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:Stepper];
    
    
  }






- (void) click
{
   
    a = textField.text;
    
    //NSLog(@"%@", a);
    
    label2 = [[UILabel alloc]init];
    label2.frame=CGRectMake(60,180, 200, 50);
    //label2.backgroundColor=[UIColor redColor];
    label2.text= a;
    label2.textColor=[UIColor blackColor];
    [self.view addSubview:label2];
    
    
    
    
    
   
    
}


- (void) click1
{
    
    
    
    
    UIProgressView *progressView = [[UIProgressView alloc] init];
    
    progressView.frame = CGRectMake(100,100,100,20);
    
    [progressView setProgressTintColor:[UIColor redColor]];
    
    [progressView setUserInteractionEnabled:NO];
    
    progressView.progress=0.5f;
    
    [progressView setProgressViewStyle:UIProgressViewStyleBar];
    
    [progressView setTrackTintColor:[UIColor blueColor]];
    
    [self.view addSubview:progressView];
    
    ViewController1 *sv = [[ViewController1 alloc]init];
    [self presentViewController:sv animated:YES completion:nil];

    
}


  //  [self.presentingViewController : s animated:YES];
    






- (void)switched:(UISwitch *) sndr
{
   // UIImageView *imgview = [[UIImageView alloc]initWithFrame:CGRectMake(160, 200, 200, 40)];
    
//    if(sndr.isOn ){
    //        ;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator setCenter:CGPointMake(160,124)];
    [self.view addSubview:activityIndicator];
    // [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    [activityIndicator startAnimating];
    
  
        if ([sndr isOn])
        {
            NSLog(@"Switch is on");
            img = [[UIImageView alloc]init];
            img.frame = CGRectMake(150, 250, 200, 200);
            img.image = [UIImage imageNamed:@"index.jpg"];
            [self.view addSubview:img];
        }
        else
        {
            NSLog(@"Switch is off");
            img.hidden = true;
    }
    
     // [activityIndicator stopAnimating];
    
    
    
}





- (void) sliderChanged:(id)sender
{
         //[label2 setText:[NSString stringWithFormat:@"%d", (int)sender.value];
   
    
}
- (void) stepperChanged:(id)sender
{
    
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
