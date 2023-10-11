# Installation

---

## Table of Contents <!-- omit in toc -->

- [Comfortable development](#comfortable-development)
- [Quick run](#quick-run)
- [Links](#links)

---

## Comfortable development

1. Clone repository

   ```bash
   git clone --depth 1 git@github.com:ducmanh86/nestjs-boilerplate.git my-app
   ```

2. Go to folder, and copy `env-example` as `.env`.

   ```bash
   cd my-app/
   cp env-example .env
   ```

3. Change `DATABASE_HOST=postgres` to `DATABASE_HOST=localhost`

   Change `MAIL_HOST=maildev` to `MAIL_HOST=localhost`

4. Run additional container:

   ```bash
   docker compose up -d postgres adminer maildev
   ```

5. Install dependency

   ```bash
   npm install
   ```

6. Run migrations

   ```bash
   npm run migration:run
   ```

7. Run seeds

   ```bash
   npm run seed:run
   ```

8. Run app in dev mode

   ```bash
   npm run start:dev
   ```

9. Open <http://localhost:3000>

---

## Quick run

If you want quick run your app, you can use following commands:

1. Clone repository

   ```bash
   git clone --depth 1 git@github.com:ducmanh86/nestjs-boilerplate.git my-app
   ```

2. Go to folder, and copy `env-example` as `.env`.

   ```bash
   cd my-app/
   cp env-example .env
   ```

3. Run containers

   ```bash
   docker compose up -d
   ```

4. For check status run

   ```bash
   docker compose logs
   ```

5. Open <http://localhost:3000>

---

## Links

- Swagger (API docs): <http://localhost:3000/docs>
- Maildev: <http://localhost:1080>

---

Previous: [Introduction](introduction.md)

Next: [Working with database](database.md)
