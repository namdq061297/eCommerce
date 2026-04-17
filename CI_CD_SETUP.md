# CI/CD Setup Guide

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

### 3. **Build** (`build.yml`)
- **Triggers**: Push to `master`, PR, manual trigger
- **Tasks**:
  - Build Android APK (release + split per ABI)
  - Build iOS IPA (no code signing - for testing only)
  - Build Web version
  - Upload artifacts for download

### 4. **Firebase Distribution** (`firebase-distribution.yml`)
- **Triggers**: Push to `develop` branch, manual trigger
- **Tasks**:
  - Build APK
  - Upload to Firebase App Distribution
  - Notify testers
  - Comment on PR with status

### 5. **Release** (`release.yml`)
- **Triggers**: When you create a git tag (e.g., `v1.0.0`)
- **Tasks**:
  - Build APK
  - Create GitHub Release
  - Upload APK as release asset

## Next Steps

### Step 1: Setup Secrets (Optional but recommended)
For Firebase App Distribution, add these secrets to your GitHub repository:

1. Go to: **Settings > Secrets and variables > Actions**
2. Add secrets:
   - `FIREBASE_APP_ID_ANDROID`: Your Firebase App ID (find in Firebase Console)
   - Create `service-account-key.json`: Download from Firebase > Service Accounts

### Step 2: Setup Branch Protection Rules
1. Go to: **Settings > Branches**
2. Add rule for `master`:
   - ✅ Require a pull request before merging
   - ✅ Require status checks to pass (select: analyze, test, build)
   - ✅ Require branches to be up to date

### Step 3: Test the Pipeline
1. Create a test branch: `git checkout -b test/ci-cd`
2. Make a small change
3. Push: `git push origin test/ci-cd`
4. Create a PR
5. Watch the workflows run in **Actions tab**

### Step 4: Creating Releases
```bash
# Tag a release
git tag v1.0.0
git push origin v1.0.0

# This will trigger the release workflow
# APK will be available in GitHub Releases
```

## Customization

### Change Flutter Version
Edit the workflows - update `flutter-version: '3.19.x'` to your desired version.

### Add iOS Code Signing (for real deployment)
For actual App Store builds, you'll need to:
1. Export provisioning profiles and certificates
2. Add to GitHub Secrets
3. Configure signing in `build_ios` job

### Run Tests Locally First
```bash
flutter test
flutter analyze
```

## Troubleshooting

- **Tests failing?** Run `flutter test` locally first
- **Build failing?** Check `flutter pub get` works locally
- **iOS build issues?** May need code signing - see "Add iOS Code Signing" above
- **Firebase Distribution not working?** Ensure secrets are configured correctly
