import platform
a = [{'name': ['康师傅桶装泡椒牛肉','洗发水'], 'info': [[{'value': '111g'}, {'value':'200kg'}],[{'value':'200ml'}]]},
    {'name': ['康师傅桶装泡椒牛肉','洗发水'], 'info': [[{'value': '112g'}, {'value':'200kg'}],[{'value':'200ml'}]]},
    ]
# 'name': [
#     {'康师傅桶装泡椒牛肉':[{'value': '111g'}, {'value':'200kg'}] },
#     {'洗发水':[{'value':'200ml'}]}
#     ]
#dic = {}
new_dic = []
for x in range(len(a)):
    data = a[x]
    dic = {}
    #print(data)
    name_data = data.get('name')
    info_data = data.get('info')
    for i in range(len(name_data)):
        dic[name_data[i]] = info_data[i]
    new_dic.append(dic)

dics = {}
dics['name'] = new_dic
print(dics)
print(platform.platform())