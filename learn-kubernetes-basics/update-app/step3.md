もう一度アップデートを実行して、v10としてタグ付けされたイメージをデプロイしましょう。

`kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10`{{execute}}

Deployment のステータスを確認するには、`get deployment` を使用します。

`kubectl get deployments`{{execute}}

あれ？ 何かが間違っています… 利用可能なポッドの希望数を持っていません。ポッドをもう一度リストします。

`kubectl get pods`{{execute}}

ポッドの `describe` コマンドはより多くの洞察を与えるはずです：

`kubectl describe pods`{{execute}}

リポジトリにv10という名前のイメージはありませんでした。

以前作業していたバージョンにロールバックしましょう。ロールアウトを元に戻すコマンドを使用します。

`kubectl rollout undo deployments/kubernetes-bootcamp`{{execute}}

`rollout` コマンドは、Deployment を以前の既知の状態（イメージのv2）に戻しました。
更新はバージョン管理されており、以前にわかっていたデプロイメントの状態に戻すことができます。

ポッドをもう一度リストします。

`kubectl get pods`{{execute}}

4つのポッドが動いています。それらにデプロイされているイメージをもう一度確認します。

`kubectl describe pods`{{execute}}

Deployment では安定版のアプリ（v2）を使用しています。ロールバックは成功しました。
