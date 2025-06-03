CREATE TABLE "Organization" (
  "id" int PRIMARY KEY,
  "org_name" varchar,
  "date_created" datetime,
  "date_updated" datetime
);

CREATE TABLE "Address" (
  "id" int PRIMARY KEY,
  "address_full" varchar,
  "number" varchar,
  "unit" varchar,
  "street" varchar,
  "latitute" varchar,
  "longitude" varchar,
  "date_created" datetime,
  "date_updated" datetime
);

CREATE TABLE "Neighbor" (
  "id" int PRIMARY KEY,
  "org_fk" int,
  "name_full" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "address_fk" varchar,
  "phone" int,
  "email" varchar,
  "contact_method" varchar,
  "language_pref" varchar,
  "date_created" datetime,
  "date_updated" datetime
);

CREATE TABLE "Caller" (
  "id" int PRIMARY KEY,
  "name_full" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "phone" varchar,
  "spanish" binary,
  "date_created" datetime,
  "date_updated" datetime
);

CREATE TABLE "Outreach" (
  "id" int PRIMARY KEY,
  "neighbor_fk" int,
  "outreach_list_fk" int,
  "org_fk" int,
  "completed" binary,
  "responded" binary,
  "wants_bag" int,
  "wants_supps" binary,
  "notes" varchar,
  "date_created" datetime,
  "date_updated" datetime
);

CREATE TABLE "Outreach_list" (
  "id" int PRIMARY KEY,
  "org_fk" int,
  "caller_fk" int,
  "status" varchar,
  "distro_date" date,
  "date_created" datetime,
  "date_updated" datetime
);

CREATE TABLE "Supplemental" (
  "id" int PRIMARY KEY,
  "item" varchar,
  "org_fk" int,
  "outreach_fk" int,
  "delivery_fk" int,
  "neighbor_fk" int,
  "ordered" binary,
  "date_created" datetime,
  "date_updated" datetime
);

CREATE TABLE "Driver" (
  "id" int PRIMARY KEY,
  "name_full" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "phone" varchar,
  "date_created" datetime,
  "date_updated" datetime
);

CREATE TABLE "Delivery" (
  "id" int PRIMARY KEY,
  "org_fk" int,
  "route_fk" int,
  "neighbor_fk" int,
  "notes" varchar,
  "completed" binary,
  "bag_count" int,
  "date_created" datetime,
  "date_updated" datetime
);

CREATE TABLE "Route" (
  "id" int PRIMARY KEY,
  "org_fk" int,
  "driver_fk" int,
  "status" varchar,
  "distro_date" datetime,
  "date_created" datetime,
  "date_updated" datetime
);

ALTER TABLE "Neighbor" ADD FOREIGN KEY ("org_fk") REFERENCES "Organization" ("id");

ALTER TABLE "Neighbor" ADD FOREIGN KEY ("address_fk") REFERENCES "Address" ("id");

ALTER TABLE "Outreach" ADD FOREIGN KEY ("neighbor_fk") REFERENCES "Neighbor" ("id");

ALTER TABLE "Outreach" ADD FOREIGN KEY ("outreach_list_fk") REFERENCES "Outreach_list" ("id");

ALTER TABLE "Outreach" ADD FOREIGN KEY ("org_fk") REFERENCES "Organization" ("id");

ALTER TABLE "Outreach_list" ADD FOREIGN KEY ("org_fk") REFERENCES "Organization" ("id");

ALTER TABLE "Outreach_list" ADD FOREIGN KEY ("caller_fk") REFERENCES "Caller" ("id");

ALTER TABLE "Supplemental" ADD FOREIGN KEY ("org_fk") REFERENCES "Organization" ("id");

ALTER TABLE "Supplemental" ADD FOREIGN KEY ("outreach_fk") REFERENCES "Outreach" ("id");

ALTER TABLE "Supplemental" ADD FOREIGN KEY ("delivery_fk") REFERENCES "Delivery" ("id");

ALTER TABLE "Supplemental" ADD FOREIGN KEY ("neighbor_fk") REFERENCES "Neighbor" ("id");

ALTER TABLE "Delivery" ADD FOREIGN KEY ("org_fk") REFERENCES "Organization" ("id");

ALTER TABLE "Delivery" ADD FOREIGN KEY ("route_fk") REFERENCES "Route" ("id");

ALTER TABLE "Delivery" ADD FOREIGN KEY ("neighbor_fk") REFERENCES "Neighbor" ("id");

ALTER TABLE "Route" ADD FOREIGN KEY ("org_fk") REFERENCES "Organization" ("id");

ALTER TABLE "Route" ADD FOREIGN KEY ("driver_fk") REFERENCES "Driver" ("id");
