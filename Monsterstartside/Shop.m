//
//  Shop.m
//  Monsterstartside
//
//  Created by Magnus Kinly on 22/04/15.
//  Copyright (c) 2015 MaaMetis. All rights reserved.
//

#import "Shop.h"

@interface Shop ()

@end

@implementation Shop

//----------------------------------------------------

-(IBAction)købEt {
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"" message:@"Er du sikker på at du vil købe dette?" delegate:self
                          
                          cancelButtonTitle:@"Tilbage" otherButtonTitles:nil];
    
    [alert addButtonWithTitle:@"Køb"];
    
    [alert show];
    
}
//----------------------------------------------------

-(IBAction)købTo {
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"" message:@"" delegate:self
                          
                          cancelButtonTitle:@"" otherButtonTitles:nil];
    
    [alert addButtonWithTitle:@"Køb"];
    
    [alert addButtonWithTitle:@"Tilbage"];
    
    [alert show];
    
}
//----------------------------------------------------

-(IBAction)købTre {
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"" message:@"" delegate:self
                          
                          cancelButtonTitle:@"" otherButtonTitles:nil];
    
    [alert addButtonWithTitle:@"Køb"];
    
    [alert addButtonWithTitle:@"Tilbage"];
    
    [alert show];
    
}
//----------------------------------------------------

-(IBAction)købFire;{
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"" message:@"" delegate:self
                          
                          cancelButtonTitle:@"" otherButtonTitles:nil];
    
    [alert addButtonWithTitle:@"Køb"];
    
    [alert addButtonWithTitle:@"Tilbage"];
    
    [alert show];
    
}
//----------------------------------------------------

-(IBAction)købFem;{
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"" message:@"" delegate:self
                          
                          cancelButtonTitle:@"" otherButtonTitles:nil];
    
    [alert addButtonWithTitle:@"Køb"];
    
    [alert addButtonWithTitle:@"Tilbage"];
    
    [alert show];
    
}
//----------------------------------------------------

-(IBAction)købSeks;{
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"" message:@"" delegate:self
                          
                          cancelButtonTitle:@"" otherButtonTitles:nil];
    
    [alert addButtonWithTitle:@"Køb"];
    
    [alert addButtonWithTitle:@"Tilbage"];
    
    [alert show];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
