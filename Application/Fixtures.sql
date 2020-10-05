

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at) VALUES ('503bc1bc-0e8d-4556-9bb3-c70ee09464f0', 'My New Post Title 1', 'My New Post Body', '2020-10-04 22:07:42.428126-04');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('04132311-0138-479a-8744-481da5ba3e96', 'My New Post Title 2', 'My New Post Body', '2020-10-04 22:07:42.429231-04');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('9bbd61e9-156e-48f1-bcba-d86b69b7cb3c', 'My New Post Title 3', '## Here is The Body With Code Block
```javascript
console.log("JavaScript")
```', '2020-10-04 22:27:35.135127-04');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('3136fd0c-ef30-4cff-9ccd-d2187623d380', 'My New Post Title 4', '#### This is an H4', '2020-10-04 22:33:45.872834-04');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body) VALUES ('3e01b452-eae3-44de-a010-df545f7a8f95', '3136fd0c-ef30-4cff-9ccd-d2187623d380', 'Daniel', 'Nice Post!');
INSERT INTO public.comments (id, post_id, author, body) VALUES ('18eab1d3-323c-4f69-8e18-f441303a0ee1', '3136fd0c-ef30-4cff-9ccd-d2187623d380', 'Daniel', 'Cool Post');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


