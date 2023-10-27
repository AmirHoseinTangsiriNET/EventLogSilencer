# EventLogSilencer
EventLogSilencer is a PowerShell script designed for red teaming activities to selectively disable Windows Event Logging. By manipulating the registry key responsible for the configuration of the Event Log service, the script effectively prevents new events from being recorded, aiding in stealth and evasive actions.

### Usage:
- Run EventLogSilencer to locate and modify the registry path of the EventLog service.
- The script changes the ImagePath value to a custom command, rendering the EventLog service unable to start.
- As a result, event logging is effectively silenced until the registry key is restored.

### Caution:
- EventLogSilencer is intended for educational and red teaming purposes only. Use responsibly and ensure compliance with applicable laws and regulations.
- Use in a controlled environment to prevent unintended impact on critical systems.

Disclaimer:
This script is provided as-is without any warranty. The author takes no responsibility for the misuse or consequences of its usage. It is recommended to review and understand the script's functionality before execution.
