package com.techelevator.application;

public class VendingMachine 
{
    public void run()
    {
        while(true)
        {
            String choice = "display";

            if(choice.equals("display"))
            {
                // display the vending machine slots
            }
            else if(choice.equals("purchase"))
            {
                // make a purchase
            }
            else if(choice.equals("exit"))
            {
                // good bye
                break;
            }
        }
    }
    
}
