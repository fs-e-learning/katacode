Kubernetesの内部で実行されている Pod は、プライベートな隔離されたネットワーク上で実行されています。
デフォルトでは、それらは同じkubernetesクラスタ内の他の Pod やサービスからは見えますが、そのネットワークの外には現れません。

`kubectl` を使用すると、APIエンドポイントを介して対話しアプリケーションと通信します。

kubernetesクラスタの外部にアプリケーションを公開する方法ついてはこの先のセクションで説明します。

`kubectl` コマンドを用いて、通信をクラスタ全体のプライベートネットワークに転送するプロキシを作成できます。
プロキシは `control-C` を押すことで終了させることができ、実行中には何も出力を表示しません。

プロキシを実行するために2番目のターミナルウィンドウを開いてコマンドを実行してください。

`kubectl proxy`{{execute T2}}

これで、ホスト（オンライン端末）とKubernetesクラスタの間に接続が確立されました。
プロキシはこれらの端末からAPIへの直接アクセスを可能にします。

プロキシエンドポイントを介してホストされているすべてのAPIを確認できます。
現在は `http://localhost:8001` で入手できます。
たとえば、curlコマンドを使用して、APIを通じてバージョンを直接問い合わせることができます。

`curl http://localhost:8001/version`{{execute T1}}

API Server は、ポッド名に基づいて各ポッドのエンドポイントを自動的に作成します。
このエンドポイントもプロキシ経由でアクセス可能です。

最初にPodの名前を `kubectl get pods`{{execute T1}} を用いて取得する必要があります。
ここでは環境変数POD_NAMEに格納します。

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}');   echo 'ポッド名は'" $POD_NAME "'です。'`{{execute T1}}

これで Pod で実行中のアプリケーション HTTP リクエストできます。

`curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/`{{execute T1}}

URLはPodのAPIへのルートです。

注：端末の上部を確認してください。プロキシは新しいタブ（ターミナル2）で実行され、最近のコマンドは元のタブ（ターミナル1）で実行されました。それでもプロキシは2番目のタブで実行されます。これにより、localhost:8001 を使用してcurlコマンドを機能させることができました。
