using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Parameters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public RsaKeyParameters PrivateKey { get; set; }
    public AsymmetricKeyParameter PublicKey { get; set; }

	public User()
    {
        
    }
}