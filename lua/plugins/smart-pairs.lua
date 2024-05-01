return {
    'ZhiyuanLck/smart-pairs',
    event = 'InsertEnter',
    config = function()
        require('pairs'):setup({
            pairs = {
                text = nil
            }
            })
    end
}
