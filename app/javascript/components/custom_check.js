const initCustomCheck = () => {
  const checkWrappers = document.querySelectorAll('.custom-check-wrapper');
  checkWrappers.forEach(checkWrapper => {
    const checkLabels = checkWrapper.querySelectorAll('label');
    checkLabels.forEach(checkLabel => {
      checkLabel.addEventListener('click', () => {
        checkLabels.forEach(otherLabel => otherLabel.classList.remove('active'));
        checkLabel.classList.add('active');
      });
    });
  });
};

export { initCustomCheck };