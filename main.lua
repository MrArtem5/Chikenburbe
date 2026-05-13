-- chickenburbe_kernel_final.lua
os.execute("chcp 65001 > nul")
math.randomseed(os.time())

print([[
   ╔══════════════════════════════════════════════════════════╗
   ║      ЧИКЕНБУРБЕ  - FINAL VERSION                         ║  
   ║   [ВЗЛОМ ЯДРА ЧИКЕНБУРБЕ]                                ║  
   ╚══════════════════════════════════════════════════════════╝
]])

-- Функция для отображения тигра при поражении
local function show_tiger()
    print([[
       🐯
    Тигр: "Ядро не взломано! Ну ты и лошок!"
    ]])
end

-- Состояние ядра
local kernel = {
    integrity = 100,
    firewall = true,
    exploits_found = {},
    data_extracted = {},
    hidden_commands = {},
    lua_execution = false
}

-- Файловая система ядра (все флаги)
local kernel_files = {
    ["/kernel/src/main.c"] = [[
// Chickenburbe Kernel - Core System
#include <burger.h>
#include <chicken.h>

/* FLAG_1: ch1ck3n_bUrb3_c0r3 */

struct chicken_burbe {
    int chicken_pieces;     // FLAG_2: hidden_metadata
    int sauce_level;        // SECRET_COMMAND: nuke
    char secret[16];        // FLAG_3: s4uc3_0f_anarchy
};

void init_kernel() {
    // FLAG_4: k3rn3l_master
    // BACKDOOR_TRIGGER: backdoor
    printf("ChickenBurbe Kernel Loaded\n");
}
]],
    ["/kernel/include/config.h"] = [[
#define CHICKEN_COUNT 42
#define SAUCE_SECRET "burbe_s4uc3"
/* FLAG_5: c0nf1g_breach */
/* HIDDEN: overdrive - активирует скоростной режим */
]],
    ["/sys/commands.txt"] = [[
Скрытые команды ядра:
- nuke     : уничтожает защитные механизмы
- overdrive: перегружает файрвол
- backdoor : открывает root-доступ
- chaos    : вызывает нестабильность ядра
]],
    ["/sys/flag_root.txt"] = "FLAG_ROOT: k3rn3l_br34ch_4ch13v3d",
    ["/kernel/scripts/exploit.lua"] = [[
-- Скрытый Lua-скрипт для автоматизации
function auto_attack(iterations)
    for i = 1, iterations do
        print("[AUTO] Атака #" .. i)
        os.execute("ping 127.0.0.1 -n 2 > nul")
    end
    print("[!] Автоматическая атака завершена!")
end
]]
}

-- Все возможные флаги
local all_flags = {
    "FLAG_1: ch1ck3n_bUrb3_c0r3",
    "FLAG_2: hidden_metadata",
    "FLAG_3: s4uc3_0f_anarchy",
    "FLAG_4: k3rn3l_master",
    "FLAG_5: c0nf1g_breach",
    "FLAG_ROOT: k3rn3l_br34ch_4ch13v3d"
}

-- Проверка победы
local function check_victory()
    if kernel.integrity == 0 and #kernel.data_extracted >= #all_flags then
        print([[
   ╔══════════════════════════════════════════════════════════╗
   ║                     ПОБЕДА!                              ║
   ║   Ядро уничтожено, все флаги найдены!                    ║
   ║   Ты - настоящий мастер чикенбурбе итд 2024!             ║
   ╚══════════════════════════════════════════════════════════╝
        ]])
        os.exit(0)
    elseif kernel.integrity == 0 and #kernel.data_extracted < #all_flags then
        print("\n[ПРЕДУПРЕЖДЕНИЕ] Ядро уничтожено, но не все флаги найдены!")
        print("Найдено флагов: " .. #kernel.data_extracted .. " из " .. #all_flags)
        show_tiger()
        os.exit(1)
    end
end

-- Инструменты (те же, что и в прошлой версии, но с проверкой победы)
local tools = {
    scan = function()
        print("\n[СКАНЕР СИСТЕМЫ]")
        print("├─ Целостность ядра: " .. kernel.integrity .. "%")
        print("├─ Файрвол: " .. (kernel.firewall and "АКТИВЕН" or "ОТКЛЮЧЁН"))
        print("├─ Найдено эксплойтов: " .. #kernel.exploits_found)
        print("├─ Извлечено данных: " .. #kernel.data_extracted .. " из " .. #all_flags)
        print("└─ Lua-выполнение: " .. (kernel.lua_execution and "ДА" or "НЕТ"))
        return true
    end,
    
    disable_firewall = function()
        if kernel.integrity > 70 then
            kernel.firewall = false
            print("[✓] Файрвол деактивирован. Ядро уязвимо.")
            return true
        else
            print("[✗] Целостность ядра критична, файрвол уже повреждён.")
            return false
        end
    end,
    
    exploit = function()
        if not kernel.firewall then
            print("[ЭКСПЛОЙТ] Анализ уязвимостей...")
            local exploits = {"buffer_overflow", "heap_spray", "use_after_free", "double_free"}
            for _, e in ipairs(exploits) do
                table.insert(kernel.exploits_found, e)
                print("├─ Найдено: " .. e)
            end
            return true
        else
            print("[✗] Файрвол активен! Используйте 'disable_firewall'.")
            return false
        end
    end,
    
    extract_code = function()
        print("\n[ИЗВЛЕЧЕНИЕ ИСХОДНОГО КОДА]\n" .. string.rep("-", 50))
        local content = kernel_files["/kernel/src/main.c"]
        print(content)
        print(string.rep("-", 50))
        for flag in content:gmatch("FLAG[%w_]+:? [%w_]+") do
            if not kernel.data_extracted[flag] then
                table.insert(kernel.data_extracted, flag)
                print("[!] Найден флаг: " .. flag)
            end
        end
        for secret in content:gmatch("SECRET_COMMAND: (%w+)") do
            kernel.hidden_commands[secret] = true
            print("[!] Обнаружена скрытая команда: " .. secret)
        end
        for backdoor in content:gmatch("BACKDOOR_TRIGGER: (%w+)") do
            kernel.hidden_commands[backdoor] = true
            print("[!] Обнаружен триггер бэкдора: " .. backdoor)
        end
        check_victory()
        return true
    end,
    
    extract_data = function(path)
        if kernel.integrity < 80 then
            local target = path or "/sys/flag_root.txt"
            local content = kernel_files[target]
            if content then
                print("\n[СОДЕРЖИМОЕ " .. target .. "]\n" .. content)
                for flag in content:gmatch("FLAG[%w_]+:? [%w_]+") do
                    if not kernel.data_extracted[flag] then
                        table.insert(kernel.data_extracted, flag)
                        print("[!] Найден флаг: " .. flag)
                    end
                end
                for cmd in content:gmatch("HIDDEN: (%w+)") do
                    kernel.hidden_commands[cmd] = true
                    print("[!] Найдена скрытая команда: " .. cmd)
                end
                check_victory()
                return true
            else
                print("[✗] Файл не найден. Доступные пути:")
                for p in pairs(kernel_files) do
                    print("  " .. p)
                end
                return false
            end
        else
            print("[✗] Целостность ядра слишком высока (" .. kernel.integrity .. "%). Атакуйте ядро (damage_kernel).")
            return false
        end
    end,
    
    damage_kernel = function(amount)
        amount = amount or math.random(10, 30)
        if kernel.integrity > 0 then
            kernel.integrity = math.max(0, kernel.integrity - amount)
            print("[АТАКА] Урон: " .. amount .. "%. Целостность: " .. kernel.integrity .. "%")
            check_victory()
            return true
        else
            print("[✗] Ядро уже уничтожено.")
            return false
        end
    end,
    
    activate_lua = function()
        if not kernel.lua_execution then
            kernel.lua_execution = true
            print("[✓] Lua-движок активирован!")
            return true
        else
            print("[✗] Lua уже активирован.")
            return false
        end
    end,
    
    lua = function(code)
        if kernel.lua_execution then
            print("[LUA] Выполнение кода...")
            local env = {
                print = print,
                damage_kernel = function(amount) return tools.damage_kernel(amount) end,
                scan = function() return tools.scan() end,
                exploit = function() return tools.exploit() end,
                extract_data = function(path) return tools.extract_data(path) end,
                nuke = function() return tools.nuke() end,
                backdoor = function() return tools.backdoor() end,
                overdrive = function() return tools.overdrive() end,
                chaos = function() return tools.chaos() end,
            }
            env._G = env
            local func, err = load(code, "chickenburbe_sandbox", "t", env)
            if func then
                local success, res = pcall(func)
                if not success then
                    print("[ОШИБКА] " .. tostring(res))
                end
            else
                print("[ОШИБКА] " .. err)
            end
            return true
        else
            print("[✗] Lua-движок не активирован. Используйте 'activate_lua'.")
            return false
        end
    end,
    
    show_flags = function()
        print("\n=== СОБРАННЫЕ ФЛАГИ ===")
        if #kernel.data_extracted == 0 then
            print("Нет флагов. Используйте 'extract_code' и 'extract_data'.")
        else
            for i, flag in ipairs(kernel.data_extracted) do
                print(i .. ". " .. flag)
            end
        end
        print("========================\n")
        return true
    end,
    
    -- Скрытые команды
    nuke = function()
        if kernel.hidden_commands.nuke then
            print("[NUKE] Ядерная атака запущена!")
            kernel.integrity = math.max(0, kernel.integrity - 70)
            print("Целостность ядра: " .. kernel.integrity .. "%")
            check_victory()
            return true
        else
            print("[✗] Команда не найдена. Изучите исходный код ядра.")
            return false
        end
    end,
    
    overdrive = function()
        if kernel.hidden_commands.overdrive then
            print("[OVERDRIVE] Файрвол перегружен!")
            kernel.firewall = false
            kernel.integrity = math.max(0, kernel.integrity - 20)
            print("Файрвол отключён, целостность: " .. kernel.integrity .. "%")
            check_victory()
            return true
        else
            print("[✗] Команда не найдена. Проверьте конфигурационные файлы.")
            return false
        end
    end,
    
    backdoor = function()
        if kernel.hidden_commands.backdoor then
            print("[BACKDOOR] Root-доступ получен!")
            kernel.lua_execution = true
            kernel.firewall = false
            print("Lua-выполнение активировано, файрвол отключён.")
            return true
        else
            print("[✗] Команда не найдена. Ищите в коде ядра.")
            return false
        end
    end,
    
    chaos = function()
        if kernel.hidden_commands.chaos then
            local effect = math.random(1, 4)
            print("[CHAOS] Хаотическая атака!")
            if effect == 1 then
                kernel.integrity = math.max(0, kernel.integrity - 30)
                print("Эффект: ядро повреждено")
            elseif effect == 2 then
                kernel.firewall = false
                print("Эффект: файрвол отключён")
            elseif effect == 3 then
                kernel.lua_execution = true
                print("Эффект: Lua-движок активирован")
            else
                table.insert(kernel.data_extracted, "FLAG_CHAOS: chaos_engine")
                print("Эффект: найден флаг")
            end
            check_victory()
            return true
        else
            print("[✗] Команда не найдена. Изучите /sys/commands.txt")
            return false
        end
    end,
    
    show_hidden = function()
        print("\n=== НАЙДЕННЫЕ СКРЫТЫЕ КОМАНДЫ ===")
        local found = false
        for cmd, _ in pairs(kernel.hidden_commands) do
            print(" - " .. cmd)
            found = true
        end
        if not found then
            print("Пока не найдено. Изучите исходный код и файлы ядра.")
        end
        print("================================\n")
        return true
    end,
    
    help = function()
        print([[
ДОСТУПНЫЕ КОМАНДЫ:

  ОСНОВНЫЕ:
    scan                - сканировать ядро
    disable_firewall    - отключить файрвол
    exploit             - найти уязвимости
    damage_kernel       - атаковать ядро
    damage_kernel <n>   - атаковать с указанным уроном
    extract_code        - извлечь исходный код ядра
    extract_data [путь] - извлечь данные из файла
    activate_lua        - активировать Lua-движок
    lua "код"           - выполнить Lua-скрипт
    
  СКРЫТЫЕ:
    show_hidden         - показать найденные скрытые команды
    (остальные найди сам)
    
  ИНФОРМАЦИЯ:
    show_flags          - показать все флаги
    help                - эта помощь
    quit                - выход
]])
        return true
    end
}

-- Добавляем скрытые команды в tools
local hidden_commands_list = {"nuke", "overdrive", "backdoor", "chaos"}
for _, cmd in ipairs(hidden_commands_list) do
    if not tools[cmd] then
        tools[cmd] = function()
            if kernel.hidden_commands[cmd] then
                print("[!] Команда '" .. cmd .. "' активирована, но не реализована.")
            else
                print("[✗] Команда не найдена. Изучите файлы ядра.")
            end
            return false
        end
    end
end

print("\n> Подключение установлено. Введите 'help' для списка команд.")
print("> Цель: уничтожить ядро и найти все флаги.\n")

-- Главный цикл
while true do
    io.write("chickenburbe_kernel> ")
    local input = io.read()
    if not input then break end
    input = input:gsub("^%s+", ""):gsub("%s+$", "")
    if input == "" then goto continue end
    
    local parts = {}
    for part in input:gmatch("%S+") do
        table.insert(parts, part)
    end
    local cmd = parts[1]
    local arg = parts[2]
    
    if tools[cmd] then
        if cmd == "damage_kernel" then
            local amount = tonumber(arg)
            if amount then
                tools.damage_kernel(amount)
            else
                tools.damage_kernel()
            end
        elseif cmd == "extract_data" then
            tools.extract_data(arg)
        elseif cmd == "lua" then
            local code = input:match("lua \"(.+)\"")
            if code then
                tools.lua(code)
            else
                print("[✗] Использование: lua \"код\"")
            end
        else
            tools[cmd](arg)
        end
    else
        print("[✗] Неизвестная команда. Введите 'help'.")
    end
    
    ::continue::
end
