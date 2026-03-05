{
  chromium,
  iconDir,
}:

{
  name,
  url,
  iconName ? name,
  iconExtension ? "svg",
  desktopName ? name,
}:

{
  ${name} = {
    name = desktopName;
    exec = "${chromium}/bin/chromium --profile-directory=Default --app=${url}";
    icon = "${iconDir}/${iconName}.${iconExtension}";
  };
}
