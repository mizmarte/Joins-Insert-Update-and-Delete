package com.techelevator;

import java.util.Scanner;

/*
 Write a command line program which prompts the user for the total bill, and the amount tendered. It should then
 display the change required.

 $ java MakeChange
 Please enter the amount of the bill: 23.65
 Please enter the amount tendered: 100.00
 The change required is 76.35
 */

public class MakeChange 
{

	public static void main(String[] args) 
	{
		Scanner scanner = new Scanner(System.in);
		
		
		System.out.println("Please enter total bill amount: ");
		String billAmount = scanner.nextLine();
		
		
		// 
		System.out.println("Please enter tendered amount: ");
		String tenderAmount = scanner.nextLine();
		
		Double bill = Double.parseDouble(billAmount);
		Double tender = Double.parseDouble(tenderAmount);
		
		double changeAmount = tender - bill;
		
		System.out.println("Change amount is: " + changeAmount);

	

	}
	
	
		
		
		
		
}
