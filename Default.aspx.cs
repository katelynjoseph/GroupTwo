using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Encodings;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto.Generators;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    User usr = new User();
    Email usrEmail = new Email();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        // Variable Declarations
        string SourceData;
        byte[] tmpSource;
        
        //Create byte array from source text
        tmpSource = ASCIIEncoding.ASCII.GetBytes(txtEmailBody.Text);


        // Generate RSA Key pair based on random number
        RsaKeyPairGenerator g = new RsaKeyPairGenerator();
        g.Init(new KeyGenerationParameters(new SecureRandom(), 1024));
        AsymmetricCipherKeyPair keyPair = g.GenerateKeyPair();

        // Extract private and public keys from the pair
        RsaKeyParameters pvtKey = (RsaKeyParameters)keyPair.Private;
        AsymmetricKeyParameter PublicKey = (RsaKeyParameters)keyPair.Public;

        //create User object
        usr.PrivateKey = pvtKey;
        usr.PublicKey = PublicKey;

        //Encryption Process
        IAsymmetricBlockCipher cipher = new OaepEncoding(new RsaEngine());
        cipher.Init(true, PublicKey);
        byte[] ciphertext = cipher.ProcessBlock(tmpSource, 0, tmpSource.Length);
        usrEmail.cipherByteArray = cipher.ProcessBlock(tmpSource, 0, tmpSource.Length);
        string result = Encoding.UTF8.GetString(ciphertext);
        usrEmail.cipherText = result;
        lblEncrypted.Text = result;
    }
    protected void btnOpenEmail_Click(object sender, EventArgs e)
    {
        IAsymmetricBlockCipher cipher1 = new OaepEncoding(new RsaEngine());
        cipher1.Init(false, usr.PrivateKey);
        byte[] deciphered = cipher1.ProcessBlock(usrEmail.cipherByteArray, 0, usrEmail.cipherByteArray.Length);
        string decipheredText = Encoding.UTF8.GetString(deciphered);
        lblDecrypted.Text = decipheredText;
    }
}