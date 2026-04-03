const User = require("../models/userModel");

exports.login = (req, res) => {
    const { username, password } = req.body;

    User.findByUsername(username, (err, results) => {
        if (err) return res.send("Lỗi server");

        if (results.length === 0) {
            return res.send("Sai tài khoản");
        }

        if (results[0].password !== password) {
            return res.send("Sai mật khẩu");
        }

        res.send("Đăng nhập thành công");
    });
};