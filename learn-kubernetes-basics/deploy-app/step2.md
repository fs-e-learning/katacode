kubectl runコマンドを使用して、Kubernetesで最初のアプリを実行しましょう。

`run` コマンドは新しい Deployment を作成します。

デプロイ名とアプリのイメージの場所を指定する必要があります（外部にある Docker Hub でホストされているイメージの完全なリポジトリURLを含む）。

特定のポートでアプリを実行したいので、 `-port` パラメータを追加します。

`kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080`{{execute}}

すばらしい！
Deployment を作成して最初のアプリケーションを配置しました。これはあなたのためにいくつかのことを行いました：

* アプリケーションのインスタンスを実行できる適切なノードを探します（利用可能なノードは1つだけでしたが）。
* そのノードで実行するようにアプリケーションをスケジュールした
* 必要に応じて新しいノードでインスタンスを再スケジュールするようにクラスタを設定した

Deployment を一覧表示するには、`get deployments`コマンドを使用します。

`kubectl get deployments`{{execute}}

アプリの単一インスタンスを実行している Deployment が1つあることがわかります。
インスタンスは、ノードのDockerコンテナ内で実行されています。
