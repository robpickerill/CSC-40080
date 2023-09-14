CREATE DATABASE "csc40080week2";
\connect "csc40080week2";
CREATE TABLE IF NOT EXISTS "customer" (
    "customerName" varchar(255) NOT NULL,
    "street" varchar(255) NOT NULL,
    "customerCity" varchar(255) NOT NULL,
    PRIMARY KEY ("customerName")
);
CREATE TABLE IF NOT EXISTS "branch" (
    "branchName" varchar(255) NOT NULL,
    "branchCity" varchar(255) NOT NULL,
    "assets" decimal(10, 2) DEFAULT 0,
    PRIMARY KEY ("branchName")
);
CREATE TABLE IF NOT EXISTS "deposit" (
    "customerName" varchar(255) NOT NULL,
    "branchName" varchar(255) NOT NULL,
    "accountNumber" int NOT NULL,
    "balance" decimal(10, 2) DEFAULT 0,
    PRIMARY KEY ("accountNumber"),
    CONSTRAINT "fk_customer_deposit" FOREIGN KEY ("customerName") REFERENCES "customer"("customerName") ON DELETE CASCADE,
    CONSTRAINT "fk_branch_deposit" FOREIGN KEY ("branchName") REFERENCES "branch"("branchName") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "loan" (
    "customerName" varchar(255) NOT NULL,
    "branchName" varchar(255) NOT NULL,
    "loanNumber" int NOT NULL,
    "amount" decimal(10, 2) DEFAULT 0,
    PRIMARY KEY ("loanNumber"),
    CONSTRAINT "fk_customer_loan" FOREIGN KEY ("customerName") REFERENCES "customer"("customerName") ON DELETE CASCADE,
    CONSTRAINT "fk_branch_loan" FOREIGN KEY ("branchName") REFERENCES "branch"("branchName") ON DELETE CASCADE
);
