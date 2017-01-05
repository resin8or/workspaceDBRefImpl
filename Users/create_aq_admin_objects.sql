-- create aq ref impl objects
CONNECT aq_admin/aq_admin

CREATE OR REPLACE TYPE event_msg_type AS OBJECT (
  name            VARCHAR2(10),
  current_status  NUMBER(5),
  next_status     NUMBER(5)
);
/
