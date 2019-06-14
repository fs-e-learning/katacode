
Service を 2つのレプリカに縮小するには、もう一度 `scale` コマンドを実行します。

`kubectl scale deployments/kubernetes-bootcamp --replicas=2`{{execute}}

`get deployments` コマンドで変更が適用されたかどうかを確認するため Deployments をリストします。

`kubectl get deployments`{{execute}}

レプリカの数は 2 に減少しました。`get pods` で Pods の数をリストします。

`kubectl get pods -o wide`{{execute}}

2つの Pod が終了したことが STATUS=Terminating により確認できました。
