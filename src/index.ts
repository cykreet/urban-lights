import fs from "fs/promises";

const ICON_THEMES = ["urban-lights-icon-theme.json", "urban-lights-icon-theme-colours.json"];

for (const theme of ICON_THEMES) {
	fs.readFile(theme).then((data) => {
		fs.writeFile(theme, data);
	});
}
