#Setup AWS CLI on windows

## Reference Links
1. [Main Link](https://aws.amazon.com/cli/?sc_channel=PS&sc_campaign=acquisition_SG&sc_publisher=google&sc_medium=command_line_b&sc_content=aws_cli_bmm&sc_detail=%2Baws%20%2Bcli&sc_category=command_line&sc_segment=165249748986&sc_matchtype=b&sc_country=SG&s_kwcid=AL!4422!3!165249748986!b!!g!!%2Baws%20%2Bcli&ef_id=Wr0iAQAAAIqQNSua:20180826045252:s)


### Nothing installed

Input
```
aws
```
Output
```
 'aws' is not recognized as an internal or external command,
 operable program or batch file.
```

### Download link of AWS CLI
https://s3.amazonaws.com/aws-cli/AWSCLI64.msi

Restart VSCode after install the msi
Incase you started the VS code via command prompt -> restart the command prompt alsos


#Run aws

Input
```
aws --help
```
Output:
```
usage: aws [options] <command> <subcommand> [<subcommand> ...] [parameters]
To see help text, you can run:

  aws help
  aws <command> help
  aws <command> <subcommand> help
aws: error: too few arguments
```

### Running sample commands

Input
```
aws ec2 describe-instances
```
Error
```
You must specify a region. You can also configure your region by running "aws configure".
```

#### Solution
[Configure Config file] (https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html)

*Windows*
Excute this commands
mkdir "%UserProfile%\.aws"
C:
cd  "%UserProfile%\.aws"
touch credentials
touch config
ls

output
```
config  credentials
```

notepad credentials
https://console.aws.amazon.com/iam/home#/security_credential
Press Create New Access key to both the access key and secret key

```
    [default]
    aws_access_key_id=AKIAIOSFODNN7EXAMPLE
    aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```
aws ec2 describe-regions
```json
{
    "Regions": [
        {
            "Endpoint": "ec2.ap-south-1.amazonaws.com",
            "RegionName": "ap-south-1"
        },
        {
            "Endpoint": "ec2.eu-west-3.amazonaws.com",
            "RegionName": "eu-west-3"
        },
        {
            "Endpoint": "ec2.eu-west-2.amazonaws.com",
            "RegionName": "eu-west-2"
        },
        {
            "Endpoint": "ec2.eu-west-1.amazonaws.com",
            "RegionName": "eu-west-1"
        },
        {
            "Endpoint": "ec2.ap-northeast-2.amazonaws.com",
            "RegionName": "ap-northeast-2"
        },
        {
            "Endpoint": "ec2.ap-northeast-1.amazonaws.com",
            "RegionName": "ap-northeast-1"
        },
        {
            "Endpoint": "ec2.sa-east-1.amazonaws.com",
            "RegionName": "sa-east-1"
        },
        {
            "Endpoint": "ec2.ca-central-1.amazonaws.com",
            "RegionName": "ca-central-1"
        },
        {
            "Endpoint": "ec2.ap-southeast-1.amazonaws.com",
            "RegionName": "ap-southeast-1"
        },
        {
            "Endpoint": "ec2.ap-southeast-2.amazonaws.com",
            "RegionName": "ap-southeast-2"
        },
        {
            "Endpoint": "ec2.eu-central-1.amazonaws.com",
            "RegionName": "eu-central-1"
        },
        {
            "Endpoint": "ec2.us-east-1.amazonaws.com",
            "RegionName": "us-east-1"
        },
        {
            "Endpoint": "ec2.us-east-2.amazonaws.com",
            "RegionName": "us-east-2"
        },
        {
            "Endpoint": "ec2.us-west-1.amazonaws.com",
            "RegionName": "us-west-1"
        },
        {
            "Endpoint": "ec2.us-west-2.amazonaws.com",
            "RegionName": "us-west-2"
        }
    ]
}
```

notepad config
```
    [default]
    region=ap-southeast-1
    output=json
```


# DONE