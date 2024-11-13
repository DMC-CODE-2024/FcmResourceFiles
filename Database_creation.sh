source ~/.bash_profile

source $commonConfigurationFilePath
dbDecryptPassword=$(java -jar  ${APP_HOME}/encryption_utility/PasswordDecryptor-0.1.jar spring.datasource.password)

mysql  -h$dbIp -P$dbPort -u$dbUsername -p${dbDecryptPassword} $appdbName <<EOFMYSQL

 
CREATE TABLE `list_file_mgmt` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL,
  `modified_on` timestamp NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `source_server` varchar(20) NOT NULL,
  `list_type` varchar(20) NOT NULL,
  `operator_name` varchar(20) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `file_state` int NOT NULL,
  `record_count` int NOT NULL,
  `copy_status` int NOT NULL,
  `destination_path` varchar(500) NOT NULL,
  `destination_server` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `file_creation_pointer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `created_till` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);

insert into sys_param(tag,value,feature_name) values  ('ORGANISATION_ID','00092',' eir_file_creation');
insert into sys_param(tag,value,feature_name) values  ('NO_OF_OPERATORS','1', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('OPERATORS_1','AIRTEL', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('SOURCE_SERVER','127.0.0.1', ' eir_file_creation');

insert into sys_param(tag,value,feature_name)  values  ('ENABLE_BLACKED_LIST_FULL_FILE','YES', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('ENABLE_BLOCKED_TAC_FULL_FILE','YES', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('ENABLE_ALLOWED_TAC_FULL_FILE','YES', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('ENABLE_TRACKED_LIST_FULL_FILE','YES', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('ENABLE_EXCEPTION_LIST_FULL_FILE','YES', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('ENABLE_BLACKED_LIST_INCREMENT_FILE','YES', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('ENABLE_BLOCKED_TAC_INCREMENT_FILE','YES', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('ENABLE_ALLOWED_TAC_INCREMENT_FILE','YES', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('ENABLE_TRACKED_LIST_INCREMENT_FILE','YES', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('ENABLE_EXCEPTION_LIST_INCREMENT_FILE','YES', ' eir_file_creation');


insert into sys_param(tag,value,feature_name)  values  ('AIRTEL_NO_OF_DEST','2', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('AIRTEL_DEST_SERVER_1','127.0.0.1', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('AIRTEL_DEST_FILEPATH_DAILY_1','/home/airtel/daily', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('AIRTEL_DEST_FILEPATH_WEEKLY_1','/home/airtel/weekly', ' eir_file_creation');

insert into sys_param(tag,value,feature_name)  values  ('AIRTEL_DEST_SERVER_2','127.0.0.2', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('AIRTEL_DEST_FILEPATH_DAILY_2','/home/ere', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('AIRTEL_DEST_FILEPATH_WEEKLY_2','/home/ere', ' eir_file_creation');
insert into sys_param(tag,value,feature_name)  values  ('AIRTEL_SHORT_CODE','AI', ' eir_file_creation');

insert into sys_param(tag,value,feature_name)  values  ('AIRTEL_COPY_URL','http://159.223.159.153:9504/eirs/fileCopyApi', ' eir_file_creation'); 

EOFMYSQL
