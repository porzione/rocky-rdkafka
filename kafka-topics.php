<?php

$conf = new RdKafka\Conf();
$conf->set('security.protocol', 'SASL_SSL');
$conf->set('sasl.mechanisms', 'PLAIN');
$conf->set('sasl.username', getenv('KUSER'));
$conf->set('sasl.password', getenv('KPASSWORD'));
$conf->set('ssl.ca.location', 'ca-cert');
$conf->set('ssl.cipher.suites', 'TLSv1.2');
$conf->set('bootstrap.servers', getenv('KSERVERS'));

$conf->set('group.id', 'myConsumerGroup');

$consumer = new RdKafka\KafkaConsumer($conf);
$md = $consumer->getMetadata(false, NULL, 60e3);
$topics = $md->getTopics();
print_r($topics);

?>
