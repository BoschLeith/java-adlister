USE adlister_db;

CREATE TABLE users
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE ads(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(50),
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO users(username, email, password) VALUES ('Bosch', 'bosch@email.com', 'password');

INSERT INTO ads(user_id, title, description) VALUES (1, 'Test Title', 'Test Description');

# TRUNCATE ads;