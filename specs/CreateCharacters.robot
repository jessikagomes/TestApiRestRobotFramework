*Settings*
Documentation   Suite de Teste do cadastro de personagens na API da Marvel

Resource              ${EXECDIR}/resources/Base.robot 

Library               ${EXECDIR}/resources/factories/Thanos.py
Library               ${EXECDIR}/resources/factories/Deadpool.py


Suite Setup           Super Setup    jessika@gmail.com

*Test Cases*
Deve cadastrar um personagem

    ${personagem}   Factory Thanos
    POST New Character  ${personagem}

    Status Should Be    200

Não deve cadastrar com o mesmo nome

    [Tags]  dup

    ${personagem}   Factory Deadpool
    POST New Character  ${personagem}

    ${response}   POST New Character  ${personagem}

    Status Should Be    409
    Should Be Equal     ${response.json()}[error]    Character already exists :(

