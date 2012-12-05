//
//  ViewController.m
//  FlightApp
//
//  Created by Edward Akoto on 12/2/12.
//  Copyright (c) 2012 Edward Akoto. All rights reserved.
//



#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "MapViewController.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize listTableView, submitButton, airlineText, departureAirportText, departureDateText, destinationAirportText;


-(IBAction)buttonPressed:(id)sender{
//    
//    NSString *alertViewText = [[NSString alloc] initWithFormat:@"Process JSON object"];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:alertViewText delegate:(nil) cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    
    
    
    
//    
//    [alert show];
    
}

- (IBAction)grabURLInTheBackground:(id)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(tableView == self.listTableView){
        
        return 1;
    }else{
        return 2;
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
            UILabel *departureLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 150, 30)];
            UILabel *destinationLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 5, 150, 30)];
            UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(450, 5, 150, 30)];
            UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(600, 5, 150, 30)];
            //
            
            if([indexPath row] == 0){
                departureLabel.text = @"SFO";
                [departureLabel setBackgroundColor:[UIColor clearColor]];
                
                destinationLabel.text = @"KQ";
                [destinationLabel setBackgroundColor:[UIColor clearColor]];
                
                numberLabel.text = @"FX150";
                [numberLabel setBackgroundColor:[UIColor clearColor]];
              
                statusLabel.text = @"Delayed 5 mins ";
                [statusLabel setBackgroundColor:[UIColor clearColor]];
                
            }
            
            
            [cell addSubview:departureLabel];
            [cell addSubview:destinationLabel];
            [cell addSubview:numberLabel];
            [cell addSubview:statusLabel];
            
          

            
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

- (IBAction)grabURLInBackground:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://flight-prediction.herokuapp.com/predictions/DL123"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
NSString *responseString = [request responseString];
    NSString *alertViewText = [[NSString alloc] initWithFormat:responseString];
   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:alertViewText delegate:(nil) cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];    
    [alert show];
    
    
    // Use when fetching binary data
//    NSData *responseData = [request responseData];
//    MapViewController *mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
//    
//    [self.navigationController pushViewController:mapViewController animated:YES];
//
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSString *del =@"Hello";
    
    MapViewController *mpc = [[MapViewController alloc] initWithNibName:@"Map View" bundle:nil];
    
    appDelegate.arrivalDelay = del;
    
//     [self.navigationController pushViewController:mpc animated:YES];
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
//    NSError *error = [request error];
    
    NSString *alertViewText = [[NSString alloc] initWithFormat:@"Error"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:alertViewText delegate:(nil) cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    
    [alert show];
}





@end
