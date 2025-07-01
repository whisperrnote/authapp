following the same ui and logic, and building securely, create an exact mobile version of the auth web application as the 'authapp'. follow the same general ui logic, intelligently adjusting for mobile/desktop (remember we are building the flutter ui for both mobile and desktop screens)

something to note tho: don't change my flutter config files like pubspec.yaml. explicitly list the packages that need to be installed and keep them to the minimum to minimise security issues as this is a security app.

analyze the amount of features already migrated to the flutter app and only implement those not present yet.

keep your dart files structure modular within the lib/ directory, breaking everything into modular, scalable subdirectories for screens, widgets, logics, etc

you are not to modify any part of the web application itself, just migrate to the flutter app application.

you're not to modify any config files for both applications.

---

## Migration Plan (Summary)

1. **Analyze Features:**  
   - List all features already present in the Flutter app.
   - Compare with the web app to identify missing features.

2. **Implement Only Missing Features:**  
   - Only migrate features not yet present in the Flutter app.
   - Do not modify or duplicate features already implemented.

3. **Minimal Dependencies:**  
   - Do not change `pubspec.yaml` or any config files.
   - Explicitly list any new packages needed for new features (keep to a minimum).

4. **Modular Structure:**  
   - Place new Dart files in `lib/` using subdirectories:
     - `lib/screens/` for screens/pages
     - `lib/widgets/` for reusable widgets
     - `lib/logics/` for business logic/services
     - etc.

5. **No Web App Changes:**  
   - Do not modify any part of the web application.

6. **No Config Changes:**  
   - Do not modify config files for either app.

---

**When implementing new features:**
- Use the same UI/UX logic as the web app, but adapt for mobile/desktop as needed.
- Keep code modular and scalable.
- List any required packages at the top of your implementation notes.

---