# blog-distill

## 使い方

admin site(default blogadmin.sqlite3)

```
http://localhost:8000
```

* username: blogadmin
* password: blogadmin

> createsupserでいいと思う

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

## リンク

* [meeb/django\-distill\-example: An example fully working statically generated website using Django Distill\.](https://github.com/meeb/django-distill-example)
