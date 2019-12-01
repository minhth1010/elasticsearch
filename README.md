# SEARCHING WITH RELEVANCY

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

Chương này đề cập đến một cách linh hoạt về viêc chọn lọc dữ liệu và bộ đệm field data, nơi mà Elasticsearch lưu trữ giá trị của field các document đã được đánh index khi sắp xếp, scripting hoặc thống kê.

# 6.1 How scoring works in Elasticsearch

Tính điểm trong Lucene là một công thức sử dụng tài liệu được đề cập cùng một vài thông số để tính toán. 
Để bắt đầu tính điểm, Elasticsearch bắt đầu sử dụng tần suất của term được tìm kiếm cũng như mức độ phổ biến của term này.
Một term xuất hiện càng nhiều lần trong một document thì nó càng phù hợp, nhưng term xuất hiện ở càng nhiều document thì nó sẽ càng ít liên quan. Đây còn được gọi là TF-IDF (TF: term frequency - tần số thuật ngữ, IDF: inverse document frequency - tần số tài liệu nghịch đảo).

# 6.1.2 Term frequency

Cách đầu tiên để tính điểm của một docuemnt là tính toán tần suất của term trong document đó:

1: “We will discuss Elasticsearch at the next Big Data group.”

2: “Tuesday the Elasticsearch team will gather to answer questions about Elasticsearch.”

Chúng ta có thể thấy câu đầu tiên có 1 term Elasticsearch, còn câu 2 có 2 terms. Vì thế câu 2 sẽ có điểm cao hơn.

# 6.1.3 Inverse document frequency

Nghe có vẻ khá lạ nhưng term sẽ ít quan trọng hơn khi nó xuất hiện nhiều hơn ở tất cả các documents

1: “We use Elasticsearch to power the search for our website.” 

2: “The developers like Elasticsearch so far.”

3: “The scoring of documents is calculated by the scoring formula.”

Với term "Elasticsearch", nó đã xuất hiện trong 2 document nên tần suất tài liệu DF = 2
Còn term "The" xuất hiện trong cả 3 document và mặc dù ở doc3 xuất hiện tới 2 lần nhưng tần suất tài liệu DF = 3.

Tần số tài liệu nghịch đảo IDF giúp cân bằng lại tần suất term, tránh việc các term phổ biến dùng làm trở từ, bổ nghĩa xuất hiện quá nhiều, làm việc tính điểm không thực sự chính xác.

# 6.1.4 Lucene’s scoring formula





