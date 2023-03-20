CREATE TABLE IF NOT EXISTS users (
  "id" SERIAL PRIMARY KEY,
  "username" VARCHAR(255) UNIQUE NOT NULL,
  "email" VARCHAR(255) UNIQUE NOT NULL,
  "password" VARCHAR(255) NOT NULL,
  "pictureUrl" TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS linkrs (
  "id" SERIAL PRIMARY KEY,
  "linkUrl" TEXT NOT NULL,
  "text" TEXT,
  "userId" BIGINT NOT NULL,
  CONSTRAINT fk_users
    FOREIGN KEY("userId") 
	    REFERENCES users("id")
	    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS likes (
  "id" SERIAL PRIMARY KEY,
  "likerId" BIGINT NOT NULL,
  "linkId" BIGINT NOT NULL,
  UNIQUE ("likerId","linkId"),
  CONSTRAINT fk_liker
    FOREIGN KEY("likerId") 
	    REFERENCES users("id")
	    ON DELETE CASCADE,
  CONSTRAINT fk_link
    FOREIGN KEY("linkId") 
	    REFERENCES linkrs("id")
	    ON DELETE CASCADE
);

  CREATE TABLE IF NOT EXISTS hashtags (
    "id" SERIAL PRIMARY KEY,
    "hashtag" VARCHAR(255) UNIQUE NOT NULL,
    "counter" BIGINT NOT NULL
  );

CREATE TABLE IF NOT EXISTS hashLinkrs (
  "id" SERIAL PRIMARY KEY,
  "hashtagId" BIGINT NOT NULL,
  "linkId" BIGINT NOT NULL,
  CONSTRAINT fk_hashtagId
    FOREIGN KEY("hashtagId") 
	    REFERENCES hashtags("id")
	    ON DELETE CASCADE,
  CONSTRAINT fk_link
    FOREIGN KEY("linkId") 
	    REFERENCES linkrs("id")
	    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS follows (
  "id" SERIAL PRIMARY KEY,
  "followerId" BIGINT NOT NULL,
  "followingId" BIGINT NOT NULL,
  CONSTRAINT fk_followerId
    FOREIGN KEY("followerId") 
	    REFERENCES users("id")
	    ON DELETE CASCADE,
  CONSTRAINT fk_followingId
    FOREIGN KEY("followingId") 
	    REFERENCES users("id")
	    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS reposts (
  "id" SERIAL PRIMARY KEY,
  "linkrId" BIGINT NOT NULL,
  "reposterId" BIGINT NOT NULL,
  CONSTRAINT fk_linkrId
    FOREIGN KEY("linkrId") 
	    REFERENCES linkrs("id")
	    ON DELETE CASCADE,
  CONSTRAINT fk_reposterId
    FOREIGN KEY("reposterId") 
	    REFERENCES users("id")
	    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comments (
  "id" SERIAL PRIMARY KEY,
  "commenterId" BIGINT NOT NULL,
  "linkId" BIGINT NOT NULL,
  "commentText" TEXT NOT NULL,
  CONSTRAINT fk_commenter
    FOREIGN KEY("commenterId") 
	    REFERENCES users("id")
	    ON DELETE CASCADE,
  CONSTRAINT fk_link
    FOREIGN KEY("linkId") 
	    REFERENCES linkrs("id")
	    ON DELETE CASCADE
);

