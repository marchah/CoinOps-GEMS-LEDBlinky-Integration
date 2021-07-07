import { promises } from 'fs';
import { startsWith } from 'lodash';

const colorConfPath = './plugins/ledblinky-integration/color-config/Colors.ini';
const controlConfPath =
  './plugins/ledblinky-integration/color-config/Controls.ini';

const gemsRomsList = './scripts/listMAMERomsGems.txt';
const gemsPlusRomsList = './scripts/listMAMERomsGemsPlus.txt';
const diamondsRomsList = './scripts/listMAMERomsDiamonds.txt';
const next2ArcadeOfficalTrustedPackRomsList =
  './scripts/listMAMERomsNext2ArcadeOfficialTrustedPack.txt';

const COINOPS_MAME_ROMS: { [type: string]: string[] } = {};

function loadIniFileRomNames(configFile: string): string[] {
  const romNames: string[] = [];

  configFile.split('\n').forEach(line => {
    if (startsWith(line, '[') && line.indexOf(']') > 0) {
      romNames.push(line.replace('[', '').replace(']', '')); // no comment ...
    }
  });

  return romNames;
}

function checkRomsConfig(
  roms: string[],
  controlsRomNames: string[],
  colorsRomNames: string[]
): {
  [romName: string]: { controls: boolean; colors: boolean };
} {
  return roms.reduce(
    (acc, rom) => {
      const hasControls = !!controlsRomNames.find(str => str === rom);
      const hasColors = !!colorsRomNames.find(str => str === rom);

      return {
        ...acc,
        [rom]: {
          controls: hasControls,
          colors: hasColors,
        },
      };
    },
    {} as {
      [romName: string]: { controls: boolean; colors: boolean };
    }
  );
}

(async () => {
  const controlsFile = await promises.readFile(controlConfPath, {
    encoding: 'utf-8',
  });
  const colorsFile = await promises.readFile(colorConfPath, {
    encoding: 'utf-8',
  });

  const controlsRomNames = loadIniFileRomNames(controlsFile);
  const colorsRomNames = loadIniFileRomNames(colorsFile);

  COINOPS_MAME_ROMS.GEMS = (
    await promises.readFile(gemsRomsList, {
      encoding: 'utf-8',
    })
  ).split('\n');

  COINOPS_MAME_ROMS.GEMS_PLUS = (
    await promises.readFile(gemsPlusRomsList, {
      encoding: 'utf-8',
    })
  ).split('\n');

  COINOPS_MAME_ROMS.DIAMONDS = (
    await promises.readFile(diamondsRomsList, {
      encoding: 'utf-8',
    })
  ).split('\n');

  COINOPS_MAME_ROMS.NEXT_2_ARCADE_OFFICIAL = (
    await promises.readFile(next2ArcadeOfficalTrustedPackRomsList, {
      encoding: 'utf-8',
    })
  ).split('\n');

  await promises.writeFile(
    `./scripts/gemsInfo.json`,
    JSON.stringify(
      checkRomsConfig(COINOPS_MAME_ROMS.GEMS, controlsRomNames, colorsRomNames),
      null,
      2
    )
  );

  await promises.writeFile(
    `./scripts/gemsPlusInfo.json`,
    JSON.stringify(
      checkRomsConfig(
        COINOPS_MAME_ROMS.GEMS_PLUS,
        controlsRomNames,
        colorsRomNames
      ),
      null,
      2
    )
  );

  await promises.writeFile(
    `./scripts/diamondsInfo.json`,
    JSON.stringify(
      checkRomsConfig(
        COINOPS_MAME_ROMS.DIAMONDS,
        controlsRomNames,
        colorsRomNames
      ),
      null,
      2
    )
  );

  await promises.writeFile(
    `./scripts/next2ArcadeOfficialInfo.json`,
    JSON.stringify(
      checkRomsConfig(
        COINOPS_MAME_ROMS.NEXT_2_ARCADE_OFFICIAL,
        controlsRomNames,
        colorsRomNames
      ),
      null,
      2
    )
  );

  process.exit(0);
})();
