CONNECT aq_user/aq_user

SET SERVEROUTPUT ON

DECLARE
  l_dequeue_options     DBMS_AQ.dequeue_options_t;
  l_message_properties  DBMS_AQ.message_properties_t;
  l_message_handle      RAW(16);
  l_event_msg           AQ_ADMIN.event_msg_type;
BEGIN
  DBMS_AQ.dequeue(queue_name          => 'aq_admin.event_queue',
                  dequeue_options     => l_dequeue_options,
                  message_properties  => l_message_properties,
                  payload             => l_event_msg,
                  msgid               => l_message_handle);

  DBMS_OUTPUT.put_line ('Event Name          : ' || l_event_msg.name);
  DBMS_OUTPUT.put_line ('Event Current Status: ' || l_event_msg.current_status);
  DBMS_OUTPUT.put_line ('Event Next Status   : ' || l_event_msg.next_status);
  COMMIT;
END;
/
