//
//  ViewController1.m
//  button
//
//  Created by Appzoc on 23/06/17.
//  Copyright © 2017 Appzoc. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end
NSArray *pickerArray;
@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //pagecontroler
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0,150,400,200);
    pageControl.numberOfPages = 4;
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
    pageControl.backgroundColor = [UIColor brownColor];
    
    
    
    //text view
    
    UITextView  *myTextView = [[UITextView alloc]initWithFrame:CGRectMake(100, 100, 100, 20)];
    [myTextView setText:@" iOS...."];
    [self.view addSubview:myTextView];
    myTextView.contentMode=UIViewContentModeCenter;
    
    //webview
    
    
    UIWebView *webview=[[UIWebView alloc]initWithFrame:CGRectMake(100, 400, 200,200)];
    NSString *url=@"http://www.google.com";
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webview loadRequest:nsrequest];
    [self.view addSubview:webview];
    
    
    
    //segmntcntrlr
    NSArray *itemArray = [NSArray arrayWithObjects: @"One", @"Two", @"Three", nil];
    UISegmentedControl *SegmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];    SegmentedControl.frame = CGRectMake(60, 550,200, 30);
    SegmentedControl.selectedSegmentIndex = 1;
    SegmentedControl.tintColor = [UIColor redColor];
    [SegmentedControl addTarget:self action:@selector(Changed:) forControlEvents:UIControlEventValueChanged];
    [ self.view addSubview:SegmentedControl ];
    
    
    //picker
    
    
   pickerArray = [[NSArray alloc]initWithObjects:@"Chess",
                   @"Cricket",@"Football",@"Tennis",@"Volleyball", nil];
   
    
    UIPickerView *myPickerView = [[UIPickerView alloc]init ];
    
    
    myPickerView.showsSelectionIndicator = YES;

    myPickerView.frame =CGRectMake(10, 90, 300, 50);
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    [self.view addSubview:myPickerView];

    
    
    
  }






- (void) Changed:(id)sender
{
    //[label2 setText:[NSString stringWithFormat:@"%d", (int)sender.value];
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerArray.count;
}
// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerArray[row];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
