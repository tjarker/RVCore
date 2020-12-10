test:
	sbt test

clean:
	rmdir target
	rmdir project
	rmdir test_run_dir

build:
	sbt "runMain"