VENV = .venv
KERNEL_DIR = .ipynb_kernels
KERNEL_NAME = .venv

create:
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip
	make install
	$(VENV)/bin/pip install jupyter ipykernel
	$(VENV)/bin/python -m ipykernel install --prefix=$(KERNEL_DIR) --name=$(KERNEL_NAME) --display-name "Python ($(KERNEL_NAME))"

install:
	@if [ -f requirements.txt ]; then \
		echo "Installing dependencies from requirements.txt..."; \
		$(VENV)/bin/pip install -r requirements.txt; \
	else \
		echo "No requirements.txt found. Skipping."; \
	fi

start:
	JUPYTER_PATH=$(KERNEL_DIR)/share/jupyter $(VENV)/bin/jupyter notebook

clean:
	rm -rf $(VENV) $(KERNEL_DIR)
