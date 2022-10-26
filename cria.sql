-- Gerado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   em:        2022-08-14 23:12:35 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE t_lup_aplicacao_candidato CASCADE CONSTRAINTS;

DROP TABLE t_lup_aplicacao_selecao CASCADE CONSTRAINTS;

DROP TABLE t_lup_candidato CASCADE CONSTRAINTS;

DROP TABLE t_lup_certificados CASCADE CONSTRAINTS;

DROP TABLE t_lup_contato_recrutador CASCADE CONSTRAINTS;

DROP TABLE t_lup_dados_aplicacao CASCADE CONSTRAINTS;

DROP TABLE t_lup_endereco CASCADE CONSTRAINTS;

DROP TABLE t_lup_formacao CASCADE CONSTRAINTS;

DROP TABLE t_lup_formacao_candidato CASCADE CONSTRAINTS;

DROP TABLE t_lup_perfil_candidato CASCADE CONSTRAINTS;

DROP TABLE t_lup_processo_seletivo CASCADE CONSTRAINTS;

DROP TABLE t_lup_recrutador CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_lup_aplicacao_candidato (
    id_aplicacao       NUMBER(10) NOT NULL,
    id_teste_vaga      NUMBER(10) NOT NULL,
    id_candidato       NUMBER(10) NOT NULL,
    id_vaga            NUMBER(10) NOT NULL,
    ds_tempo_aplicacao DATE NOT NULL,
    ds_pontuacao       NUMBER(10) NOT NULL
);

COMMENT ON COLUMN t_lup_aplicacao_candidato.id_aplicacao IS
    'Este atributo armazenara a identificacao da aplicacao na qual o candidato fez, nela serao armazenadas todas as informacoes do teste do candidato. Possui um tipo primario numerico de precisao 10';

COMMENT ON COLUMN t_lup_aplicacao_candidato.id_teste_vaga IS
    'Este atributo armazenara a identificacao do teste no qual o usuario irá aplicar, com dados do tipo de game e suas caracteristicas. Possui um tipo numerico de precisao 10 e primario;';

COMMENT ON COLUMN t_lup_aplicacao_candidato.id_candidato IS
    'Este atributo armazerá o id do candidato, no qual detem as principais informacoes do mesmo, possui um tipo primario do tipo numerico e precisao 10';

COMMENT ON COLUMN t_lup_aplicacao_candidato.id_vaga IS
    'Este atributo armazenara a identificacao da vaga na qual conterao todas as informacoes correspondentes da mesma. Possui um tipo numerico de precisao 10 primario.';

COMMENT ON COLUMN t_lup_aplicacao_candidato.ds_tempo_aplicacao IS
    'Este atributo armazenara os dados do tempo de aplicacao no qual o usuario teve para fazer o teste. Possui um tipo obrigatorio datetime';

COMMENT ON COLUMN t_lup_aplicacao_candidato.ds_pontuacao IS
    'Este atributo armazenara os dados da pontuacao do teste  do candidato, possui um tipo numerico, obrigatorio de precisao 10.';

ALTER TABLE t_lup_aplicacao_candidato ADD CONSTRAINT t_lup_aplicacao_candidato_pk PRIMARY KEY ( id_aplicacao );

CREATE TABLE t_lup_aplicacao_selecao (
    id_teste_vaga    NUMBER(10) NOT NULL,
    id_candidato     NUMBER(10) NOT NULL,
    id_vaga          NUMBER(10) NOT NULL,
    ds_tipo_teste    VARCHAR2(10) NOT NULL,
    nm_teste         VARCHAR2(10) NOT NULL,
    ds_pontuacao_min NUMBER(2, 1) NOT NULL,
    ds_pontuacao_max NUMBER(2, 1) NOT NULL,
    ds_aprovacao     CHAR(9) NOT NULL
);

COMMENT ON COLUMN t_lup_aplicacao_selecao.id_teste_vaga IS
    'Este atributo armazenara a identificacao do teste no qual o usuario irá aplicar, com dados do tipo de game e suas caracteristicas. Possui um tipo numerico de precisao 10 e primario;';

COMMENT ON COLUMN t_lup_aplicacao_selecao.id_candidato IS
    'Este atributo armazerá o id do candidato, no qual detem as principais informacoes do mesmo, possui um tipo primario do tipo numerico e precisao 10';

COMMENT ON COLUMN t_lup_aplicacao_selecao.id_vaga IS
    'Este atributo armazenara a identificacao da vaga na qual conterao todas as informacoes correspondentes da mesma. Possui um tipo numerico de precisao 10 primario.';

COMMENT ON COLUMN t_lup_aplicacao_selecao.ds_tipo_teste IS
    'Este atributo armazenara os dados do tipo de teste no qual o usuario irá aplicar (front-back-full) possui um tipo varchar de tamanho 10 e orbigatorio.';

COMMENT ON COLUMN t_lup_aplicacao_selecao.nm_teste IS
    'Este atributo armazenara o nome do teste no qual o candidato ira aplicar, possui um tipo varchar de tamanho 10 obrigatorio.';

COMMENT ON COLUMN t_lup_aplicacao_selecao.ds_pontuacao_min IS
    'Este atributo armazenara os dados da pontuacao minima que o teste exige como nota de corte, possui um tipo numerico de precisao 2 e escala1 do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_aplicacao_selecao.ds_pontuacao_max IS
    'Este atributo armazenara os dados da pontuacao maxima na qual um candidato pode ter, possui um tipo numerico de precisao 2 e escala 1 do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_aplicacao_selecao.ds_aprovacao IS
    'Este atributo armazenara os dados de aprovacao com base na pontuacao do usuario, possui um tipo char de tamanho 9 obrigatorio.';

ALTER TABLE t_lup_aplicacao_selecao
    ADD CONSTRAINT t_lup_aplicacao_vaga_pk PRIMARY KEY ( id_teste_vaga,
                                                         id_candidato,
                                                         id_vaga );

CREATE TABLE t_lup_candidato (
    id_candidato  NUMBER(10) NOT NULL,
    nm_candidato  VARCHAR2(50) NOT NULL,
    sx_candidato  VARCHAR2(10) NOT NULL,
    dt_nascimento DATE NOT NULL,
    ds_email      VARCHAR2(100) NOT NULL,
    nr_telefone   NUMBER(9) NOT NULL,
    ds_cpf        NUMBER(11) NOT NULL,
    ds_login      VARCHAR2(50) NOT NULL,
    ds_senha      VARCHAR2(50) NOT NULL,
    ds_ativo      CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_lup_candidato.id_candidato IS
    'Este atributo armazerá o id do candidato, no qual detem as principais informacoes do mesmo, possui um tipo primario do tipo numerico e precisao 10';

COMMENT ON COLUMN t_lup_candidato.nm_candidato IS
    'Este atributo armazerá o nome do candidato, possui um tipo varchar de tamanho de ate 50 caracteres do tipo obrigatorio';

COMMENT ON COLUMN t_lup_candidato.sx_candidato IS
    'Este atributo armazerá o sexo do candidato de tipo varchar de tamanho 10, atributo obrigatorio.';

COMMENT ON COLUMN t_lup_candidato.dt_nascimento IS
    'Este atributo armazerá a data de nascimento do usuario no qual sera do tipo date obrigatorio.';

COMMENT ON COLUMN t_lup_candidato.ds_email IS
    'Este atributo armazerá  o email do usuario no qual possui um tipo varchar de ate 100 caracteres do tipo obrigatorio';

COMMENT ON COLUMN t_lup_candidato.nr_telefone IS
    'Este atributo armazerá o numero de telefone do candidato, possui um tipo numerico de precisao 9 do tipo obrigatorio';

COMMENT ON COLUMN t_lup_candidato.ds_cpf IS
    'Este atributo armazerá o numero do cpf do candidato, possui um tipo numerico de precisao 11 do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_candidato.ds_login IS
    'Este atributo armazerá os dados do login do usuario para acesso a plataforma do tipo varchar de ate 50 caracteres, possui um tipo obrigario.';

COMMENT ON COLUMN t_lup_candidato.ds_senha IS
    'Este atributo armazerá os dados da senha do candidato na plataforma, possui um tipo varchar de tamanho 50 e obrigatorio.';

COMMENT ON COLUMN t_lup_candidato.ds_ativo IS
    'Este atributo armazerá se o usuario esta ativo ou inativo na plataforma, possui um tipo char de tamanho 1, A ativo, I inativo, de tipo obrigatorio.';

ALTER TABLE t_lup_candidato ADD CONSTRAINT t_lup_candidato_pk PRIMARY KEY ( id_candidato );

CREATE TABLE t_lup_certificados (
    id_certificados NUMBER(10) NOT NULL,
    id_curriculo    NUMBER(10) NOT NULL,
    ds_certificados VARCHAR2(90) NOT NULL,
    ds_cursos       VARCHAR2(90) NOT NULL
);

COMMENT ON COLUMN t_lup_certificados.id_certificados IS
    'Este atributo armazenará o id dos certificados do candidato do tipo numerico primario de precisao 10
';

COMMENT ON COLUMN t_lup_certificados.id_curriculo IS
    'Este atributo armazenará o id do curriculo do usuario, no qual suas informacoes profissionais estao. Possui um tipo numerico de precisao 10.';

COMMENT ON COLUMN t_lup_certificados.ds_certificados IS
    'Este atributo armazerá os dados dos certificados que o usuario possui, do tipo obrigatorio varchar de tamanho 90';

COMMENT ON COLUMN t_lup_certificados.ds_cursos IS
    'Este atributo armazerá os cursos que o usuario possui, do tipo varchar de tamanho 90 obrigatorio';

ALTER TABLE t_lup_certificados ADD CONSTRAINT entity_8_pk PRIMARY KEY ( id_certificados );

CREATE TABLE t_lup_contato_recrutador (
    id_contato    NUMBER(10) NOT NULL,
    id_recrutador NUMBER(10) NOT NULL,
    ds_emails     VARCHAR2(90) NOT NULL,
    ds_telefone   NUMBER(9) NOT NULL,
    ds_ddd        NUMBER(3) NOT NULL,
    ds_ddi        NUMBER(3) NOT NULL
);

COMMENT ON COLUMN t_lup_contato_recrutador.id_contato IS
    'Este atributo armazenara a identificacao do contato do recrutador, no qual possui um tipo numerico de precisao 10 primario.';

COMMENT ON COLUMN t_lup_contato_recrutador.id_recrutador IS
    'este atributo armazenara a identificacao do recrutador no qual possui um tipo de origem numerico de precisao 10 primario.';

COMMENT ON COLUMN t_lup_contato_recrutador.ds_emails IS
    'Este atributo armazenara os dados dos emails no qual o recrutador possui, tipo varchar tamanho 90 obrigatorio.';

COMMENT ON COLUMN t_lup_contato_recrutador.ds_telefone IS
    'Este atributo armazenara os dados dos telefones na qual o recrutador possui, tipo numerico de precisao 9 obrigatorio.';

COMMENT ON COLUMN t_lup_contato_recrutador.ds_ddd IS
    'Este atributo armazenara os dados do ddd dos telefones do recrutador, tipo numerico precisao 3 orbrigatorio';

COMMENT ON COLUMN t_lup_contato_recrutador.ds_ddi IS
    'Este atributo armazenara os dados de ddi dos telefones, tipo numerico precisao 3 do tipo obrigatorio';

ALTER TABLE t_lup_contato_recrutador ADD CONSTRAINT t_lup_contato_recrutador_pk PRIMARY KEY ( id_contato );

CREATE TABLE t_lup_dados_aplicacao (
    id_dados_aplicacao     NUMBER(10) NOT NULL,
    id_candidato           NUMBER(10) NOT NULL,
    id_teste_vaga          NUMBER(10) NOT NULL,
    id_vaga                NUMBER(10) NOT NULL,
    qt_inscritos           NUMBER(9999) NOT NULL,
    sx_inscritos           VARCHAR2(15) NOT NULL,
    ds_tempo_medio         DATE NOT NULL,
    ds_melhores_candidatos VARCHAR2(90) NOT NULL,
    ds_media_idade         NUMBER(10) NOT NULL
);

COMMENT ON COLUMN t_lup_dados_aplicacao.id_dados_aplicacao IS
    'Este atributo armazenara a identificacao dos dados que serao gerados apos o processo seletivo e aplicacao selecao. possui um tipo primario numerico de precisao 10';

COMMENT ON COLUMN t_lup_dados_aplicacao.id_candidato IS
    'Este atributo armazerá o id do candidato, no qual detem as principais informacoes do mesmo, possui um tipo primario do tipo numerico e precisao 10';

COMMENT ON COLUMN t_lup_dados_aplicacao.id_teste_vaga IS
    'Este atributo armazenara a identificacao do teste no qual o usuario irá aplicar, com dados do tipo de game e suas caracteristicas. Possui um tipo numerico de precisao 10 e primario;';

COMMENT ON COLUMN t_lup_dados_aplicacao.id_vaga IS
    'Este atributo armazenara a identificacao da vaga na qual conterao todas as informacoes correspondentes da mesma. Possui um tipo numerico de precisao 10 primario.';

COMMENT ON COLUMN t_lup_dados_aplicacao.qt_inscritos IS
    'Este atributo armazenara a quantidade de inscritos no processo seletivo, possui um tipo numerico de precisao 9999 obrigatorio';

COMMENT ON COLUMN t_lup_dados_aplicacao.sx_inscritos IS
    'Este atributo armazenara o sexo dos inscritos, gerando uma media do tipo dos inscritos, possui um tipo varchar de tamanho 15 e obrigatorio.';

COMMENT ON COLUMN t_lup_dados_aplicacao.ds_tempo_medio IS
    'Este atributo armazenara os dados do tempo medio no qual os usuarios levaram para realizar o teste, possui um tipo obrigatorio de datetime.';

COMMENT ON COLUMN t_lup_dados_aplicacao.ds_melhores_candidatos IS
    'Este atributo armazenara os melhores candidatos com as melhores pontuacoes, possui um tipo varchar de tamanho 90 do tipo obrigatorio';

COMMENT ON COLUMN t_lup_dados_aplicacao.ds_media_idade IS
    'Este atributo armazenara os dados das medias de idade na qual aplicaram para o teste. Possui um tipo de origem numerico de precisao 10 do tipo obrigatorio.';

CREATE UNIQUE INDEX t_lup_dados_aplicacao__idx ON
    t_lup_dados_aplicacao (
        id_teste_vaga
    ASC,
        id_candidato
    ASC,
        id_vaga
    ASC );

ALTER TABLE t_lup_dados_aplicacao ADD CONSTRAINT t_lup_dados_aplicacao_pk PRIMARY KEY ( id_dados_aplicacao );

CREATE TABLE t_lup_endereco (
    id_endereco           NUMBER(10) NOT NULL,
    id_candidato          NUMBER(10) NOT NULL,
    ds_bairro             VARCHAR2(30) NOT NULL,
    ds_logradouro         VARCHAR2(30) NOT NULL,
    ds_cidade             VARCHAR2(30) NOT NULL,
    ds_cep                NUMBER(8) NOT NULL,
    ds_ponto_ref          VARCHAR2(30) NOT NULL,
    nm_estado             VARCHAR2(20) NOT NULL,
    sg_estado             VARCHAR2(3) NOT NULL,
    nr_logradouro         NUMBER(5) NOT NULL,
    ds_complemento_numero VARCHAR2(10) NOT NULL
);

COMMENT ON COLUMN t_lup_endereco.id_endereco IS
    'Este atributo armazerá  o endereco do usuario, possui um tipo numerico de precisao 10 primario.';

COMMENT ON COLUMN t_lup_endereco.id_candidato IS
    'Este atributo armazerá o id do candidato, no qual detem as principais informacoes do mesmo, possui um tipo primario do tipo numerico e precisao 10';

COMMENT ON COLUMN t_lup_endereco.ds_bairro IS
    'Este atributo armazerá os dados do bairro do candidato, do tipo varchar de tamanho 30 obrigatorio;';

COMMENT ON COLUMN t_lup_endereco.ds_logradouro IS
    'Este atributo armazerá os dados do logradouro do candidato, possui um tipo varchar de tamanho 30 obrigatorio.';

COMMENT ON COLUMN t_lup_endereco.ds_cidade IS
    'Este atributo armazerá a cidade do candidato no qual possui um tipo de origem varchar de tamanho possivel de ate 30 caracteres do tipo obrigatorio';

COMMENT ON COLUMN t_lup_endereco.ds_cep IS
    'Este atributo armazerá os dados do cep do candidato no qual possui um tipo numerico de precisao de 8 numeros do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_endereco.ds_ponto_ref IS
    'Este atributo armazenara os dados do ponto de referencia do candidato do tipo varchar de tamanho 30 obrigatorio.';

COMMENT ON COLUMN t_lup_endereco.nm_estado IS
    'Este atributo armazerá o nome do estado do candidato e possui um tipo de origem varchar de tamanho de 20 caracteres do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_endereco.sg_estado IS
    'Este atributo armazerá o estado do candidato, no qual possui um tipo varchar de tamanho 3 do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_endereco.nr_logradouro IS
    'Este atributo armazerá o numero do logradouro do candidato, possui um tipo de origem numerico de precisao 5 do tipo obrigatorio';

COMMENT ON COLUMN t_lup_endereco.ds_complemento_numero IS
    'Este atributo armazerá  os dados do complemento de numero do candidato, possui um tipo de origem varchar de tamanho 10 e obrigatorio.';

ALTER TABLE t_lup_endereco ADD CONSTRAINT t_lup_endereco_candidato_pk PRIMARY KEY ( id_endereco );

CREATE TABLE t_lup_formacao (
    id_curriculo     NUMBER(10) NOT NULL,
    ds_grau_formacao VARCHAR2(10) NOT NULL,
    dt_conclusao     DATE NOT NULL
);

COMMENT ON COLUMN t_lup_formacao.id_curriculo IS
    'Este atributo armazenará o id do curriculo do usuario, no qual suas informacoes profissionais estao. Possui um tipo numerico de precisao 10.';

COMMENT ON COLUMN t_lup_formacao.ds_grau_formacao IS
    'Este atributo armazerá o tipo de grau de formacao do candidato, tipo varchar de tamanho 10 obrigatorio';

COMMENT ON COLUMN t_lup_formacao.dt_conclusao IS
    'Este atributo armazerá a data de conclusao de formacao do candidato, do tipo obrigatorio tipo date.';

ALTER TABLE t_lup_formacao ADD CONSTRAINT t_lup_curriculo_candidato_pk PRIMARY KEY ( id_curriculo );

CREATE TABLE t_lup_formacao_candidato (
    id_formacao_candidato NUMBER(10) NOT NULL,
    id_perfil_candidato   NUMBER(10) NOT NULL,
    id_curriculo          NUMBER(10) NOT NULL,
    tp_formacao           VARCHAR2(20) NOT NULL,
    dt_formacao           DATE NOT NULL,
    ds_status_formacao    VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN t_lup_formacao_candidato.id_formacao_candidato IS
    'Este atributo armazenará o id da formacao na qual o candidato possui, tipo numerico de precisão 10 e do tipo primario.';

COMMENT ON COLUMN t_lup_formacao_candidato.id_perfil_candidato IS
    'Este atributo armazenará o id do perfil do candidato, no qual contem todas as informacoes sobre ele que ficara exposto na plataforma, possui um tipo numerico de precisao 10 e primario';

COMMENT ON COLUMN t_lup_formacao_candidato.id_curriculo IS
    'Este atributo armazenará o id do curriculo do usuario, no qual suas informacoes profissionais estao. Possui um tipo numerico de precisao 10.';

COMMENT ON COLUMN t_lup_formacao_candidato.tp_formacao IS
    'Este atributo armazerá o tipo de formacao do candidato (tecnologo, baicharelado) do tipo obrigatorio varchar de tamanho 20.';

COMMENT ON COLUMN t_lup_formacao_candidato.dt_formacao IS
    'Este atributo armazerá a data de formacao do candidato mediante ao curso que ele fez, do tipo obrigatorio e date';

COMMENT ON COLUMN t_lup_formacao_candidato.ds_status_formacao IS
    'Este atributo armazerá o status da formacao dele, cursando, abandonado, finalizado e etc.. tipo obrigatorio varchar  de tamanho 20.';

ALTER TABLE t_lup_formacao_candidato
    ADD CONSTRAINT t_lup_formacao_candidato_pk PRIMARY KEY ( id_formacao_candidato,
                                                             id_perfil_candidato,
                                                             id_curriculo );

CREATE TABLE t_lup_perfil_candidato (
    id_perfil_candidato NUMBER(10) NOT NULL,
    id_candidato        NUMBER(10) NOT NULL,
    ds_perfil_candidato VARCHAR2(90) NOT NULL,
    ds_biografia        VARCHAR2(90) NOT NULL,
    ds_interesses       VARCHAR2(15) NOT NULL
);

COMMENT ON COLUMN t_lup_perfil_candidato.id_perfil_candidato IS
    'Este atributo armazenará o id do perfil do candidato, no qual contem todas as informacoes sobre ele que ficara exposto na plataforma, possui um tipo numerico de precisao 10 e primario';

COMMENT ON COLUMN t_lup_perfil_candidato.id_candidato IS
    'Este atributo armazerá o id do candidato, no qual detem as principais informacoes do mesmo, possui um tipo primario do tipo numerico e precisao 10';

COMMENT ON COLUMN t_lup_perfil_candidato.ds_perfil_candidato IS
    'Este atributo armazerá as informacoes principais do perfil do usuario no qual ficarao armazenadas no nosso banco. possui um tipo varchar de tamanho 90 do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_perfil_candidato.ds_biografia IS
    'Este atributo armazerá a biografia do usuario no qual possui um tipo varchar de tamanho 90 do tipo obrigatorio';

COMMENT ON COLUMN t_lup_perfil_candidato.ds_interesses IS
    'Este atributo armazerá os interesses de areas na qual o candidato pode se interessar, possui um tipo varchar de tamanho 15 do tipo obrigatorio.';

CREATE UNIQUE INDEX t_lup_perfil_candidato__idx ON
    t_lup_perfil_candidato (
        id_candidato
    ASC );

ALTER TABLE t_lup_perfil_candidato ADD CONSTRAINT t_lup_perfil_candidato_pk PRIMARY KEY ( id_perfil_candidato );

CREATE TABLE t_lup_processo_seletivo (
    id_vaga            NUMBER(10) NOT NULL,
    id_recrutador      NUMBER(10) NOT NULL,
    ds_nome_vaga       VARCHAR2(30) NOT NULL,
    ds_descricao_vaga  VARCHAR2(90) NOT NULL,
    ds_area_vaga       VARCHAR2(10) NOT NULL,
    ds_salario         NUMBER(2, 5) NOT NULL,
    ds_beneficios_vaga VARCHAR2(50) NOT NULL,
    ds_modalidade_vaga VARCHAR2(30) NOT NULL,
    pcd_aplicavel      CHAR(3) NOT NULL
);

COMMENT ON COLUMN t_lup_processo_seletivo.id_vaga IS
    'Este atributo armazenara a identificacao da vaga na qual conterao todas as informacoes correspondentes da mesma. Possui um tipo numerico de precisao 10 primario.';

COMMENT ON COLUMN t_lup_processo_seletivo.id_recrutador IS
    'este atributo armazenara a identificacao do recrutador no qual possui um tipo de origem numerico de precisao 10 primario.';

COMMENT ON COLUMN t_lup_processo_seletivo.ds_nome_vaga IS
    'Este atributo armazenara os dados do titulo da vaga em questao, possui um tipo varchar de tamanho 30 obrigatorio.';

COMMENT ON COLUMN t_lup_processo_seletivo.ds_descricao_vaga IS
    'Este atributo armazenara os dados da descricao da vaga, possui um tipo varchar de tamanho 90 do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_processo_seletivo.ds_area_vaga IS
    'Este atributo armazenara os dados da area na qual a vaga sera disponibilizada, possui um tipo varchar de tamanho 10 do tipo obrigatorio';

COMMENT ON COLUMN t_lup_processo_seletivo.ds_salario IS
    'Este atributo armazenara os dados do salario na qual a vaga disponibiliza, possui um tipo de origem numerico de precisao 2 escala 5 do tipo obrigatorio';

COMMENT ON COLUMN t_lup_processo_seletivo.ds_beneficios_vaga IS
    'Este atributo armazenara os dados dos beneficios que a vaga propoe do tipo de origem varchar de tamanho 50 do tippo obrigatorio.';

COMMENT ON COLUMN t_lup_processo_seletivo.ds_modalidade_vaga IS
    'Este atributo armazenara os dados da modalidade na qual a vaga se adere, do tipo varchar de tamanho 30 obrigatorio.';

COMMENT ON COLUMN t_lup_processo_seletivo.pcd_aplicavel IS
    'Este atributo armazenara dados se é possivel aplicacao de deficientes, possui um tipo de origem char de tamanho 3 orbigatorio.';

ALTER TABLE t_lup_processo_seletivo ADD CONSTRAINT t_lup_vagas_pk PRIMARY KEY ( id_vaga );

CREATE TABLE t_lup_recrutador (
    id_recrutador         NUMBER(10) NOT NULL,
    nm_recrutador         VARCHAR2(30) NOT NULL,
    ds_login              VARCHAR2(30) NOT NULL,
    ds_senha              VARCHAR2(30) NOT NULL,
    ds_areas_recrutamento VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_lup_recrutador.id_recrutador IS
    'este atributo armazenara a identificacao do recrutador no qual possui um tipo de origem numerico de precisao 10 primario.';

COMMENT ON COLUMN t_lup_recrutador.nm_recrutador IS
    'Este atributo armazenara o nome do recrutador, no qual possui um tipo de origem varchar de tamanho 30 do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_recrutador.ds_login IS
    'Este atributo armazenara os dados de login do recrutador no qual possui um tipo varchar de tamanho 30 obrigatorio.';

COMMENT ON COLUMN t_lup_recrutador.ds_senha IS
    'Este atributo armazenara os dados da senha do recrutador no qual possui um tipo de origem varchar de tamanho 30 do tipo obrigatorio.';

COMMENT ON COLUMN t_lup_recrutador.ds_areas_recrutamento IS
    'Este atributo armazenara os dados das areas de recrutamento no qual o recrutador esta inserido, possui um tipo varchar de tamanho 30 do tipo obrigatorio.';

ALTER TABLE t_lup_recrutador ADD CONSTRAINT t_lup_recrutador_pk PRIMARY KEY ( id_recrutador );

ALTER TABLE t_lup_perfil_candidato
    ADD CONSTRAINT relation_12 FOREIGN KEY ( id_candidato )
        REFERENCES t_lup_candidato ( id_candidato );

ALTER TABLE t_lup_contato_recrutador
    ADD CONSTRAINT relation_13 FOREIGN KEY ( id_recrutador )
        REFERENCES t_lup_recrutador ( id_recrutador );

ALTER TABLE t_lup_aplicacao_candidato
    ADD CONSTRAINT relation_16 FOREIGN KEY ( id_teste_vaga,
                                             id_candidato,
                                             id_vaga )
        REFERENCES t_lup_aplicacao_selecao ( id_teste_vaga,
                                             id_candidato,
                                             id_vaga );

ALTER TABLE t_lup_formacao_candidato
    ADD CONSTRAINT relation_17 FOREIGN KEY ( id_perfil_candidato )
        REFERENCES t_lup_perfil_candidato ( id_perfil_candidato );

ALTER TABLE t_lup_formacao_candidato
    ADD CONSTRAINT relation_18 FOREIGN KEY ( id_curriculo )
        REFERENCES t_lup_formacao ( id_curriculo );

ALTER TABLE t_lup_dados_aplicacao
    ADD CONSTRAINT relation_19 FOREIGN KEY ( id_teste_vaga,
                                             id_candidato,
                                             id_vaga )
        REFERENCES t_lup_aplicacao_selecao ( id_teste_vaga,
                                             id_candidato,
                                             id_vaga );

ALTER TABLE t_lup_endereco
    ADD CONSTRAINT relation_2 FOREIGN KEY ( id_candidato )
        REFERENCES t_lup_candidato ( id_candidato );

ALTER TABLE t_lup_aplicacao_selecao
    ADD CONSTRAINT relation_3 FOREIGN KEY ( id_candidato )
        REFERENCES t_lup_candidato ( id_candidato );

ALTER TABLE t_lup_aplicacao_selecao
    ADD CONSTRAINT relation_4 FOREIGN KEY ( id_vaga )
        REFERENCES t_lup_processo_seletivo ( id_vaga );

ALTER TABLE t_lup_certificados
    ADD CONSTRAINT relation_5 FOREIGN KEY ( id_curriculo )
        REFERENCES t_lup_formacao ( id_curriculo );

ALTER TABLE t_lup_processo_seletivo
    ADD CONSTRAINT relation_9 FOREIGN KEY ( id_recrutador )
        REFERENCES t_lup_recrutador ( id_recrutador );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             2
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
