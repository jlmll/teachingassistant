Feature:
	Como um aluno envolvido com o sistema.
	Eu quero poder me auto-avaliar conforme conceitos(MPA,  etc) em rela��o a metas(Entender conceitos de requisitos, etc) e ver conceitos que meu professor me atribuiu.
	
Scenario: Preencher uma auto-avalia��o
	Given que eu estou logado no sistema
	And em minha pr�pria p�gina de �Avalia��o�
	And eu fui avaliado pelo professor �Sergio�
	When eu cadastrar os conceitos �MA�, �MPA� ou �MANA� para cada uma de minhas metas
	And eu clicar �Ok�
	Then eu poderei ver os conceitos cadastrados para suas respectivas metas
	And os conceitos �MA�, �MPA� ou �MANA� atribu�dos para cada uma das metas pelo professor �Sergio�.

Scenario: Preencher uma auto-avalia��o incompleta
	Given que eu estou logado no sistema
	And em minha pr�pria p�gina de �Avalia��o�
	When eu cadastrar os conceitos �MA�, �MPA� ou �MANA� para cada uma de minhas metas exceto �Especificar Requisitos com Qualidade�
	And eu clickar �Ok�
	Then nenhuma avalia��o ser� entrada no sistema
	And ser� mostrada um aviso de �Erro: Meta n�o preenchida�
	Then os stakeholders estar�o felizes

Scenario: Checando uma turma com alunos sem discrep�ncia
	Given que estou logado no sistema
	And na p�gina �Lista de Alunos� de uma turma associada a mim
	And o aluno �Jorge� cadastrou no sistema �Especificar Requisitos com Qualidade� como �MPA�
	And eu cadastrei a meta �Especificar Requisitos com Qualidade� do aluno �Jorge� como �MANA�
	And o aluno �Mateus� cadastrou todos os seus conceitos como �MPA� And eu cadastrei todos os conceitos do aluno �Mateus� como �MA�
	And o aluno �Nero� cadastrou todos os seus conceitos com �MPA�
	And eu cadastrei todos os conceitos do aluno �Nero� como �MPA�
	When eu clico em �Listar discrep�ncias�
	Then o aluno �Jorge� ir� listar �Ok� ao lado de seu nome.
	And o aluno �Mateus� ir� listar �Ok� ao lado de seu nome.
	And o aluno �Nero� ir� listar �Ok� ao lado de seu nome.

Scenario: Checando uma turma com alunos com discrep�ncia
	Given que estou logado no sistema
	And na p�gina �Lista de Alunos� de uma turma associada a mim
	And o aluno �Jorge� cadastrou no sistema �Especificar Requisitos com Qualidade� como �MPA� e �Entender Conceitos de Requisitos� como �MA�
	And eu cadastrei as metas �Especificar Requisitos com Qualidade� e �Entender Conceitos de Requisitos� do aluno �Jorge� como �MANA�
	And o aluno �Mateus� cadastrou todos os seus conceitos como �MPA� And eu cadastrei todos os conceitos do aluno �Mateus� como �MA�
	And o aluno �Nero� cadastrou todos os seus conceitos com �MPA�
	And eu cadastrei todos os conceitos do aluno �Nero� como �MPA�
	When eu clico em �Listar discrep�ncias�
	Then o aluno �Jorge� ir� listar �2 de 5 avalia��es discrepantes(40%)� ao lado de seu nome.
	And o aluno �Mateus� ir� listar �Ok� ao lado de seu nome.
	And o aluno �Nero� ir� listar �Ok� ao lado de seu nome.
