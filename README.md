# Searching with relevancy

* Cách tính điểm trong Lucene và Elasticsearch
* Cách tăng điểm với câu query hoặc field
* Hiểu về term frequency, inverse document frequency và các hệ số liên quan khác
* Giảm tác động, tăng hiệu suất của việc tính điểm
* Sử dụng function_score để tính giá trị phức tạp 
* Bộ đệm field data và cách nó ảnh hưởng đến Elasticsearch 

Việc so khớp tài liệu với câu truy vấn là tính năng mà nhiều công cụ tìm kiếm và lưu trữ đã giới thiệu. 
Điều gì thực sự khác biệt giữa Elasticsearch và câu truy vấn thônng thường SELECT * FROM user WHERE name LIKE 'bo%'
đó là cách tính điểm độ liên quan của một tài liệu.

Khi bạn nhấp vào nút tìm kiếm thì điều mong đợi không chỉ là các giá trị khớp với câu truy vấn mà còn các giá trị được sắp xếp theo mức độ liên quan với các tiêu chí tìm kiếm. Elasticsearch thích hợp với điều này, có nhiều cách để tìm kiếm và xác định mức độ liên quan.
