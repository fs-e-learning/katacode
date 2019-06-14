
Deployment をリストするには、`get deployments` コマンドを使用します。`kubectl get deployments`{{execute}}

Pod が1つあるはずです。
そうでない場合は、コマンドを再実行してください。

DESIREDは、構成された数のレプリカを表示しています

CURRENTは、現在実行中のレプリカの数を示します。

UP-TO-DATEは、目的の（構成済み）状態に一致するように更新されたレプリカの数です。

AVAILABLEは、ユーザーにとって実際に使用可能なレプリカの数を示します。

次に、Deployment を4つのレプリカにスケールしてみましょう。
`kubectl scale` コマンドを使用し、その後にデプロイメントタイプ、名前、および必要なインスタンス数を指定します。

`kubectl scale deployments/kubernetes-bootcamp --replicas=4`{{execute}}

もう一度 Deployments を一覧表示するには、`get deployments` を使用します。

`kubectl get deployments`{{execute}}

変更が適用され、利用可能なアプリケーションのインスタンスが4つあります。
次に、Podの数が変わったかどうかを確認しましょう。

`kubectl get pods -o wide`{{execute}}

異なるIPアドレスを持つ4つのPodがあります。
変更は Deploymentイベントログに記録されます。
これを確認するには、`describe` コマンドを使用します。

`kubectl describe deployments/kubernetes-bootcamp`{{execute}}

このコマンドの出力で、現在4つのレプリカがあることを確認することもできます。
