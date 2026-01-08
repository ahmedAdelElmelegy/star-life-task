# 🔐 Fake Login API (Status Code **201 Only**)

This project uses a **fake authentication API** for testing login functionality using **email and password**.

⚠️ **Important Rule**
The login process is considered **successful ONLY if the API response status code is `201`**.

---

## 🌐 API Endpoint

```
POST https://api.escuelajs.co/api/v1/auth/login
```

---

## 📥 Request Body

```json
{
  "email": "john@mail.com",
  "password": "changeme"
}
```

---

## ✅ Success Condition

The login request is treated as **successful** only when:

* HTTP Status Code is **201**
* Response body is not null

### Example Success Response

```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

✔ When status code is **201**, the application:

* Parses the response data
* Stores authentication tokens if needed
* Emits **LoginSuccess** state

---

## ❌ Failure Condition

Login is considered **failed** when:

* Status code is **NOT 201**
* OR response body is null
* OR API returns an error

### Example Error Response

```json
{
  "statusCode": 401,
  "message": "Unauthorized"
}
```

❌ In this case:

* Login request fails
* Error message is shown to the user
* **LoginError** state is emitted

---

## 🧠 Notes

* This API is intended for **testing and development purposes only**
* Status code `201` is enforced intentionally to simulate strict backend validation
* Useful for:

  * Flutter authentication flows
  * Bloc / Cubit testing
  * MVVM Architecture projects

---

## 🛠 Test Credentials

| Email                                 | Password |
| ------------------------------------- | -------- |
| [john@mail.com](mailto:john@mail.com) | changeme |

---

## 📌 Example Tech Stack

* Flutter
* Dio
* Bloc / Cubit
* GetIt
* Fake REST API
* ScreenUtil
* pretty_dio_logger
* shared_preferences

---

If you are using this API in a Flutter project, make sure your login logic explicitly checks for **status code 201** before treating the request as successful.
