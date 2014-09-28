# 僕がよく使うCPANモジュール

<br>
<br>
<br>

2014/09/27

masakyst

Yomitan.pm

—
## 自己紹介

* さいとう まさあき
* 沖縄 読谷村
* Perl好き
* Yomitan.pm (Perl Mongers Group)
* Twitter @masakyst

—
## 単に使ってるモジュールの紹介

ですが、Perlって比較的…

* トレンドが変わりやすい
* 国内、海外で支持されてるモジュールが違う
* 個人的にも好きなモジュールが違う

<br>

という傾向が、他の言語より強い気がします。たぶん。
なので私は人が使ってるモジュール気になります。

—
## 今回は以下のCPANモジュールについて

Email::Sender
Reply
Jonk
DBIC
Daiku
File::RotateLogs
App::scan_prereqs_cpanfile

—
## メール送信

Email::Sender

```perl
my $transport = Email::Sender::Transport::SMTPS->new(
    host          => 'smtp.gmail.com',
    ssl           => 'starttls',
    sasl_username => 'masakyst.mobile@gmail.com',
    sasl_password => ‘********’, 
);  
my $email = Email::Simple->create(
    header => [
        From    => 'masakyst.mobile@gmail.com',
        To      => 'm.saito@bleu-ll.com',
        Subject => 'hello',
    ],  
    body => 'world',
);  
sendmail($email, { transport => $transport }); 

```
—
## REPL (Read eval print loop)

Reply , Carp::Reply

```perl
my $foo = 'foo value';
Carp::Reply::repl(); # breakpoint(複数はれる)
my $baz = 'baz value';
print "$baz\n";
```
<br>

\#list 周辺のコード表示
\#env 変数表示
\#trace #bt バックトレース

—
## ジョブキュー

Jonk

```perl
my $dbh = DBI->connect('dbi:SQLite:./jobqueue.db','','');

# Client
Jonk::Client->new($dbh)->enqueue('MyFetcher', ‘http://yomitanpm.org’);

# Worker
my $worker = Jonk::Worker->new($dbh => {functions => [qw/MyFetcher/]});
while (1) {
    if (my $job = $worker->dequeue) {
        MyFetcher->work($job);
    } else {
        sleep(3); # wait for 3 sec.
    }   
}

```

—
## タスクランナー

Daiku

```perl
$ daiku -T
daiku create:schema  # ジョブキュースキーマ作成
daiku devel:server   # 開発サーバ起動

# Daikufile
namespace create => sub {
    desc 'ジョブキュースキーマ作成';
    task schema => sub {
        system "sqlite3 jobqueue.db < schema-sqlite.sql";
    };  
};
```

—


## ORマッパー

DBIx::Class

```perl
#基本はresultsetから行う
my $schema = Schema->connect;
my $book = $schema->resultset('Book')->find({isbn => '978-4-8443-2699-1'});
say $book->isbn;
say $book->title;
say $book->price;

#こんな感じでも
$rs->search_like( {name => ‘masakyst%’} )->delete;
```

—
## cpanfile生成

App::scan_prereqs_cpanfile

```bash

$ scan-prereqs-cpanfile sample.pl > cpanfile


```

—

## ログローテート

File::RotateLogs

```perl
my $rotatelogs = File::RotateLogs->new(
    logfile      => './worker_log.%Y%m%d%H%M',
    linkname     => './worker_log',
    rotationtime => 86400,
    maxage       => 86400*14,
);
$rotatelogs->print(“Hello World”};

```
—

## Catalyst::Plugin::File::RotateLogs リリースしました！
—

## まとめ

* 好きなモジュール使えばいいさ！！

<br><br>


以上です

—
## Yomitan.pmの今後

10/18(土)のJAWS-UG沖縄 CMS祭り


Hokkaido.pmのonagataniさん(スカイアーク)
MovableType MT福岡の青木さん(シックスアパート)

<br>

などなどが来沖されるという事で、
Yomitan.pmも交流and前夜祭でLTぶっこみたい！





