﻿namespace MobileDevice
{
    using System;

    public class Initial
    {
        public static void Main()
        {
            Gsm smartphone = new Gsm("Fancy Phone", "Bulgaria");
            string separator = new string('=', 100);

            // Print mobile device information
            Console.WriteLine(separator);
            Console.WriteLine("Mobile Devices Information:");
            Console.WriteLine(separator);

            foreach (var mobilePhone in GsmTest.MobilePhones)
            {
                Console.WriteLine(mobilePhone.ToString());
            }

            Console.WriteLine(smartphone.IPhone4S.ToString());

            Console.WriteLine(separator);

            // Print GSM Call History Information
            GSMCallHistoryTest.DisplayInformation();
        }
    }
}