from flask import Flask, request, render_template_string

app = Flask(__name__)

HTML = """
<!doctype html>
<title>简单对话演示</title>
<h1>和你的模型对话</h1>
<form method="post">
  <input type="text" name="user_input" placeholder="输入你的问题">
  <input type="submit" value="提交">
</form>
{% if response %}
  <h2>模型回复：</h2>
  <p>{{ response }}</p>
{% endif %}
"""

@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        user_input = request.form.get("user_input")
        # 这里可以加入你的 LangChain 处理逻辑
        response = f"你输入了：{user_input}。这里会是模型的回复。"
        return render_template_string(HTML, user_input=user_input, response=response)
    return render_template_string(HTML, user_input="", response="")

if __name__ == "__main__":
    app.run(debug=True)
