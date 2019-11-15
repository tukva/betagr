include .env
export

setup_project:
		psql -U postgres < create_database.sql
		docker-compose build
run_project:
		docker-compose up
run_psql:
		docker-compose run --rm database psql -U $(POSTGRES_DB) -h $(POSTGRES_HOST)
run_tests:
		docker-compose -f docker-compose.testing.yml up -d test_database
		docker-compose -f docker-compose.testing.yml build
		docker-compose -f docker-compose.testing.yml run --rm test_server
		docker-compose -f docker-compose.testing.yml down