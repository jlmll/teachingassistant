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