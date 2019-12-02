SET SCHEMA 'zafira';

INSERT INTO SETTINGS (NAME, VALUE) VALUES
    ('KEY', ''),
    ('CRYPTO_KEY_SIZE', '128'),
    ('CRYPTO_KEY_TYPE', 'AES'),
    ('COMPANY_LOGO_URL', null),
    ('LAST_ALTER_VERSION', '125');

INSERT INTO PROJECTS (NAME, DESCRIPTION) VALUES ('UNKNOWN', '');


DO $$

    DECLARE INTEGRATION_GROUP_ID INTEGRATION_GROUPS.ID%TYPE;
    DECLARE INTEGRATION_TYPE_ID INTEGRATION_TYPES.ID%TYPE;
    DECLARE INTEGRATION_ID INTEGRATIONS.ID%TYPE;
    DECLARE INTEGRATION_PARAM_ID INTEGRATION_PARAMS.ID%TYPE;

    BEGIN

        -- Google
        INSERT INTO INTEGRATION_GROUPS(NAME, DISPLAY_NAME, ICON_URL, MULTIPLE_ALLOWED) VALUES ('GOOGLE', 'Google', '', FALSE) RETURNING ID INTO INTEGRATION_GROUP_ID;
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('GOOGLE', 'Google', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('GOOGLE', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('GOOGLE_CLIENT_SECRET_ORIGIN', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        --      Mail
        INSERT INTO INTEGRATION_GROUPS(NAME, DISPLAY_NAME, ICON_URL, MULTIPLE_ALLOWED) VALUES ('MAIL', 'Mail', '', FALSE) RETURNING ID INTO INTEGRATION_GROUP_ID;
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('EMAIL', 'Mail', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('EMAIL', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('EMAIL_HOST', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('EMAIL_PORT', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('EMAIL_USER', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('EMAIL_PASSWORD', TRUE, INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('EMAIL_FROM_ADDRESS', FALSE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        --      Slack
        INSERT INTO INTEGRATION_GROUPS(NAME, DISPLAY_NAME, ICON_URL, MULTIPLE_ALLOWED) VALUES ('SLACK', 'Slack', '', FALSE) RETURNING ID INTO INTEGRATION_GROUP_ID;
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('SLACK', 'Slack', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('SLACK', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('SLACK_WEB_HOOK_URL', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- Amazon
        INSERT INTO INTEGRATION_GROUPS(NAME, DISPLAY_NAME, ICON_URL, MULTIPLE_ALLOWED) VALUES ('STORAGE_PROVIDER', 'Storage Provider', '', FALSE) RETURNING ID INTO INTEGRATION_GROUP_ID;
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('AMAZON', 'Amazon', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('AMAZON', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('AMAZON_ACCESS_KEY', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('AMAZON_SECRET_KEY', TRUE, INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('AMAZON_BUCKET', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('AMAZON_REGION', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- LDAP
        INSERT INTO INTEGRATION_GROUPS(NAME, DISPLAY_NAME, ICON_URL, MULTIPLE_ALLOWED) VALUES ('ACCESS_MANAGEMENT', 'Access Management', '', FALSE) RETURNING ID INTO INTEGRATION_GROUP_ID;
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('LDAP', 'LDAP', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('LDAP', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('LDAP_URL', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('LDAP_MANAGER_USER', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('LDAP_MANAGER_PASSWORD', TRUE, INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('LDAP_DN', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('LDAP_SEARCH_FILTER', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- Selenium
        INSERT INTO INTEGRATION_GROUPS(NAME, DISPLAY_NAME, ICON_URL, MULTIPLE_ALLOWED) VALUES ('TEST_AUTOMATION_TOOL', 'Test Environment Provider', '', FALSE) RETURNING ID INTO INTEGRATION_GROUP_ID;
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('SELENIUM', 'Selenium', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('SELENIUM', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('SELENIUM_URL', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('SELENIUM_USER', FALSE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('SELENIUM_PASSWORD', FALSE, INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- Zebrunner
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('ZEBRUNNER', 'ZEBRUNNER', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, BACK_REFERENCE_ID, IS_DEFAULT, ENABLED, INTEGRATION_TYPE_ID) VALUES ('ZEBRUNNER', 'ZEBRUNNER', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('ZEBRUNNER_URL', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('ZEBRUNNER_USER', FALSE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('ZEBRUNNER_PASSWORD', FALSE, TRUE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- Browserstack
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('BROWSERSTACK', 'BROWSERSTACK', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, BACK_REFERENCE_ID, IS_DEFAULT, ENABLED, INTEGRATION_TYPE_ID) VALUES ('BROWSERSTACK', 'BROWSERSTACK', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('BROWSERSTACK_URL', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('BROWSERSTACK_USER', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('BROWSERSTACK_ACCESS_KEY', TRUE, TRUE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- Mcloud
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('MCLOUD', 'MCLOUD', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, BACK_REFERENCE_ID, IS_DEFAULT, ENABLED, INTEGRATION_TYPE_ID) VALUES ('MCLOUD', 'MCLOUD', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('MCLOUD_URL', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('MCLOUD_USER', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('MCLOUD_PASSWORD', TRUE, TRUE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- Saucelabs
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('SAUCELABS', 'SAUCELABS', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, BACK_REFERENCE_ID, IS_DEFAULT, ENABLED, INTEGRATION_TYPE_ID) VALUES ('SAUCELABS', 'SAUCELABS', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('SAUCELABS_URL', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('SAUCELABS_USER', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('SAUCELABS_PASSWORD', TRUE, TRUE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- Aerokube
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('AEROKUBE', 'AEROKUBE', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, BACK_REFERENCE_ID, IS_DEFAULT, ENABLED, INTEGRATION_TYPE_ID) VALUES ('AEROKUBE', 'AEROKUBE', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('AEROKUBE_URL', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('AEROKUBE_USER', TRUE, FALSE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, NEED_ENCRYPTION, INTEGRATION_TYPE_ID) VALUES ('AEROKUBE_PASSWORD', TRUE, TRUE, INTEGRATION_TYPE_ID) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- Jenkins
        INSERT INTO INTEGRATION_GROUPS(NAME, DISPLAY_NAME, ICON_URL, MULTIPLE_ALLOWED) VALUES ('AUTOMATION_SERVER', 'CI / Automation Server', '', TRUE) RETURNING ID INTO INTEGRATION_GROUP_ID;
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('JENKINS', 'Jenkins', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('JENKINS', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('JENKINS_URL', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('JENKINS_USER', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('JENKINS_API_TOKEN_OR_PASSWORD', TRUE, INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('JENKINS_FOLDER', FALSE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        -- Jira, testrail, qtest
        INSERT INTO INTEGRATION_GROUPS(NAME, DISPLAY_NAME, ICON_URL, MULTIPLE_ALLOWED) VALUES ('TEST_CASE_MANAGEMENT', 'Test Case Management', '', FALSE) RETURNING ID INTO INTEGRATION_GROUP_ID;
        --      Jira
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('JIRA', 'Jira', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('JIRA', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('JIRA_URL', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('JIRA_USER', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('JIRA_PASSWORD', TRUE, INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('JIRA_CLOSED_STATUS', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        --      TestRail
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('TESTRAIL', 'TestRail', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('TESTRAIL', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('TESTRAIL_URL', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

        --      qTest
        INSERT INTO INTEGRATION_TYPES(NAME, DISPLAY_NAME, ICON_URL, INTEGRATION_GROUP_ID) VALUES ('QTEST', 'qTest', '', INTEGRATION_GROUP_ID) RETURNING ID INTO INTEGRATION_TYPE_ID;
        INSERT INTO INTEGRATIONS(NAME, INTEGRATION_TYPE_ID, is_default) VALUES ('QTEST', INTEGRATION_TYPE_ID, TRUE) RETURNING ID INTO INTEGRATION_ID;

        INSERT INTO INTEGRATION_PARAMS(NAME, MANDATORY, INTEGRATION_TYPE_ID, NEED_ENCRYPTION) VALUES ('QTEST_URL', TRUE, INTEGRATION_TYPE_ID, FALSE) RETURNING ID INTO INTEGRATION_PARAM_ID;
        INSERT INTO INTEGRATION_SETTINGS(INTEGRATION_ID, INTEGRATION_PARAM_ID) VALUES (INTEGRATION_ID, INTEGRATION_PARAM_ID);

END$$;


DO $$

  DECLARE SUPER_ADMINS_GROUP_ID GROUPS.id%TYPE;
  DECLARE ADMINS_GROUP_ID GROUPS.id%TYPE;
  DECLARE USERS_GROUP_ID GROUPS.id%TYPE;

  DECLARE USER_ID USER_PREFERENCES.id%TYPE;
  DECLARE PERMISSION_ID PERMISSIONS.id%TYPE;

  BEGIN

    INSERT INTO GROUPS (NAME, ROLE, INVITABLE) VALUES ('Super admins', 'ROLE_ADMIN', FALSE) RETURNING id INTO SUPER_ADMINS_GROUP_ID;
    INSERT INTO GROUPS (NAME, ROLE) VALUES ('Admins', 'ROLE_ADMIN') RETURNING id INTO ADMINS_GROUP_ID;
    INSERT INTO GROUPS (NAME, ROLE) VALUES ('Users', 'ROLE_USER') RETURNING id INTO USERS_GROUP_ID;

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('VIEW_HIDDEN_DASHBOARDS', 'DASHBOARDS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_DASHBOARDS', 'DASHBOARDS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_WIDGETS', 'DASHBOARDS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_TEST_RUN_VIEWS', 'TEST_RUN_VIEWS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('VIEW_TEST_RUN_VIEWS', 'TEST_RUN_VIEWS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_TEST_RUNS', 'TEST_RUNS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (USERS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('TEST_RUNS_CI', 'TEST_RUNS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (USERS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_TESTS', 'TEST_RUNS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (USERS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_USERS', 'USERS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_USER_GROUPS', 'USERS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('VIEW_USERS', 'USERS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_PROJECTS', 'PROJECTS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (USERS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_INTEGRATIONS', 'INTEGRATIONS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('VIEW_INTEGRATIONS', 'INTEGRATIONS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('INVITE_USERS', 'INVITATIONS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_INVITATIONS', 'INVITATIONS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('MODIFY_LAUNCHERS', 'LAUNCHERS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (USERS_GROUP_ID, PERMISSION_ID);

    INSERT INTO PERMISSIONS (NAME, BLOCK) VALUES ('VIEW_LAUNCHERS', 'LAUNCHERS') RETURNING id INTO PERMISSION_ID;
    INSERT INTO GROUP_PERMISSIONS (GROUP_ID, PERMISSION_ID) VALUES (SUPER_ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (ADMINS_GROUP_ID, PERMISSION_ID),
                                                                   (USERS_GROUP_ID, PERMISSION_ID);

    INSERT INTO USERS (USERNAME) VALUES ('anonymous') RETURNING id INTO USER_ID;
    INSERT INTO USER_PREFERENCES (NAME, VALUE, USER_ID) VALUES
        ('REFRESH_INTERVAL', '0', USER_ID),
        ('DEFAULT_DASHBOARD', 'General', USER_ID),
        ('THEME', '32', USER_ID);

END$$;
