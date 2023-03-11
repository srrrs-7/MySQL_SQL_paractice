
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

CREATE TABLE items (
  item_id INT PRIMARY KEY,
  item_name VARCHAR(50),
  item_description TEXT,
  price DECIMAL(10, 2),
  stock INT,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

CREATE TABLE users (
  user_id INT PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(50),
  email VARCHAR(100)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  user_id INT,
  order_date DATETIME,
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE order_details (
  order_detail_id INT PRIMARY KEY,
  order_id INT,
  item_id INT,
  unit_price DECIMAL(10, 2),
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (item_id) REFERENCES items (item_id)
);

-- 外部キーに注意が必要
INSERT INTO categories (category_id, category_name) VALUES
(1, 'ヘアケア'),
(2, 'ボディケア'),
(3, 'スキンケア'),
(4, 'メイクアップ');

INSERT INTO items (item_id, item_name, item_description, price, stock, category_id) VALUES
(1, 'シャンプー', '髪を清潔にするシャンプーです。', 1000, 50, 1),
(2, 'コンディショナー', '髪をしっとりさせるコンディショナーです。', 1200, 40, 1),
(3, 'ボディソープ', '肌を清潔にするボディソープです。', 800, 60, 2),
(4, 'フェイスクリーム', '保湿効果のあるフェイスクリームです。', 1500, 30, 3),
(5, '口紅', '唇を鮮やかに彩る口紅です。', 2000, 20, 4);

INSERT INTO users (user_id, username, password, email) VALUES
(1, 'testuser1', 'password1', 'testuser1@example.com'),
(2, 'testuser2', 'password2', 'testuser2@example.com');

INSERT INTO orders (order_id, user_id) VALUES
(1, 1),
(2, 2);

INSERT INTO order_details (order_detail_id, order_id, item_id, unit_price, quantity) VALUES
(1, 1, 1, 1000, 2),
(2, 1, 2, 1200, 1),
(3, 2, 3, 800, 3),
(4, 2, 4, 1500, 2),
(5, 2, 5, 2000, 1);