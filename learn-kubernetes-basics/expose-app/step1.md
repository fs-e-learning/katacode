アプリケーションが実行されていることを確認しましょう。 `kubectl get`コマンドを使用して既存のPodを探します。

`kubectl get pods`{{execute}}

次に、クラスタの Service をリストしましょう。

`kubectl get services`{{execute}}

minikubeがクラスターを起動するとデフォルトで作成されるkubernetesというサービスがあります。
新しいサービスを作成して外部トラフィックに公開するには、パラメータとして `NodePort` を指定して `expose` コマンドを使用します（minikube はまだ LoadBalancerオ プションをサポートしていません）。

`kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080`{{execute}}

再び `get services` コマンドを実行して確認してみます。

`kubectl get services`{{execute}}

kubernetes-bootcamp という名前の実行中のサービスが作成されました。
ここでは、サービスが固有のクラスタIP、内部ポートが割り当てられたことがわかります。

どのポートが（NodePortオプションによって）外部的に公開されたかを調べるために、`describe service` コマンドを実行します。

`kubectl describe services/kubernetes-bootcamp`{{execute}}

ノードポートの値がを環境変数NODE_PORTにセットします。

`export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT`{{execute}}

これで、curl、ノードのIP、および外部に公開されているポートを使用して、アプリがクラスタの外部に公開されていることをテストできます。

`curl $(minikube ip):$NODE_PORT`{{execute}}

そして、私たちはサーバーから応答を得ることができました。本サービスは公開されています！
