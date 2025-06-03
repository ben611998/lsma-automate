CREATE TABLE Organization (
  id SERIAL PRIMARY KEY,
  org_name varchar,
  date_created timestamp,
  date_updated timestamp
);

CREATE TABLE Address (
  id SERIAL PRIMARY KEY,
  address_full varchar,
  number varchar,
  unit varchar,
  street varchar,
  latitute varchar,
  longitude varchar,
  date_created timestamp,
  date_updated timestamp
);

CREATE TABLE Neighbor (
  id SERIAL PRIMARY KEY,
  org_fk int,
  name_full varchar,
  first_name varchar,
  last_name varchar,
  address_fk int,
  phone int,
  email varchar,
  contact_method varchar,
  language_pref varchar,
  date_created timestamp,
  date_updated timestamp
);

CREATE TABLE Caller (
  id SERIAL PRIMARY KEY,
  name_full varchar,
  first_name varchar,
  last_name varchar,
  phone varchar,
  spanish boolean,
  date_created timestamp,
  date_updated timestamp
);

CREATE TABLE Outreach (
  id SERIAL PRIMARY KEY,
  neighbor_fk int,
  outreach_list_fk int,
  org_fk int,
  completed boolean,
  responded boolean,
  wants_bag int,
  wants_supps boolean,
  notes varchar,
  date_created timestamp,
  date_updated timestamp
);

CREATE TABLE Outreach_list (
  id SERIAL PRIMARY KEY,
  org_fk int,
  caller_fk int,
  status varchar,
  distro_date date,
  date_created timestamp,
  date_updated timestamp
);

CREATE TABLE Supplemental (
  id SERIAL PRIMARY KEY,
  item varchar,
  org_fk int,
  outreach_fk int,
  delivery_fk int,
  neighbor_fk int,
  ordered boolean,
  date_created timestamp,
  date_updated timestamp
);

CREATE TABLE Driver (
  id SERIAL PRIMARY KEY,
  name_full varchar,
  first_name varchar,
  last_name varchar,
  phone varchar,
  date_created timestamp,
  date_updated timestamp
);

CREATE TABLE Delivery (
  id SERIAL PRIMARY KEY,
  org_fk int,
  route_fk int,
  neighbor_fk int,
  notes varchar,
  completed boolean,
  bag_count int,
  date_created timestamp,
  date_updated timestamp
);

CREATE TABLE Route (
  id SERIAL PRIMARY KEY,
  org_fk int,
  driver_fk int,
  status varchar,
  distro_date timestamp,
  date_created timestamp,
  date_updated timestamp
);

ALTER TABLE Neighbor ADD FOREIGN KEY (org_fk) REFERENCES Organization (id);

ALTER TABLE Neighbor ADD FOREIGN KEY (address_fk) REFERENCES Address (id);

ALTER TABLE Outreach ADD FOREIGN KEY (neighbor_fk) REFERENCES Neighbor (id);

ALTER TABLE Outreach ADD FOREIGN KEY (outreach_list_fk) REFERENCES Outreach_list (id);

ALTER TABLE Outreach ADD FOREIGN KEY (org_fk) REFERENCES Organization (id);

ALTER TABLE Outreach_list ADD FOREIGN KEY (org_fk) REFERENCES Organization (id);

ALTER TABLE Outreach_list ADD FOREIGN KEY (caller_fk) REFERENCES Caller (id);

ALTER TABLE Supplemental ADD FOREIGN KEY (org_fk) REFERENCES Organization (id);

ALTER TABLE Supplemental ADD FOREIGN KEY (outreach_fk) REFERENCES Outreach (id);

ALTER TABLE Supplemental ADD FOREIGN KEY (delivery_fk) REFERENCES Delivery (id);

ALTER TABLE Supplemental ADD FOREIGN KEY (neighbor_fk) REFERENCES Neighbor (id);

ALTER TABLE Delivery ADD FOREIGN KEY (org_fk) REFERENCES Organization (id);

ALTER TABLE Delivery ADD FOREIGN KEY (route_fk) REFERENCES Route (id);

ALTER TABLE Delivery ADD FOREIGN KEY (neighbor_fk) REFERENCES Neighbor (id);

ALTER TABLE Route ADD FOREIGN KEY (org_fk) REFERENCES Organization (id);

ALTER TABLE Route ADD FOREIGN KEY (driver_fk) REFERENCES Driver (id);

insert into Organization (org_name, date_created, date_updated)
VALUES ('Logan Square Mutual Aid', NOW(),NOW());

SELECT * FROM Organization;