Podが起動して実行されたら、コンテナ上で直接コマンドの実行ができます。
これには execコマンドを使い、Podの名前をパラメータとして使います。環境変数をリストしてみましょう。

`kubectl exec $POD_NAME env`{{execute T1}}

繰り返しますが、Podにはコンテナーが1つしかないため、コンテナー自体の名前を省略することができます。

次に、Podのコンテナでbashセッションを始めましょう。

`kubectl exec -ti $POD_NAME bash`{{execute T1}}

NodeJSアプリケーションを実行しているコンテナ上に対話シェルが起動しました。
アプリのソースコードはserver.jsファイルにあります。

※ `docker exec` と同様に対話型で exec するには `-it` オプションを指定します。

`cat server.js`{{execute T1}}

curlコマンドを実行して、アプリケーションが起動していることを確認できます。

`curl localhost:8080`{{execute T1}}

注：NodeJSコンテナ内でコマンドを実行したため、ここではlocalhostを使用しました。

以下をタイプしてコンテナ接続を閉じます。

`exit`{{execute T1}}
