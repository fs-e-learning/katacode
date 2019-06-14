デプロイメントをリストするには、`get deployments` コマンドを使用します。`kubectl get deployments`{{execute}}

実行中のPodを一覧表示するには、`get pods` コマンドを使用します。

`kubectl get pods`{{execute}}

アプリの現在のImageのバージョンを表示するには、Podに対して `describe` コマンドを実行します（Imageフィールドを見てください）。

`kubectl describe pods`{{execute}}

アプリケーションのImageをバージョン2に更新するには、`set image` コマンドに続けて Deployment名と新しい Imageバージョンを使用します。

`kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2`{{execute}}

このコマンドは、アプリケーションに別のImageを使用するように Deployment に通知し、ローリングアップデートを開始しました。
新しいポッドのステータスを確認し、`get pods `コマンドで終了している古いポッドを表示します。

`kubectl get pods`{{execute}}
