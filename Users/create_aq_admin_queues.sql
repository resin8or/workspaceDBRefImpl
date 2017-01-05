CONNECT aq_admin/aq_admin

EXECUTE DBMS_AQADM.create_queue_table ( -
   queue_table            =>  'aq_admin.event_queue_tab', -
   queue_payload_type     =>  'aq_admin.event_msg_type');

EXECUTE DBMS_AQADM.create_queue ( -
   queue_name            =>  'aq_admin.event_queue', -
   queue_table           =>  'aq_admin.event_queue_tab');

EXECUTE DBMS_AQADM.start_queue ( -
   queue_name         => 'aq_admin.event_queue', -
   enqueue            => TRUE);

-- grant privileges
EXECUTE DBMS_AQADM.grant_queue_privilege ( -
   privilege     =>     'ALL', -
   queue_name    =>     'aq_admin.event_queue', -
   grantee       =>     'aq_user', -
   grant_option  =>      FALSE);