using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//System.IO we include for the access to the memory stream
using System.IO;
using System.Text;
//The big using here, this includes everything you could want to do with cryptography.
//Including hashing and public key or semetric key cryptography.
//Gives us acess to cryptostream, the crypto transforms and the rijndael class.
using System.Security.Cryptography;

/// <summary>
/// Summary description for AES_Algorithim
/// </summary>
namespace AES_Algorithim
{
   
    public class CreditCard
    {

       public static string Main1(string card)
        
        {
           /*string plaintext;
           //plaintext=card;
                 plaintext=Encrypt(card);
           return card;
        }   
        
 
private static string Encrypt(string clearText)
{
    string EncryptionKey = "MAKV2SPBNI99212";
    byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
    using (Aes encryptor = Aes.Create())
    {
        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
        encryptor.Key = pdb.GetBytes(32);
        encryptor.IV = pdb.GetBytes(16);
        using (MemoryStream ms = new MemoryStream())
        {
            using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
            {
                cs.Write(clearBytes, 0, clearBytes.Length);
                cs.Close();
            }
            clearText = Convert.ToBase64String(ms.ToArray());
        }
    }
    return clearText;
}
       // {

             /*try
            {

                string original = "card";

                // Create a new instance of the Aes 
                // class.  This generates a new key and initialization  
                // vector (IV). 
                using (Aes myAes = Aes.Create())
                {

                    // Encrypt the string to an array of bytes. 
                    byte[] encrypted = EncryptStringToBytes_Aes(original, myAes.Key, myAes.IV);

                    // Decrypt the bytes to a string. 
                    string roundtrip = DecryptStringFromBytes_Aes(encrypted, myAes.Key, myAes.IV);

                    //Display the original data and the decrypted data.
                    Console.WriteLine("Original:   {0}", original);
                    Console.WriteLine("Round Trip: {0}", roundtrip);
                }

            }
            catch (Exception e)
            {
                Console.WriteLine("Error: {0}", e.Message);
            }
            return card;
        }
        static byte[] EncryptStringToBytes_Aes(string plainText, byte[] Key, byte[] IV)
        {
            // Check arguments. 
            if (plainText == null || plainText.Length <= 0)
                throw new ArgumentNullException("plainText");
            if (Key == null || Key.Length <= 0)
                throw new ArgumentNullException("Key");
            if (IV == null || IV.Length <= 0)
                throw new ArgumentNullException("Key");
            byte[] encrypted;
            // Create an Aes object 
            // with the specified key and IV. 
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Key;
                aesAlg.IV = IV;

                // Create a decrytor to perform the stream transform.
                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

                // Create the streams used for encryption. 
                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {

                            //Write all data to the stream.
                            swEncrypt.Write(plainText);
                        }
                        encrypted = msEncrypt.ToArray();
                    }
                }
            }


            // Return the encrypted bytes from the memory stream. 
            return encrypted;

        }
        public static bool IsValid(string number)
        {
            //If input string is null or empty, throw an exception
            if (string.IsNullOrEmpty(number))
                throw new ArgumentException("Input string was null or empty.");

            //Remove all characters that are not numbers

            IList<char> cleaned = CleanInput(number.ToCharArray());

            //Validate credit card numbers by MOD 10 method
            int result = Validate(cleaned);


            //return information if card is valid or not

           return (result % 10 == 0);

        }
        private static int Validate(IList<char> cleaned)
        {
            //Empty list to be populated with credit card numbers

            IList<int> numbersToAdd = new List<int>();

            //Boolean flag to determine if number should be multiplied by 2 or not

            bool multiply = true;



            //variable for final sum of numbers

            int result = 0;


            //A loop that iterates through all numbers in a reverse order

            for (int i = cleaned.Count - 1; i >= 0; i--)
            {

                //Extract a number from char array

                int num = int.Parse(cleaned[i].ToString());

                //Every second number has to be multiplied by 2

                if (multiply)
                {

                    num *= 2;

                    multiply = false;

                }

                else
                {

                    multiply = true;

                }



                //If number is greater than 9 then divide number in two parts

                //for example 18 woulbe become 1 and 8

                if (num > 9)
                {

                    numbersToAdd.Add(int.Parse(num.ToString().Substring(0, 1)));

                    numbersToAdd.Add(int.Parse(num.ToString().Substring(1, 1)));

                }

                else
                {

                    numbersToAdd.Add(num);

                }

            }

            //Sum all the numbers that we extracted by MOD 10 algorithm

            foreach (int value in numbersToAdd)
            {

                result += value;

            }

            //return the result

            return result;

        }
        private static IList<char> CleanInput(char[] chars)
        {
            //Copy chars array to list of chars
            IList<char> temp = chars.ToList();

            //Iterate through array of chars and remove chars that

            //are not numbers from char list
            foreach (char ch in chars)
            {
                if (!char.IsNumber(ch))
                {
                    temp.Remove(ch);
                }
            }
            return temp;
        }
        static string DecryptStringFromBytes_Aes(byte[] cipherText, byte[] Key, byte[] IV)
        {
            // Check arguments. 
            if (cipherText == null || cipherText.Length <= 0)
                throw new ArgumentNullException("cipherText");
            if (Key == null || Key.Length <= 0)
                throw new ArgumentNullException("Key");
            if (IV == null || IV.Length <= 0)
                throw new ArgumentNullException("Key");

            // Declare the string used to hold 
            // the decrypted text. 
            string plaintext = null;

            // Create an Aes object 
            // with the specified key and IV. 
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Key;
                aesAlg.IV = IV;

                // Create a decrytor to perform the stream transform.
                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                // Create the streams used for decryption. 
                using (MemoryStream msDecrypt = new MemoryStream(cipherText))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {

                            // Read the decrypted bytes from the decrypting stream
                            // and place them in a string.
                            plaintext = srDecrypt.ReadToEnd();
                        }
                    }
                }

            }

            return plaintext;

        }
    }
}*/
           
            string Plain_Text;

            string Encrypted_Text;
            byte[] Encrypted_Bytes;

            //This class here the Rijndael is what will have most all of the methods we need to do aes encryption.
            //When this is called it will create both a key and Initialization Vector to use.
            RijndaelManaged Crypto = new RijndaelManaged();

            //This is just here to convert the Encrypted byte array to a string for viewing purposes.
            System.Text.UTF8Encoding UTF = new System.Text.UTF8Encoding();
            
           // Console.WriteLine("Please enter the credit card number.");
            Plain_Text = card;

            try
            {
                Encrypted_Bytes = encrypt_function(Plain_Text, Crypto.Key, Crypto.IV);
                Encrypted_Text = UTF.GetString(Encrypted_Bytes);
                card = Encrypted_Text;
                
               // Console.WriteLine("Start: {0}", Plain_Text);
                //Console.WriteLine("Encrypted: {0}", Encrypted_Text);


            }
            catch (Exception e)
            {
               // Console.WriteLine("Exception: {0}", e.Message);
            }

            return card;
            //Console.WriteLine("Press enter to exit");
            //Console.ReadKey();

        }

        private static byte[] encrypt_function(string Plain_Text, byte[] Key, byte[] IV)
        {

            RijndaelManaged Crypto = null;
            MemoryStream MemStream = null;
            //I crypto transform is used to perform the actual decryption vs encryption, hash function are a version of crypto transforms.
            ICryptoTransform Encryptor = null;
            //Crypto streams allow for encryption in memory.
            CryptoStream Crypto_Stream = null;

            System.Text.UTF8Encoding Byte_Transform = new System.Text.UTF8Encoding();


            //Just grabbing the bytes since most crypto functions need bytes.
            byte[] PlainBytes = Byte_Transform.GetBytes(Plain_Text);

            try
            {
                Crypto = new RijndaelManaged();
                Crypto.Key = Key;
                Crypto.IV = IV;

                MemStream = new MemoryStream();

                //Calling the method create encryptor method Needs both the Key and IV these have to be from the original Rijndael call
                //If these are changed nothing will work right.
                Encryptor = Crypto.CreateEncryptor(Crypto.Key, Crypto.IV);

                //The big parameter here is the cryptomode.write, you are writing the data to memory to perform the transformation
                Crypto_Stream = new CryptoStream(MemStream, Encryptor, CryptoStreamMode.Write);

                //The method write takes three params the data to be written (in bytes) the offset value (int) and the length of the stream (int)
                Crypto_Stream.Write(PlainBytes, 0, PlainBytes.Length);

            }

            finally
            {
                //if the crypto blocks are not clear lets make sure the data is gone
                if (Crypto != null)
                    Crypto.Clear();
                //Close because of my need to close things then done.
                Crypto_Stream.Close();
            }
            //Return the memory byte array
            return MemStream.ToArray();
        }
        /// <summary>
        /// Method checks if entered credit card number is valid and returns true or false.
        /// </summary>
        /// <param name="number">credit card number</param>
        /// <returns>true if creadit card is valid, otherwise false</returns>
        public static bool IsValid(string number)
        {
            //If input string is null or empty, throw an exception
            if (string.IsNullOrEmpty(number))
                throw new ArgumentException("Input string was null or empty.");

            //Remove all characters that are not numbers

            IList<char> cleaned = CleanInput(number.ToCharArray());

            //Validate credit card numbers by MOD 10 method
            int result = Validate(cleaned);


            //return information if card is valid or not

            return (result % 10 == 0);

        }


        /// <summary>
        /// Method validates a credit card number and returns the sum
        /// of all numbers by MOD 10 method

        /// </summary>
        /// <param name="cleaned">cleaned list of credit card numbers</param>
        /// <returns>sum of all credit card numbers by MOD 10 method</returns>
        private static int Validate(IList<char> cleaned)
        {
            //Empty list to be populated with credit card numbers

            IList<int> numbersToAdd = new List<int>();

            //Boolean flag to determine if number should be multiplied by 2 or not

            bool multiply = true;



            //variable for final sum of numbers

            int result = 0;


            //A loop that iterates through all numbers in a reverse order

            for (int i = cleaned.Count - 1; i >= 0; i--)
            {

                //Extract a number from char array

                int num = int.Parse(cleaned[i].ToString());

                //Every second number has to be multiplied by 2

                if (multiply)
                {

                    num *= 2;

                    multiply = false;

                }

                else
                {

                    multiply = true;

                }



                //If number is greater than 9 then divide number in two parts

                //for example 18 woulbe become 1 and 8

                if (num > 9)
                {

                    numbersToAdd.Add(int.Parse(num.ToString().Substring(0, 1)));

                    numbersToAdd.Add(int.Parse(num.ToString().Substring(1, 1)));

                }

                else
                {

                    numbersToAdd.Add(num);

                }

            }

            //Sum all the numbers that we extracted by MOD 10 algorithm

            foreach (int value in numbersToAdd)
            {

                result += value;

            }

            //return the result

            return result;

        }
        /// <summary>
        /// Method cleans the input char array (removes all chars
        /// that are not numbers).

        /// </summary>

        /// <param name="chars">array of credit card chars</param>
        /// <returns>list of only numbers</returns>
        private static IList<char> CleanInput(char[] chars)
        {
            //Copy chars array to list of chars
            IList<char> temp = chars.ToList();

            //Iterate through array of chars and remove chars that

            //are not numbers from char list
            foreach (char ch in chars)
            {
                if (!char.IsNumber(ch))
                {
                    temp.Remove(ch);
                }
            }
            //return list of number chars.
           return temp;
        }
    }

}
