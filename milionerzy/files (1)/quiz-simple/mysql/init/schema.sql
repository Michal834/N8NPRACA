CREATE TABLE IF NOT EXISTS quiz_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    domain VARCHAR(100) NOT NULL,
    score INT NOT NULL,
    total INT NOT NULL DEFAULT 4,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS quiz_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT NOT NULL,
    question TEXT NOT NULL,
    correct_answer VARCHAR(1) NOT NULL,
    user_answer VARCHAR(1),
    is_correct TINYINT(1) DEFAULT 0,
    FOREIGN KEY (session_id) REFERENCES quiz_sessions(id)
);
