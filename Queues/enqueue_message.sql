CONNECT aq_user/aq_user

DECLARE
  l_enqueue_options     DBMS_AQ.enqueue_options_t;
  l_message_properties  DBMS_AQ.message_properties_t;
  l_message_handle      RAW(16);
  l_event_msg           AQ_ADMIN.event_msg_type;
BEGIN
  l_event_msg := AQ_ADMIN.event_msg_type('REPORTER', 1, 2);

  DBMS_AQ.enqueue(queue_name          => 'aq_admin.event_queue',        
                  enqueue_options     => l_enqueue_options,     
                  message_properties  => l_message_properties,   
                  payload             => l_event_msg,             
                  msgid               => l_message_handle);

  COMMIT;
END;
/
