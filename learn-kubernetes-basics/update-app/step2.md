まず、アプリが起動していることを確認しましょう。公開されているIPとポートを調べるには、`describe service` を使用します。

`kubectl describe services/kubernetes-bootcamp`{{execute}}

NodePort の値が割り当てられた NODE_PORT という環境変数を設定します。

`export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT`{{execute}}

次に、公開されているIPとポートに対して curl します。

`curl $(minikube ip):$NODE_PORT`{{execute}}

何度か実行してください。
リクエストごとに異なる Podが ヒットし、すべてのPodが最新バージョン（v2）を実行していることがわかります。

ロールアウトステータスコマンドを実行しても、アップデートを確認できます。

`kubectl rollout status deployments/kubernetes-bootcamp`{{execute}}

アプリの現在のイメージバージョンを表示するには、Podに対して `describe` コマンドを実行します。

`kubectl describe pods`{{execute}}

アプリはバージョン2を実行しています（Imageフィールドを見てください）
