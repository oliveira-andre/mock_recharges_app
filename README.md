# Mock Recharges App

## Requests

### Customers

<details>
  <summary>Create</summary>

  curl
  ```
  curl -kv -H 'content-type: application/json' -X 'POST' -d '{ "customer": { "fullname": "Andre Oliveira", "msisdn": "11999999999" } }' 'http://localhost:3000/api/v1/customers' | jq
  ```

  success response code: `201 CREATED`

  response
  ```json
  {}
  ```

  error response code: `422 UNPROCESSABLE ENTITY`

  error response
  ```json
  {
    "errors": [
      "Msisdn has already been taken"
    ]
  }
  ```
</details>

<details>
  <summary>Show</summary>

  curl
  ```
  curl -kv -H 'content-type: application/json' -X 'GET' 'http://localhost:3000/api/v1/customers/11999999999' | jq
  ```

  success response code: `200 OK`

  success response
  ```json
  {
    "fullname": "Andre Oliveira",
    "msisdn": "11999999999",
    "cards": [
      {
        "bin": "440568",
        "last_digits": "4407",
        "status": "active"
      },
      {
        "bin": "440568",
        "last_digits": "4406",
        "status": "denied"
      }
    ],
    "history": [
      {
        "amount": 1000,
        "token": "eyJhbGciOiJub25lIn0.eyJhbW91bnQiOjEwMDAsImNyZWF0ZWRfYXQiOiIyMDIxLTAzLTAyIDAyOjI2OjU0IFVUQyJ9."
      }
    ]
  }
  ```

  error response code: `404 NOT FOUND`

  error response
  ```json
  {
    "errors": [
      "customer not found"
    ]
  }
  ```
</details>

### Cards

<details>
  <summary>Create</summary>

  curl
  ```
  curl -kv -H 'content-type: application/json' -X 'POST' -d '{ "card": { "bin": "440568", "last_digits": "4407" } }' 'http://localhost:3000/api/v1/customers/11999999999/cards'
  ```

  success response code: `201 CREATED`

  success response
  ```json
  {}
  ```

  error response code: `422 UNPROCESSABLE ENTITY`

  error response
  ```json
  {
    "errors": [
      "Bin has already been taken"
    ]
  }
  ```
  </details>

### Recharges

<details>
  <summary>Create</summary>

  curl
  ```
  curl -kv -H 'content-type: application/json' -X 'POST' -d '{ "recharge": { "amount": 1000, "bin": "440568", "last_digits": "4407" } }' 'http://localhost:3000/api/v1/customers/11999999999/recharges'
  ```

  success response code: `201 CREATED`

  success response
  ```json
  {}
  ```

  error response code: `422 UNPROCESSABLE ENTITY`

  error response
  ```json
  {
    "errors": [
      "Card your card is blacklisted"
    ]
  }
  ```
  </details>
