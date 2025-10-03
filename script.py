import binascii
import os
import re

KEY_MAP = {
    0x04: 'a', 0x05: 'b', 0x06: 'c', 0x07: 'd', 0x08: 'e', 0x09: 'f', 0x0a: 'g',
    0x0b: 'h', 0x0c: 'i', 0x0d: 'j', 0x0e: 'k', 0x0f: 'l', 0x10: 'm', 0x11: 'n',
    0x12: 'o', 0x13: 'p', 0x14: 'q', 0x15: 'r', 0x16: 's', 0x17: 't', 0x18: 'u',
    0x19: 'v', 0x1a: 'w', 0x1b: 'x', 0x1c: 'y', 0x1d: 'z',

    0x1e: '1', 0x1f: '2', 0x20: '3', 0x21: '4', 0x22: '5', 
    0x23: '6', 0x24: '7', 0x25: '8', 0x26: '9', 0x27: '0',
    
    0x2c: ' ', 0x28: '[ENTER]\n', 0x2a: '[BACKSPACE]', 0x2b: '\t', 
    
    0x2d: '-', 0x2e: '=', 0x2f: '[', 0x30: ']', 0x31: '\\', 0x33: ';',
    0x34: "'", 0x35: '`', 0x36: ',', 0x37: '.', 0x38: '/',
    
    0x60: '', 
}

SHIFT_MAP = {
    0x04: 'A', 0x05: 'B', 0x06: 'C', 0x07: 'D', 0x08: 'E', 0x09: 'F', 0x0a: 'G',
    0x0b: 'H', 0x0c: 'I', 0x0d: 'J', 0x0e: 'K', 0x0f: 'L', 0x10: 'M', 0x11: 'N',
    0x12: 'O', 0x13: 'P', 0x14: 'Q', 0x15: 'R', 0x16: 'S', 0x17: 'T', 0x18: 'U',
    0x19: 'V', 0x1a: 'W', 0x1b: 'X', 0x1c: 'Y', 0x1d: 'Z',
    
    0x1e: '!', 0x1f: '@', 0x20: '#', 0x21: '$', 0x22: '%', 
    0x23: '^', 0x24: '&', 0x25: '*', 0x26: '(', 0x27: ')',
    
    0x2d: '_', 0x2e: '+', 0x2f: '{', 0x30: '}', 0x31: '|', 0x33: ':',
    0x34: '"', 0x35: '~', 0x36: '<', 0x37: '>', 0x38: '?', 
    
    0x60: '', 
}

def parse_hid_log(file_path):
    output_text = ""
    last_report = "0000000000000000" 
    
    HEX_PATTERN = re.compile(r'([0-9a-fA-F]{2}[: ]?){8}')
    
    try:
        full_path = os.path.expanduser(file_path)
        
        with open(full_path, 'r', encoding='utf-8', errors='ignore') as f:
            for line in f:
                line = line.strip()
                match = HEX_PATTERN.search(line)
                
                if not match:
                    continue
                raw_hex_data = match.group(0) 
                data = re.sub(r'[^0-9a-fA-F]', '', raw_hex_data)
                
                if len(data) != 16:
                    continue

                if data == last_report:
                    continue
                    
                modifier = int(data[0:2], 16)
                key_code = int(data[4:6], 16)
                
                if key_code != 0x00:
                    
                    is_shift_pressed = (modifier & 0x02) == 0x02 or (modifier & 0x20) == 0x20
                    
                    if is_shift_pressed:
                        char = SHIFT_MAP.get(key_code, f"[SHIFT+0x{key_code:02x}]") 
                    else:
                        char = KEY_MAP.get(key_code, f"[0x{key_code:02x}]") 
                        
                    output_text += char
                    
                last_report = data

    except FileNotFoundError:
        return f"ERROR: File log tidak ditemukan di {full_path}. Cek ulang nama file dan path."
    except Exception as e:
        return f"Terjadi Error tak terduga: {e}"
        
    return "\n--- TEKS YANG DITULIS OLEH MELKOR ---\n" + output_text


log_file_path = "~/soal14_b.txt" 
hasil_tulisan = parse_hid_log(log_file_path)
print(hasil_tulisan)
