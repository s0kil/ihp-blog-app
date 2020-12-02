

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

INSERT INTO public.posts (id, title, body, created_at) VALUES ('17f4cda9-e910-4fb4-8f42-341c0359147a', 'My New Post Title 1', '## Header h2', '2020-12-02 09:39:23.329584-05');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body) VALUES ('daa6f2b2-095c-46d0-9995-b195e7322f8b', '17f4cda9-e910-4fb4-8f42-341c0359147a', 'Daniel', 'Good Stuff!');
INSERT INTO public.comments (id, post_id, author, body) VALUES ('b8a81735-4466-4f20-b5d2-49430ab2fa2e', '17f4cda9-e910-4fb4-8f42-341c0359147a', 'Daniel', 'Comment #1');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


