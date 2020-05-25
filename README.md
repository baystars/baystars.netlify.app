# blog-distill

* Djangoから吐き出した静的コンテンツをnetlifyで公開できるが、コンテンツ作成のためにDjangoを別サーバで運用させておく必要がある
* そのためHugoなどに比べるとやや手間がかかる

## 設定

* github pagesでの利用も配慮し出力先をpublicからdocsに変更(各ソース参照)
* 後述createsuperuserも実施

## 使い方

admin site

```
http://localhost:8000
```

* username: blogadmin
* password: blogadmin

> createsuperuserで新規作成し上記は削除(削除前に投稿者を変更しておくこと)

```shell
tree .
├── Makefile
├── README.md
├── blog
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   ├── models.py
│   ├── static
│   ├── templates
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── demoblog
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── demoblog.sqlite3
├── manage.py
├── public
├── requirements.txt
├── runtime.txt
└── static
```

## Netlifyとの連携

Githubと連携し、以下を設定

* Build command: make build
* Publish directory: docs

## リンク

* [meeb/django\-distill\-example: An example fully working statically generated website using Django Distill\.](https://github.com/meeb/django-distill-example)
