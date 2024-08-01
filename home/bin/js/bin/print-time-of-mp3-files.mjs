// @ts-check

/**
 * This script calculates the duration of all files in the dirrectory from which `drra` command was called
 */

import { readdir } from "node:fs"
import { getAudioDurationInSeconds } from "get-audio-duration"
import { Duration } from "luxon"
import chalk from "chalk"
const { log } = console

const fileFormats = [".mp3", ".m4b"]

const dir = process.argv[2]
const flag = process.argv[3]

readdir(dir, async function (err, files) {
  if (err) throw err

  const filtered = files.filter((item) => fileFormats.some((format) => item.endsWith(format)))

  if (flag === "all") {
    const res = await Promise.all(
      filtered.map(async (file) => ({
        file,
        duration: Math.floor(await getAudioDurationInSeconds(file)),
      }))
    )

    const seconds = res.reduce((total, item) => total + item.duration, 0)

    const formatted = Duration.fromMillis(seconds * 1000).toFormat("hh:mm:ss")

    log(chalk.bold(formatted))
  }

  if (!flag) {
    const res = await Promise.all(
      filtered.map(async (file) => ({
        file,
        duration: Math.floor(await getAudioDurationInSeconds(file)),
      }))
    )

    res.forEach((item) =>
      log(`${chalk.bold(Duration.fromMillis(item.duration * 1000).toFormat("hh:mm:ss"))}  -  ${item.file}`)
    )
  }

  if (flag) log(chalk.red(`unknown flag ${flag}`))
})
