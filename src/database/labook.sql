-- Active: 1685989715638@@127.0.0.1@3306
CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        role ENUM NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL
    );

CREATE TABLE
    posts (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        creator_id TEXT NOT NULL,
        content TEXT NOT NULL,
        likes INTEGER DEFAULT(0) NOT NULL,
        dislikes INTEGER DEFAULT(0) NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL,
        updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
        FOREIGN KEY (creator_id) REFERENCES users(id)
            ON DELETE CASCADE 
            ON UPDATE CASCADE 
    );

CREATE TABLE
    likes_dislikes (
        user_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    );

    INSERT INTO users (id, name, email, password, role)
VALUES
    ("u001", "João", "joão@email.com", "123456", "ADMIN"),
    ("u002", "Letícia", "leticia@email.com", "456123", "NORMAL"),
    ("u003", "Lucas", "lucas@gmail.com", "654321", "NORMAL");

INSERT INTO posts (id, creator_id, content) 
VALUES
    ("p001", "u001", "Estou finalizando meu projeto! Uhuu!"),
    ("p002", "u002", "Será se vai funcionar isso aí? :c"),
    ("p003", "u003", "Status: Dormindo. Não me importune!");

INSERT INTO
likes_dislikes (user_id, post_id, like)
VALUES 
("u002", "p001", 1), 
("u003", "p001", 1),
("u002", "p002", 1), 
("u001", "p003", 1);


SELECT * FROM users;

SELECT * FROM posts;

SELECT * FROM likes_dislikes;

UPDATE posts
SET likes = 2
WHERE id = "p001";

UPDATE posts
SET likes = 1
WHERE id = "p002";

UPDATE posts
SET dislikes = 1
WHERE id = "p003";

SELECT
    posts.id,
    posts.creator_id,
    posts.content,
    posts.likes,
    posts.dislikes,
    posts.created_at,
    posts.updated_at,
    users.name AS creator_name
FROM posts
JOIN users
ON posts.creator_id = users.id;
