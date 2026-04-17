# CI/CD Setup Guide - DEBUG MODE

⚠️ **Current Status**: App is in DEBUG mode - no release builds yet

## Workflows Created

### 1. **Code Analysis** (`analyze.yml`)
- **Triggers**: Every push and PR to `master`/`develop`
- **Tasks**:
  - Flutter analysis
  - Dart format check
  - Linting with fatal warnings/infos

### 2. **Unit Tests** (`test.yml`)
- **Triggers**: Every push and PR to `master`/`develop`
- **Tasks**:
  - Run all tests with coverage
  - Upload coverage to Codecov

### 3. **Build Debug** (`build.yml`) - **[DEBUG MODE]**
- **Triggers**: Push to `master`/`develop`, PR, manual trigger
- **Tasks**:
  - Build Android APK (debug)
  - Build Android App Bundle (debug)
  - Upload artifacts for download (7 days retention)
  - ✅ Ready to use NOW

### 4. **Firebase Distribution** (`firebase-distribution.yml`) - **[DEBUG MODE]**
- **Triggers**: Push to `develop` branch, manual trigger
- **Tasks**:
  - Build Debug APK
  - Upload debug APK as artifact
  - Comment on PR with status
  - 🔕 Firebase upload: Disabled (uncomment when ready)

### 5. **Release** (`release.yml`) - **[For future use]**
- **Triggers**: When you create a git tag (e.g., `v1.0.0`)
- **Status**: ✅ Ready but use draft releases (draft: true)
- **Note**: Will build release APK when you're ready

## Next Steps

### Step 1: Commit Updated Workflows
```bash
git add .github/ CI_CD_SETUP.md
git commit -m "chore: setup CI/CD for debug builds"
git push
```

### Step 2: Test Workflows NOW ✅
1. Go to **GitHub → Actions tab**
2. Create a test branch: `git checkout -b test/ci-debug`
3. Make a small change
4. Push: `git push origin test/ci-debug`
5. Watch workflows run
6. Download debug APK from **Actions → Artifacts**

### Step 3: When Ready for Release Builds
When you have:
- ✅ Build environments setup (signing certificates, keys)
- ✅ Firebase configured
- ✅ Tested debug builds

Then:
1. Update `build.yml` - Change `--debug` to `--release`
2. Setup code signing for Android/iOS
3. Configure Firebase secrets if needed

### Step 4: For Play Store/App Store Deployment
Refer to: **Setup Code Signing** section below

## Quick Commands

### Download Debug APK
1. Go to **Actions → Build Debug APK (Debug) → Artifacts**
2. Download `apk-debug`

### Test on Device
```bash
# Build locally
flutter build apk --debug

# Install on connected device
flutter install

# Or use APK from artifacts
adb install build/app/outputs/apk/debug/app-debug.apk
```

### Check if Workflows Pass
```bash
# Locally test what CI/CD will do
flutter analyze
flutter test
flutter build apk --debug
```

## Customization

### Change Flutter Version
Edit the workflows - update `flutter-version: '3.19.x'` to your desired version.

### Enable Firebase App Distribution (when ready)
In `firebase-distribution.yml`, uncomment lines 28-37:
```yaml
- name: Upload to Firebase App Distribution
  uses: wzieba/Firebase-Distribution-Github-Action@v1
  with:
    appId: ${{ secrets.FIREBASE_APP_ID_ANDROID }}
    serviceCredentialsFile: service-account-key.json
    file: build/app/outputs/apk/debug/app-debug.apk
    releaseNotes: "Debug Build - ${{ github.sha }}"
    groups: testers
```

Then add secrets to GitHub:
1. Go to **Settings > Secrets and variables > Actions**
2. Add: `FIREBASE_APP_ID_ANDROID` and `FIREBASE_SERVICE_ACCOUNT_KEY`

### Switch to Release Builds
Update `build.yml`:
```yaml
# Change this:
- name: Build APK Debug
  run: flutter build apk --debug

# To this:
- name: Build APK Release
  run: flutter build apk --release --split-per-abi
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Build fails locally | Run `flutter pub get` then `flutter build apk --debug` |
| Workflows not showing | Go to GitHub, enable Actions in Settings |
| APK too large | Optimize: `flutter build apk --debug --split-per-abi` |
| Tests failing | Run `flutter test` locally first |
| Artifact download failed | Check retention-days (currently 7 days) |

## Roadmap: From Debug to Release

```
Phase 1: DEBUG (Current)
├── ✅ Code analysis
├── ✅ Unit tests
├── ✅ Build debug APK
└── ✅ Download & test

Phase 2: RELEASE (When ready)
├── Setup signing keys
├── Configure Firebase
├── Enable release builds
└── Test release APK

Phase 3: STORE DEPLOYMENT
├── Setup Play Store account
├── Setup App Store account
├── Add signing secrets
└── Automate deployment
```
