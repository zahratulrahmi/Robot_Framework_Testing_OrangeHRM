*** Settings ***
Library           Selenium2Library

*** Variables ***
${Ttl_LoginPanel}    id=logInPanelHeading
${Txt_Username}    id=txtUsername
${Txt_Password}    id=txtPassword
${Btn_Login}      id=btnLogin
${Ttl_Welcome}    id=welcome
${Menu_Admin}     id=menu_admin_viewAdminModule
${Ttl_Admin_SystemUsers}    xpath=//*[@id=\"systemUser-information\"]/div[1]/h1
${Admin_SelectRole}    name=searchSystemUser[userType]
${Btn_Admin_Search}    id=searchBtn
${Btn_Admin_Reset}    id=resetBtn
${Txt_Admin_SearchUsername}    id=searchSystemUser_userName
${Ttl_Admin_SearchUsername}    xpath=//*[@id="resultTable"]/tbody/tr/td[2]/a
${Menu_Nationality}    id=menu_admin_nationality
${Btn_Nationality_Add}    id=btnAdd
${Ttl_Nationality_Nationalities}    xpath=//*[@id="search-results"]/div[1]/h1
${Txt_Nationality_Name}    id=nationality_name
${Btn_Natinality_Save}    id=btnSave
${Ttl_Nationality_aazahra}    xpath=//*[@id="resultTable"]/tbody/tr[1]/td[2]/a
${Chk_Nationality_Name}    name=chkSelectRow[]
${Btn_Nationality_Delete}    id=btnDelete
${Btn_Nationality_Delete_OK}    id=dialogDeleteBtn
${Ttl_Logout}     xpath=//*[@id="welcome-menu"]/ul/li[2]/a

*** Test Cases ***
TC_NavigateToURL
    [Documentation]    This test case is to navigate to URL https://opensource-demo.orangehrmlive.com/
    Open Browser    https://opensource-demo.orangehrmlive.com/    chrome
    Element Should Be Visible    ${Ttl_LoginPanel}
    Maximize Browser Window

TC_Login
    [Documentation]    This test case used to valid login
    Input Text    ${Txt_Username}    Admin
    Input Text    ${Txt_Password}    admin123
    Click Button    ${Btn_Login}
    Element Should Be Visible    ${Ttl_Welcome}

TC_SearchUser
    [Documentation]    This test case used to search user
    Click Element    ${Menu_Admin}
    Element Should Be Visible    ${Ttl_Admin_SystemUsers}
    Select From List By Value    ${Admin_SelectRole}    2
    Click Button    ${Btn_Admin_Search}
    Click Button    ${Btn_Admin_Reset}
    Input Text    ${Txt_Admin_SearchUsername}    Admin
    Click Button    ${Btn_Admin_Search}
    Element Should Be Visible    ${Ttl_Admin_SearchUsername}

TC_AddDeleteNationality
    [Documentation]    This test case used to add and delete nationality
    Click Element    ${Menu_Admin}
    Click Element    ${Menu_Nationality}
    Element Should Be Visible    ${Ttl_Nationality_Nationalities}
    Click Button    ${Btn_Nationality_Add}
    Input Text    ${Txt_Nationality_Name}    aazahra
    Click Button    ${Btn_Natinality_Save}
    Element Should Be Visible    ${Ttl_Nationality_aazahra}
    Select Checkbox    ${Chk_Nationality_Name}
    Click Button    ${Btn_Nationality_Delete}
    Click Button    ${Btn_Nationality_Delete_OK}
    Element Should Be Visible    ${Ttl_Nationality_aazahra}    message=None

TC_Logout
    [Documentation]    This test case used to logout
    Click Element    ${Ttl_Welcome}
    Wait Until Element Is Visible    ${Ttl_Logout}
    Click Element    ${Ttl_Logout}
    Element Should Be Visible    ${Ttl_LoginPanel}
    Close Browser
