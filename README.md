What's ?
===============
chef で使用する EC2環境でインスタンスのスナップショットを取得する cookbook です。  
[colinbjohnson/awsmissing-tools](https://github.com/colinbjohnson/aws-missing-tools "colinbjohnson/awsmissing-tools") にある [ec2-automate-backup](https://github.com/colinbjohnson/aws-missing-tools/tree/master/ec2-automate-backup "ec2-automate-backup") を使用しています。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://github.com/bageljp/"

cookbook "ec2ab", git: "https://github.com/bageljp/cookbook-ec2ab.git"
```

```
berks vendor
```

#### Role and Environment attributes

* sample_role.rb
```ruby
override_attributes(
  "ec2ab" => {
    "user" => "user_name",
    "group" => "group_name",
    "mail" => {
      "enable" => true,
      "to" => "pj-ml@gmail.com",
      "from" => "pj-ml+ec2ab@gmail.com",
      "subject" => "PJ CODE"
    }
  }
)
```

スナップショット取得対象のEC2インスタンスのVolumeに対して、 Tag名「Backup」、Value「true」を定義して下さい。

Recipes
----------

#### ec2ab::default
ec2-automate-backup を取得して、スナップショット取得の設定やメールの送信先、cronの設定を行う。

Attributes
----------

主要なやつのみ。

#### ec2ab::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['ec2ab']['root_dir']</tt></td>
    <td>string</td>
    <td>スクリプト一式をダウンロードする先。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['user']</tt></td>
    <td>string</td>
    <td>スクリプト一式のOwner。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['region']</tt></td>
    <td>string</td>
    <td>スナップショット取得対象にするEC2インスタンスのリージョン。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['tag']['name']</tt></td>
    <td>string</td>
    <td>スナップショット対象にするVolumeのタグ名。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['tag']['value']</tt></td>
    <td>string</td>
    <td>スナップショット対象にするVolumeのタグの値。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['rotate']</tt></td>
    <td>string</td>
    <td>スナップショットの保存世代数。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['cron']['user']</tt></td>
    <td>string</td>
    <td>スナップショットの実行ユーザ。指定したユーザのcronに設定される。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['cron']['hour']</tt></td>
    <td>string</td>
    <td>スナップショットを実行する時間。cronに設定される</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['cron']['minute']</tt></td>
    <td>string</td>
    <td>スナップショットを実行する分。cronに設定される</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['mail']['enable']</tt></td>
    <td>boolean</td>
    <td>スナップショット実行後にメール通知をするかどうか。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['mail']['to']</tt></td>
    <td>string</td>
    <td>スナップショット実行後のメールの送信先アドレス。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['mail']['from']</tt></td>
    <td>string</td>
    <td>スナップショット実行後のメールの送信元アドレス。</td>
  </tr>
  <tr>
    <td><tt>['ec2ab']['mail']['subject']</tt></td>
    <td>string</td>
    <td>スナップショット実行後のメールの件名にはいる識別子。複数PJからメールが来てわからなくならないようにPJ CODEとか入れると良い。</td>
  </tr>
</table>

