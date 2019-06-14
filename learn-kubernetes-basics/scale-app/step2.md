
Service がトラフィックを負荷を分散していることを確認しましょう。

公開されたIPとポートを見つけるために、以前学んだように descrive services を使うことができます。

`kubectl describe services/kubernetes-bootcamp`{{execute}}

環境変数NODE_PORT に Node のポート番号を設定します。

`export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT`{{execute}}

次に、公開されている IPとポートに `curl` で アクセスします。 コマンドを複数回実行します。

`curl $(minikube ip):$NODE_PORT`{{execute}}

リクエストごとに異なるポッドにヒットしました。これは、ロードバランシングが機能していることを示しています。
