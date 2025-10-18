# Contributing to NextGen App - ChatRx

Thank you for your interest in contributing to NextGen App! This document provides guidelines and information for contributors.

## 🎯 How to Contribute

### 1. Fork the Repository
- Click the "Fork" button on the GitHub repository page
- Clone your forked repository to your local machine

### 2. Create a Feature Branch
```bash
git checkout -b feature/your-feature-name
# or
git checkout -b bugfix/issue-description
```

### 3. Make Your Changes
- Write clean, readable code
- Follow the existing code style
- Add comments for complex logic
- Test your changes thoroughly

### 4. Test Your Changes
- Run the app on different devices/screen sizes
- Test all affected features
- Verify Firebase integration works
- Check for any console errors

### 5. Commit Your Changes
```bash
git add .
git commit -m "Add: Brief description of your changes

- Detailed explanation of what was added/changed
- Any important notes about the implementation
- Reference to related issues if applicable"
```

### 6. Push and Create Pull Request
```bash
git push origin feature/your-feature-name
```
Then create a Pull Request on GitHub with a detailed description.

## 📝 Code Style Guidelines

### Dart/Flutter Conventions
- Use meaningful variable and function names
- Follow camelCase for variables and functions
- Use PascalCase for class names
- Add proper documentation comments

### File Organization
- Keep related code in appropriate folders
- Use consistent naming conventions
- Separate UI, business logic, and data layers

### Example Code Style
```dart
class ChatMessageWidget extends StatelessWidget {
  final String message;
  final bool isMe;
  final DateTime timestamp;

  const ChatMessageWidget({
    Key? key,
    required this.message,
    required this.isMe,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Widget implementation
    );
  }
}
```

## 🧪 Testing Guidelines

### Manual Testing Checklist
- [ ] App launches without crashes
- [ ] All screens navigate correctly
- [ ] Firebase authentication works
- [ ] File upload/download functions
- [ ] Push notifications are received
- [ ] UI is responsive on different screen sizes
- [ ] Error handling works properly

### Testing on Different Devices
- Test on Android devices (different API levels)
- Test on iOS devices (if applicable)
- Test on different screen sizes
- Test with different network conditions

## 🐛 Bug Reports

When reporting bugs, please include:

### Required Information
- **Device**: Model and OS version
- **App Version**: Current version number
- **Steps to Reproduce**: Detailed steps
- **Expected Behavior**: What should happen
- **Actual Behavior**: What actually happens
- **Screenshots**: If applicable
- **Logs**: Any error messages or console output

### Bug Report Template
```markdown
**Bug Description**
Brief description of the bug

**Steps to Reproduce**
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected Behavior**
What you expected to happen

**Actual Behavior**
What actually happened

**Device Information**
- Device: [e.g., Samsung Galaxy S21]
- OS: [e.g., Android 12]
- App Version: [e.g., 1.0.0]

**Screenshots**
If applicable, add screenshots

**Additional Context**
Any other context about the problem
```

## ✨ Feature Requests

When suggesting new features:

### Feature Request Template
```markdown
**Feature Description**
Clear description of the feature

**Use Case**
Why would this feature be useful?

**Proposed Solution**
How do you think this should be implemented?

**Alternatives Considered**
Any alternative solutions you've thought about

**Additional Context**
Any other context or screenshots
```

## 🔧 Development Setup

### Prerequisites
- Flutter SDK 3.22.2 or higher
- Dart SDK 3.4.3 or higher
- Android Studio or VS Code
- Firebase project access

### Setup Steps
1. Clone the repository
2. Run `flutter pub get`
3. Configure Firebase (if needed)
4. Run `flutter run`

## 📋 Pull Request Guidelines

### PR Description Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Manual testing completed
- [ ] No console errors
- [ ] Firebase integration works
- [ ] UI is responsive

## Screenshots
If applicable, add screenshots

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
```

### PR Review Process
1. **Automated Checks**: CI/CD pipeline runs
2. **Code Review**: Maintainers review code
3. **Testing**: Manual testing by reviewers
4. **Approval**: At least one approval required
5. **Merge**: PR is merged to main branch

## 🏷️ Issue Labels

We use the following labels for issues:

- `bug`: Something isn't working
- `enhancement`: New feature or request
- `documentation`: Improvements to documentation
- `good first issue`: Good for newcomers
- `help wanted`: Extra attention is needed
- `question`: Further information is requested
- `wontfix`: This will not be worked on

## 📞 Getting Help

### Communication Channels
- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and general discussion
- **Email**: For private or sensitive matters

### Response Time
- We aim to respond to issues within 48 hours
- Pull requests are typically reviewed within 1 week
- Urgent bugs are prioritized

## 🎉 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

## 📄 License

By contributing to NextGen App, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to NextGen App! Your contributions help make this project better for everyone.** 🚀
