import tweepy

consumer_key = "xUwfU8em1Wb2CfzMNVmniDM7D";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "MWZuwKxXyvnJAy8ezoU82VNkIlzDFumxvNDz45B6tv1GAbzFIe";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "850564782310608896-T6rXttMsIsgRLVlfcOwYoDz52eQjCJT";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "Ewq9j53TE25Wpn2DHIkBZfyObcGyHMG2qaxNPVsSts3K5";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



