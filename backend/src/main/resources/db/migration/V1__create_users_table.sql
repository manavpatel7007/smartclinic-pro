CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE users (
                       id            UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
                       email         VARCHAR(255) NOT NULL UNIQUE,
                       password_hash VARCHAR(255) NOT NULL,
                       role          VARCHAR(50)  NOT NULL
                           CHECK (role IN ('ADMIN','DOCTOR','RECEPTIONIST','PATIENT')),
                       mfa_enabled   BOOLEAN      NOT NULL DEFAULT FALSE,
                       mfa_secret    VARCHAR(255),
                       is_active     BOOLEAN      NOT NULL DEFAULT TRUE,
                       created_at    TIMESTAMP    NOT NULL DEFAULT NOW(),
                       updated_at    TIMESTAMP    NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);

INSERT INTO users (email, password_hash, role)
VALUES (
           'admin@smartclinic.com',
           '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
           'ADMIN'
       );