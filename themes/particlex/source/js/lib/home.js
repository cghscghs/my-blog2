mixins.home = {
    data() {
        return {
            showContent: false,
        };
    },
    mounted() {
        let background = this.$refs.homeBackground;
        let images = background.dataset.images.split(",");
        let id = Math.floor(Math.random() * images.length);
        background.style.backgroundImage = `url('${images[id]}')`;
        this.menuColor = true;
        
        // 隐藏文章列表和侧边栏
        let postsWrap = this.$refs.homePostsWrap;
        if (postsWrap) {
            postsWrap.style.display = 'none';
        }
    },
    methods: {
        homeClick() {
            if (!this.showContent) {
                // 第一次点击，显示内容
                this.showContent = true;
                let postsWrap = this.$refs.homePostsWrap;
                if (postsWrap) {
                    postsWrap.style.display = 'flex';
                }
                window.scrollTo({ top: window.innerHeight, behavior: "smooth" });
            } else {
                // 已经显示内容后，点击返回顶部
                window.scrollTo({ top: window.innerHeight, behavior: "smooth" });
            }
        },
    },
};
