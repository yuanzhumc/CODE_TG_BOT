define(["jquery", "easy-admin","laymd"], function ($, ea) {

    var laymd = layui.laymd;

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'code.tg_user/index',
        add_url: 'code.tg_user/add',
        edit_url: 'code.tg_user/edit',
        delete_url: 'code.tg_user/delete',
        export_url: 'code.tg_user/export',
        modify_url: 'code.tg_user/modify',
        send_msg_url: 'code.tg_user/send_msg',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh',
                    [{
                        text: '群发消息',
                        url: init.send_msg_url,
                        method: 'open',
                        auth: 'send_msg',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-envelope',
                        checkbox:true,
                    }],
                    'add','delete', 'export'],
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'tg_id', minWidth: 80, title: '用户ID'},
                    {field: 'username', minWidth: 80, title: '用户名'},
                    {field: 'language_code', minWidth: 80, title: '语言代码'},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
                    {
                        width: 250, title: '操作', templet: ea.table.tool,
                        operat: ['edit',
                            [{
                                text: '发送tg消息',
                                url: init.send_msg_url,
                                method: 'open',
                                auth: 'send_msg',
                                class: 'layui-btn layui-btn-xs layui-btn-normal',
                            }],
                            'delete']
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
        send_msg: function () {
            //实例化编辑器,可以多个实例
            var md = laymd.init('text', {});
            //初始化数据预览
            md.do('change');
            ea.listen(function (data) {
                data.text = md.getText();
                return data;
            });
        },
    };
    return Controller;
});