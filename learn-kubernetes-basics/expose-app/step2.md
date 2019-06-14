Deploy によって、自動的にPodのラベルが作成されています。
`describe deployment` コマンドを使用すると、ラベルの名前を確認できます。

`kubectl describe deployment`{{execute}}

このラベルを使用して、ポッドのリストをクエリしてみましょう。
`kubectl get pods` コマンドに `-l` をパラメータとして使用し、その後にラベルの値を続けます。

`kubectl get pods -l run=kubernetes-bootcamp`{{execute}}

既存の Service をリストするために同じことをすることができます：

`kubectl get services -l run=kubernetes-bootcamp`{{execute}}

ポッドの名前を取得し、それをPOD_NAME環境変数に保存します。

`export POD_NAME=$(kubectl get pods -o go-template --template '{{range.items}} {{.metadata.name}} {{"\n"}} {{end}}')
echo 'Podの名前：'"$POD_NAME"`{{execute}}

新しいラベルを適用するには、`label` コマンドに続けてオブジェクトタイプ、オブジェクト名、新しいラベルを使います。

`kubectl label pod $POD_NAME app=v1`{{execute}}

新しいラベルが Pod に適用され（アプリケーションバージョンをPodに固定しました）、`describe pod` コマンドで確認できます。

`kubectl describe pods $POD_NAME`{{execute}}

ラベルがPodに添付されているのがわかります。そして、新しいラベルを使ってポッドのリストを問い合わせることができます。

`kubectl get pods -l app=v1`{{execute}}

ほら、ポッドが見えました！
