This package contains the code for the Marlowe main webpage: https://marlowe-finance.io

## Getting Started

This website is written purely in HTML, CSS and JS. We use webpack to minify and bundle production code and to provide development live reload.

```bash
$ npm install
$ npm run start
```

The `start` script will bundle the assets and launch a webserver in [http://localhost:8000](http://localhost:8000) with live reloading.

To create a production build just run

```bash
$ npm run build
```

## Deployment

The Marlowe website is automatically deployed upon certain pushes to GitHub

* [Staging](https://marlowe-website-staging.plutus.aws.iohkdev.io/) is deployed from every commit pushed to `master` (this URL subject to change)
* [Production](https://marlowe-finance.io) is deployed from every commit pushed to `production`
