# Labels Overweight
[![Github CI](https://github.com/abimaelmartell/labels-overweight/workflows/Ruby/badge.svg)](https://github.com/abimaelmartell/labels-overweight/actions)

## Usage
To run you need to setup Fedex Credentials as environment variables, or for development using the `.env` file.

To post the labels json you can use the `labels/batch_create` endpoint like this:

```
curl -X PUT -d @db/labels.json -H 'Content-Type: application/json' http://localhost:3000/labels/batch_create
```

Or you can use the rake task
```
rake load_labels_json:load
```

To update labels with carrier data you can use
```
rake fetch_label_data:fetch
```

To see the report you can just go to `http://localhost:3000`, the ones with a red background are the ones with overweight parcel.

## Tests
Tests are written using Rspec, so you can run

```
rspec
```
