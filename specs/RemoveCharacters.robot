*Settings*
Documentation   Suite de Teste de deleção de personagens na API da Marvel

Resource              ${EXECDIR}/resources/Base.robot 

Library               ${EXECDIR}/resources/factories/Xmen.py

Suite Setup           Super Setup    jessika@hotmail.com

*Test Cases*
Deve remover um personagem por Id
    
    ${personagem}   Factory Ciclope

    ${ciclope}        POST New Character  ${personagem}

    ${ciclope_id}   Set Variable      ${ciclope.json()}[_id]

    ${response}     DELETE Character By Id     ${ciclope_id}

    Status Should Be    204     ${response}

    ${response2}        GET Character By Id     ${ciclope_id}

    Status Should Be    404     ${response2}


Não deve encontrar o personagem por Id inexistente
    ${personagem_id}    Get Unique Id

    ${response}     DELETE Character By Id  ${personagem_id}

    Status Should Be    404     ${response}         
