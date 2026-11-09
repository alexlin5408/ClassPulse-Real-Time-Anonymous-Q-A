-- Database Setup) --
-- Create 
CREATE TABLE sessions (
    SessionID   INT AUTO_INCREMENT PRIMARY KEY,
    SessionCode CHAR(8)  NOT NULL UNIQUE,
    Timestamp   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE students (
    StudentID   INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    DisplayName VARCHAR(50)  NOT NULL
)

CREATE TABLE interactions (
    InteractionID   INT AUTO_INCREMENT PRIMARY KEY,
    SessionID       INT         NOT NULL,
    ParentID        INT         NOT NULL DEFAULT -1,
    StudentID       INT         NULL,
    InteractionType VARCHAR(20) NOT NULL,
    Content         TEXT        NOT NULL,
    Timestamp       DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (SessionID) REFERENCES sessions(SessionID) ON DELETE CASCADE,
    FOREIGN KEY (StudentID) REFERENCES students(StudentID) ON DELETE CASCADE,

    INDEX idx_session_type (SessionID, InteractionType),
    INDEX idx_parent (ParentID)
)