import os
import polib

# 将当前工作目录更改为脚本所在的目录
os.chdir(os.path.dirname(os.path.abspath(__file__)))

# 加载 .po 文件
target_po_filename = 'LightGameBox.po'
target_po = polib.pofile(target_po_filename)
import_po = polib.pofile('GameDataEditor.po')

# 创建一个字典来存储 import_po 中的翻译
translations = {entry.msgid: entry.msgstr for entry in import_po}

# 初始化成功导入的文本数量
successful_imports = 0

# 遍历 target_po 中的条目
for entry in target_po:
    # 检查 msgstr 是否为空
    if not entry.msgstr:
        # 查找对应的 msgid 在 import_po 中的翻译
        if entry.msgid in translations:
            # 如果找到翻译，则更新 msgstr
            entry.msgstr = translations[entry.msgid]
            successful_imports += 1  # 增加成功导入计数

# 生成输出文件名
base_name = os.path.splitext(target_po_filename)[0]  # 获取文件名（不带扩展名）
output_filename = f"{base_name}_merged.po"  # 添加后缀

# 保存更新后的 target_po 文件
target_po.save(output_filename)

# 输出成功导入的文本数量
print(f"合并完成，已保存为 {output_filename}")
print(f"成功导入的文本数量: {successful_imports}")