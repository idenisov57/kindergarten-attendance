CREATE TABLE "public.parent" (
                                 "parent_id" serial NOT NULL,
                                 "fio" TEXT NOT NULL,
                                 "login" TEXT NOT NULL UNIQUE,
                                 "password" TEXT NOT NULL,
                                 "contact" TEXT,
                                 CONSTRAINT "parent_pk" PRIMARY KEY ("parent_id")
) WITH (
      OIDS=FALSE
      );



CREATE TABLE "public.job" (
                              "job_id" serial NOT NULL,
                              "name" TEXT NOT NULL,
                              CONSTRAINT "job_pk" PRIMARY KEY ("job_id")
) WITH (
      OIDS=FALSE
      );



CREATE TABLE "public.staff" (
                                "staff_id" serial NOT NULL,
                                "job_id" integer NOT NULL,
                                "login" TEXT NOT NULL UNIQUE,
                                "password" TEXT NOT NULL,
                                "fio" TEXT NOT NULL,
                                "contact" TEXT,
                                CONSTRAINT "staff_pk" PRIMARY KEY ("staff_id")
) WITH (
      OIDS=FALSE
      );



CREATE TABLE "public.group" (
                                "group_id" serial NOT NULL,
                                "name" integer,
                                CONSTRAINT "group_pk" PRIMARY KEY ("group_id")
) WITH (
      OIDS=FALSE
      );



CREATE TABLE "public.kid" (
                              "kid_id" serial NOT NULL,
                              "parent_id" integer NOT NULL,
                              "group_id" integer NOT NULL,
                              "fio" TEXT NOT NULL,
                              CONSTRAINT "kid_pk" PRIMARY KEY ("kid_id")
) WITH (
      OIDS=FALSE
      );



CREATE TABLE "public.attendance" (
                                     "date" DATE NOT NULL,
                                     "kid_id" integer NOT NULL,
                                     "presence" BOOLEAN NOT NULL,
                                     CONSTRAINT "attendance_pk" PRIMARY KEY ("date")
) WITH (
      OIDS=FALSE
      );



CREATE TABLE "public.staff_group" (
                                      "staff_id" integer NOT NULL,
                                      "group_id" integer NOT NULL,
                                      CONSTRAINT "staff_group_pk" PRIMARY KEY ("staff_id","group_id")
) WITH (
      OIDS=FALSE
      );






ALTER TABLE "public.staff" ADD CONSTRAINT "staff_fk0" FOREIGN KEY ("job_id") REFERENCES "public.job"("job_id");


ALTER TABLE "public.kid" ADD CONSTRAINT "kid_fk0" FOREIGN KEY ("parent_id") REFERENCES "public.parent"("parent_id");
ALTER TABLE "public.kid" ADD CONSTRAINT "kid_fk1" FOREIGN KEY ("group_id") REFERENCES "public.group"("group_id");

ALTER TABLE "public.attendance" ADD CONSTRAINT "attendance_fk0" FOREIGN KEY ("kid_id") REFERENCES "public.kid"("kid_id");

ALTER TABLE "public.staff_group" ADD CONSTRAINT "staff_group_fk0" FOREIGN KEY ("staff_id") REFERENCES "public.staff"("staff_id");
ALTER TABLE "public.staff_group" ADD CONSTRAINT "staff_group_fk1" FOREIGN KEY ("group_id") REFERENCES "public.group"("group_id");










