// Dark mode functionality
document.addEventListener('DOMContentLoaded', function() {
    // Check for saved theme preference or use the system preference
    const savedTheme = localStorage.getItem('theme') || 
                      (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
    
    // Apply the saved theme
    if (savedTheme === 'dark') {
        document.documentElement.classList.add('dark');
    } else {
        document.documentElement.classList.remove('dark');
    }
    
    // Initialize toggle button state
    updateToggleButton();
    
    // Add event listener to toggle buttons
    const toggleButtons = document.querySelectorAll('.theme-toggle');
    toggleButtons.forEach(button => {
        button.addEventListener('click', toggleTheme);
    });
});

function toggleTheme() {
    // Toggle the theme
    if (document.documentElement.classList.contains('dark')) {
        document.documentElement.classList.remove('dark');
        localStorage.setItem('theme', 'light');
    } else {
        document.documentElement.classList.add('dark');
        localStorage.setItem('theme', 'dark');
    }
    
    // Update button appearance
    updateToggleButton();
}

function updateToggleButton() {
    const isDark = document.documentElement.classList.contains('dark');
    const toggleButtons = document.querySelectorAll('.theme-toggle');
    
    toggleButtons.forEach(button => {
        // Update icon visibility
        const moonIcon = button.querySelector('.moon-icon');
        const sunIcon = button.querySelector('.sun-icon');
        
        if (moonIcon && sunIcon) {
            if (isDark) {
                moonIcon.classList.add('hidden');
                sunIcon.classList.remove('hidden');
            } else {
                moonIcon.classList.remove('hidden');
                sunIcon.classList.add('hidden');
            }
        }
        
        // Update button text if it exists
        const darkText = button.querySelector('.dark-text');
        const lightText = button.querySelector('.light-text');
        
        if (darkText && lightText) {
            if (isDark) {
                darkText.classList.add('hidden');
                lightText.classList.remove('hidden');
            } else {
                darkText.classList.remove('hidden');
                lightText.classList.add('hidden');
            }
        }
    });
}
