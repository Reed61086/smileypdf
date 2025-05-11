/**
 * Enhanced Dark Mode Functionality
 * - Supports system preference detection
 * - Smooth transitions between modes
 * - Persists user preference
 * - Accessible toggle controls
 */
document.addEventListener('DOMContentLoaded', function() {
    // Check for saved theme preference or use the system preference
    const savedTheme = localStorage.getItem('theme');
    const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;

    // Apply the appropriate theme
    if (savedTheme === 'dark' || (savedTheme === null && systemPrefersDark)) {
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
        // Ensure the button is keyboard accessible
        button.setAttribute('role', 'switch');
        button.setAttribute('aria-checked', document.documentElement.classList.contains('dark'));
        button.setAttribute('tabindex', '0');

        // Add keyboard support
        button.addEventListener('keydown', function(e) {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                toggleTheme();
            }
        });
    });

    // Listen for system preference changes
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', e => {
        // Only apply system preference if user hasn't set a preference
        if (!localStorage.getItem('theme')) {
            if (e.matches) {
                document.documentElement.classList.add('dark');
            } else {
                document.documentElement.classList.remove('dark');
            }
            updateToggleButton();
        }
    });
});

/**
 * Toggle between light and dark themes
 */
function toggleTheme() {
    // Add a transition class for smooth color changes
    document.body.classList.add('theme-transition');

    // Toggle the theme
    if (document.documentElement.classList.contains('dark')) {
        document.documentElement.classList.remove('dark');
        localStorage.setItem('theme', 'light');
    } else {
        document.documentElement.classList.add('dark');
        localStorage.setItem('theme', 'dark');
    }

    // Update button appearance and accessibility attributes
    updateToggleButton();

    // Remove the transition class after the transition is complete
    setTimeout(() => {
        document.body.classList.remove('theme-transition');
    }, 500);
}

/**
 * Update the appearance of theme toggle buttons
 */
function updateToggleButton() {
    const isDark = document.documentElement.classList.contains('dark');
    const toggleButtons = document.querySelectorAll('.theme-toggle');

    toggleButtons.forEach(button => {
        // Update accessibility attributes
        button.setAttribute('aria-checked', isDark);

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

        // Update any theme labels if they exist
        const themeLabel = button.querySelector('.theme-label');
        if (themeLabel) {
            themeLabel.textContent = isDark ? 'Light Mode' : 'Dark Mode';
        }
    });
}
