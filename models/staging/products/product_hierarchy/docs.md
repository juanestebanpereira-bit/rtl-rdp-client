{#
  Doc blocks for customer-specific columns in the Product Hierarchy component.

  Only cust_* columns belong here. RDP product column descriptions are defined
  in rtl_rdp and resolve automatically via the installed package — do not
  duplicate them here.

  Usage in schema.yml:
    - name: cust_your_column
      description: "{{ doc('cust_your_column') }}"
#}

{% docs cust_department_manager %}
Name of the manager responsible for this department.
{% enddocs %}
