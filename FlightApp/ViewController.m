//
//  ViewController.m
//  FlightApp
//
//  Created by Edward Akoto on 12/2/12.
//  Copyright (c) 2012 Edward Akoto. All rights reserved.
//



#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize listTableView, submitButton;


-(IBAction)buttonPressed:(id)sender{
    
    NSString *alertViewText = [[NSString alloc] initWithFormat:@"Process JSON object"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:alertViewText delegate:(nil) cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    
    
    
    
    
    [alert show];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(tableView == self.listTableView){
        
        return 20;
    }else{
        return 15;
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    
    
    // Configure the cell...
    if(tableView == self.listTableView){
        
        
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        if ([indexPath section] == 0) {
            UILabel *departureLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 100, 30)];
            UILabel *destinationLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 5, 100, 30)];
            UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(450, 5, 100, 30)];
            //
            
            if([indexPath row] == 0){
                departureLabel.text = @"Airline";
                destinationLabel.text = @"Airline";
                numberLabel.text = @"Airline";
                 numberLabel.text = @"Airline";
                
            }
            
            
            [cell addSubview:departureLabel];
            [cell addSubview:destinationLabel];
            [cell addSubview:numberLabel];
          

            
        }
        
   
    
    
}


return cell;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
