Service を削除するには、`delete service`コマンドを使用できます。ラベルはここでも使用できます。

`kubectl delete service -l run=kubernetes-bootcamp`{{execute}}

Service がなくなったことを確認します。

`kubectl get services`{{execute}}

Service が削除されたことが確認できました。
その経路がもう公開されていないことを確認するには、以前に公開されたIPとポートで curl してみればわかります。

`curl $(minikube ip):$NODE_PORT`{{execute}}

このエラーはアプリがクラスタの外部からアクセスできなくなったことを示しています。
しかし、アプリがまだポッド（コンテナ）の内側からは curl でアクセスできることを確認することができます：

`kubectl exec -ti $POD_NAME curl localhost:8080`{{execute}}

ここでアプリケーションが起動していることが確認できました。
