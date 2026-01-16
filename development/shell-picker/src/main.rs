use std::env;
use std::fs;
use std::path::{Path, PathBuf};
use std::process::{Command, ExitCode};

use dialoguer::{theme::ColorfulTheme, Select};

fn main() -> ExitCode {
    match run() {
        Ok(()) => ExitCode::SUCCESS,
        Err(err) => {
            eprintln!("error: {}", err);
            ExitCode::FAILURE
        }
    }
}

fn run() -> Result<(), String> {
    let shells_dir = env::var("DEV_SHELLS")
        .map_err(|_| "Environment variable DEV_SHELLS is not set".to_string())?;

    let shells_dir = Path::new(&shells_dir);

    if !shells_dir.is_dir() {
        return Err(format!(
            "DEV_SHELLS is not a valid directory: {}",
            shells_dir.display()
        ));
    }

    let mut shells: Vec<PathBuf> = fs::read_dir(shells_dir)
        .map_err(|e| e.to_string())?
        .filter_map(Result::ok)
        .map(|e| e.path())
       .filter(|p| {
            p.extension().and_then(|e| e.to_str()) == Some("nix")
                && p.file_name().and_then(|n| n.to_str()) != Some("default.nix")
        })
        .collect();

    if shells.is_empty() {
        return Err(format!(
            "No .nix files found in {}",
            shells_dir.display()
        ));
    }

    let current_dir = env::current_dir().map_err(|e| e.to_string())?;
    let local_shell = current_dir.join("shell.nix");
    if local_shell.is_file() {
        shells.push(local_shell);
    }

    let display_names: Vec<String> = shells
        .iter()
        .map(|p| {
            p.file_stem()
                .unwrap_or_default()
                .to_string_lossy()
                .to_string()
        })
        .collect();

    let selection = Select::with_theme(&ColorfulTheme::default())
        .with_prompt("Select development shell")
        .items(&display_names)
        .default(0)
        .interact_opt()
        .map_err(|e| e.to_string())?;

    let Some(index) = selection else {
        return Ok(());
    };

    let status = Command::new("nix-shell")
        .arg(&shells[index])
        .status()
        .map_err(|e| e.to_string())?;

    if !status.success() {
        return Err(format!("nix-shell exited with status {}", status));
    }

    Ok(())
}
