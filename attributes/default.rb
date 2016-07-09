default['ec2ab']['root_dir'] = "/usr/local/work/script/ec2ab"
default['ec2ab']['user'] = "root"
default['ec2ab']['group'] = "root"
default['ec2ab']['url'] = "https://raw.githubusercontent.com/colinbjohnson/aws-missing-tools/master/ec2-automate-backup/ec2-automate-backup.sh"
default['ec2ab']['region'] = "ap-northeast-1"
default['ec2ab']['tag']['name'] = "Backup"
default['ec2ab']['tag']['value'] = "true"
default['ec2ab']['custom_tags'] = ""
default['ec2ab']['rotate'] = "7"
default['ec2ab']['cron']['user'] = "root"
default['ec2ab']['cron']['hour'] = "5"
default['ec2ab']['cron']['minute'] = "7"
default['ec2ab']['mail']['enable'] = false
default['ec2ab']['mail']['to'] = nil
default['ec2ab']['mail']['from'] = nil
default['ec2ab']['mail']['subject'] = "ec2ab"