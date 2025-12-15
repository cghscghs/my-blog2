// 鼠标点击粒子爆炸特效
(function() {
    const colors = ['#FF1461', '#18FF92', '#5A87FF', '#FBF38C', '#00D9FF', '#FF6B6B', '#4ECDC4', '#45B7D1'];
    
    class Particle {
        constructor(x, y, color) {
            this.x = x;
            this.y = y;
            this.color = color;
            this.radius = Math.random() * 3 + 2;
            this.velocity = {
                x: (Math.random() - 0.5) * 8,
                y: (Math.random() - 0.5) * 8
            };
            this.life = 1.0;
            this.decay = Math.random() * 0.015 + 0.015;
        }
        
        update() {
            this.velocity.x *= 0.98;
            this.velocity.y *= 0.98;
            this.velocity.y += 0.2; // 重力效果
            this.x += this.velocity.x;
            this.y += this.velocity.y;
            this.life -= this.decay;
        }
        
        draw(ctx) {
            ctx.save();
            ctx.globalAlpha = this.life;
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
            ctx.fillStyle = this.color;
            ctx.fill();
            ctx.restore();
        }
        
        isAlive() {
            return this.life > 0;
        }
    }
    
    class ParticleSystem {
        constructor() {
            this.canvas = document.createElement('canvas');
            this.ctx = this.canvas.getContext('2d');
            this.particles = [];
            
            // 设置 canvas 样式
            this.canvas.style.position = 'fixed';
            this.canvas.style.top = '0';
            this.canvas.style.left = '0';
            this.canvas.style.pointerEvents = 'none';
            this.canvas.style.zIndex = '9999';
            
            document.body.appendChild(this.canvas);
            
            this.resize();
            window.addEventListener('resize', () => this.resize());
            
            // 监听点击事件
            document.addEventListener('click', (e) => this.createExplosion(e.clientX, e.clientY));
            
            this.animate();
        }
        
        resize() {
            this.canvas.width = window.innerWidth;
            this.canvas.height = window.innerHeight;
        }
        
        createExplosion(x, y) {
            const particleCount = Math.random() * 15 + 15; // 15-30 个粒子
            for (let i = 0; i < particleCount; i++) {
                const color = colors[Math.floor(Math.random() * colors.length)];
                this.particles.push(new Particle(x, y, color));
            }
        }
        
        animate() {
            this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
            
            // 更新和绘制粒子
            for (let i = this.particles.length - 1; i >= 0; i--) {
                const particle = this.particles[i];
                particle.update();
                particle.draw(this.ctx);
                
                if (!particle.isAlive()) {
                    this.particles.splice(i, 1);
                }
            }
            
            requestAnimationFrame(() => this.animate());
        }
    }
    
    // 页面加载完成后初始化
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            new ParticleSystem();
        });
    } else {
        new ParticleSystem();
    }
})();
