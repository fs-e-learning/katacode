Podは孤立したプライベートネットワークで実行されていることを思い出してください。

したがって、Podをデバッグして対話できるように、それらへのプロキシアクセスが必要です。
これを行うには、kubectl proxyコマンドを使用して2番目の端末ウィンドウでプロキシを実行します。

下のコマンドをクリックして新しい端末を自動的に開き、プロキシを実行します。

`kubectl proxy`{{execute T2}}

繰り返しになりますが、Podの名前を取得し、プロキシを介してそのPodに直接問い合わせます。
Pod名を取得してPOD_NAME環境変数に保存するには

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}');  echo 'Pod の名前は:'" $POD_NAME"`{{execute T1}}

アプリケーションの出力を確認するには、curlリクエストを実行してください。

`curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/`{{execute T1}}

URLはPodのAPIへのルートです。
