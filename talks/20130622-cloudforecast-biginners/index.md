Cloudforecast Biginners
===

<br>

2013/04/27 さいとう まさあき( masakyst )

Yomitan.pm


自己紹介
---

<img src="https://si0.twimg.com/profile_images/3692908699/35e204405d9c88a8a5c9dc16567ab8eb.jpeg" height="100" />

* 斉藤 雅昭(さいとう まさあき) 
* Twitter @masakyst
* 沖縄 読谷村
* Perl, JavaScriptが好き
* フルスタックエンジニア


Cloudforecastとは
---

サーバ等のリソース監視をするためのツールです。
RRDToolの薄いラッパー、情報取得のためのフレームワークとして設計されています。
CloudForecastは、4つのプロセスによって動作します。

<br>

 - 巡回デーモン
 - グラフ閲覧 HTTPD
 - 情報取得Gearmanワーカー
 - RRDファイル更新Gearmanワーカー

<br>

小規模な監視では、Gearmanがなくても動作可能です。

(READMEから抜粋)


便利なこと
---

<br>

* 例えばApacheやMySQLを入れなくても動く(PSGIベース
* system perl + cpanmでさくっと動く
* サーバ台数が増えてもGearmonで大量にさばける
* Perl製!!(ソース勉強,改変しやすい 

<br>

自分が使っている言語で安心して使えるというのは大事...!!


できないこと
---

cloudforecastはリソースのグラフ化中心で

<br>

* 死活監視
* 閾値でのアラート

<br>

などは現在できません。


死活監視どうするの？
---

App::MadEyeがあります！

シンプルなPerl製の死活監視用ツールです。

<br>

Ping、HTTP、データベース接続、DSN lookup、SMTP、FTP、memcached、etc

<br>

様々なものに死活監視可能です。

定期的にcronで回す感じになります。


閾値でのアラート？
---

Amazon CloudWatchを使いましょう


デモ
---

cloudforecast, madeye

<br>

資料

http://masakyst.github.io/docs/perl-professional-programming/chapterx1/


YAPC::Asia 2013
---
http://yapcasia.org/2013/

エンジニアのエンジニアによるエンジニアのためのお祭り!!

国内外の(Perl)ハッカーが集結!!

<br>

9/19(木) ... 前夜祭

9/20(金) ... 一日目

9/21(土) ... 二日目

<br>

100セット限定！miyagawaデカール 2013年モデル +完全限定生産なシークレットデカール２枚セット
http://peatix.com/event/15222　


YAPCに沖縄から安く行く!!
---

### 例)

飛行機代

LCCエアアジア 

往路 9/18(水): 5,580円

復路 9/22(日): 7,580円

計13,160円

<br>

ホテル代

ビジネスイン ニューシティー(横浜駅より2駅)

カプセルルーム(29歳以下限定！？

9/19から 1泊1,890円 * 3日 で 合計5,670円

<br>

他、1泊3000円前後でままある。

※本日調べ、じゃらん調べ




遠方からの参加者支援制度
---

### YAPC::Asia参加の交通費をスカイアークさんが全額支援！！

http://yapcasia.org/2013/06/yapcasia-region.html

<br>

参加に必要なもの

以下３点が必須となります

<br>

* YAPCに参加したい！という熱い気持ち
* クラウド技術に関連したYAPC::Asiaでのトーク申し込み
* 感想などのBlogエントリを書く

<br>

詳しくは、上記URLを確認ください!!


YAPCいつ行くの！？
---

<br>

## いまでしょ！！

(注意9/19です)


ご清聴
---

## ありがとうございました


