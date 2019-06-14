minikube のように、kubectl はオンライン端末に既にインストールされています。
  使い方を見るには端末にkubectlと入力してください。 
kubectlコマンドの一般的な形式は、`kubectl アクション リソース` です。
これは、指定されたリソース（ノード、コンテナなど）に対して指定されたアクション（作成、取得など）を実行します。
コマンドの後に `--help` を使用すると、可能なパラメータに関する追加情報を取得できます（`kubectl get nodes --help`）。

`kubectl version`コマンドを実行して、kubectlがクラスタと通信するように設定されていることを確認します。

`kubectl version`{{execute}}

OK！ kubectlがインストールされ、クライアントとサーバーの両方のバージョンを確認できます。

クラスタ内のノードを表示するには、`kubectl get nodes`コマンドを実行します。

`kubectl get nodes`{{execute}}

利用可能なノードが表示されます（ここでは 1 ノード）。
KubernetesはNodeの利用可能なリソースに基づいてアプリケーションをどこにデプロイするかを選択します。
