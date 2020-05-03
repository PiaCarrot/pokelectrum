#!/usr/bin/python3

import re
from argparse import ArgumentParser as ap

parser = ap(description='Converts original mus files to pokered disassembly format (current version)')
parser.add_argument('file', metavar='FILE')
parser.add_argument('out', metavar='OUTPUT')

args = parser.parse_args()

out_file = open(args.out, "w")

with open(args.file, "r") as mus_source:
    current_line = mus_source.readline()
    channel_num = 0

    while current_line:
        converted_line = ''
        current_line = re.sub(r'\n$', '', current_line)

        commands_1 = re.search(r'(speed|vol|vib|duty|init)(((?:[ \t])[0-9a-fA-F]{1,2})+)', current_line)
        commands_tempo = re.search(r'(tempo) ([0-9]{1,2})', current_line)
        commands_oct = re.search(r'(oct) ([0-9]{1,2})', current_line)
        notes_list = re.search(r'(\t{1,2})(c|c#|d|d#|e|f|f#|g|g#|a|a#|b|r)$', current_line)
        labels = re.search(r'^([A-Za-z0-9]+)$', current_line)
        rel_labels = re.search(r'^([A-Za-z0-9]+)\$$', current_line)
        drums = re.search(r'(\t{1,2})drum ([0-9]+)$', current_line)
        comments = re.search(r'(;.+)$', current_line)
        calls = re.search(r'call\t([A-Za-z0-9\$]+)$', current_line)
        loop = re.search(r'loop ([0-9]+),([A-Za-z0-9\$]+)$', current_line)
        commands_return = re.search(r'(return|end)$', current_line)
        commands_porta = re.search(r'porta[\t]+([0-9a-fA-F]{1,2}) ([0-9a-fA-F]{1,2}) (c|c#|d|d#|e|f|f#|g|g#|a|a#|b)', current_line)

        if commands_1 is not None:
            if commands_1.group(1) == 'speed':
                converted_line += '\ttempo '
                converted_line += str(int(re.sub(r' ',r'',commands_1.group(2)),16))
            elif commands_1.group(1) == 'vol':
                converted_line += '\tvolume '
                param = str(re.sub(r' ',r'',commands_1.group(2)))
                converted_line += str(int(param[0],16))+', '
                converted_line += str(int(param[1],16))
            elif commands_1.group(1) == 'vib':
                converted_line += '\tvibrato '
                param = str(re.sub(r' ',r'',commands_1.group(2)))
                converted_line += str(int(param[0],16))+', '
                converted_line += str(int(param[1],16))+', '
                converted_line += str(int(param[2],16))
            elif commands_1.group(1) == 'duty':
                converted_line += '\tduty_cycle '
                param = str(re.sub(r' ',r'',commands_1.group(2)))
                converted_line += str(int(param,16))
            elif commands_1.group(1) == 'init':
                param = str(re.sub(r' ',r'',commands_1.group(2)))
                if(param[1:2]):
                    converted_line += '\tnote_type '
                else:
                    converted_line += '\tdrum_speed '
                converted_line += str(int(param[0],16))
                if(param[1:2]):
                    converted_line += ', '
                    converted_line += str(int(param[1],16))+', '
                    converted_line += str(int(param[2],16))

        if commands_tempo is not None:
            current_length = int(commands_tempo.group(2))

        if commands_oct is not None:
            converted_line += '\toctave '
            converted_line += str(8-(int(commands_oct.group(2))))

        if commands_porta is not None:
            porta_args = [0, 0]
            porta_args[0] = int(commands_porta.group(1), 16)+1
            porta_args[1] = 8-int(commands_porta.group(2), 16)
            current_note = commands_porta.group(3).upper()
            if len(current_note) == 1:
                current_note += "_"
            converted_line += '\tpitch_slide '
            converted_line += str(porta_args[0]) + ', '
            converted_line += str(porta_args[1]) + ', '
            converted_line += current_note

        if notes_list is not None:
            if len(notes_list.group(1)) == 1:
                converted_line += '\n\t'
            else:
                converted_line += '\t'
            current_note = notes_list.group(2).upper()
            if current_note == 'R':
                converted_line += 'rest '
                converted_line += str(current_length)
            else:
                converted_line += 'note '
                if len(notes_list.group(2)) == 1:
                    current_note += "_"
                converted_line += current_note +', ' + str(current_length)

        if drums is not None:
            if len(drums.group(1)) == 1:
                converted_line += '\n\t'
            else:
                converted_line += '\t'
            converted_line += 'drum_note ' + drums.group(2) + ', '+ str(current_length)

        if labels is not None:
            channel_num += 1
            converted_line += labels.group(1)[0:len(labels.group(1))-1] + '_Ch' + str(channel_num) + ':'

        if rel_labels is not None:
            converted_line += '.'+rel_labels.group(1)

        if calls is not None:
            label = calls.group(1)
            if label[len(label)-1] == '$':
                label = '.'+label[:len(label)-1]
            converted_line += '\tsound_call ' + label

        if loop is not None:
            n_times = loop.group(1)
            label = loop.group(2)
            if label[len(label)-1] == '$':
                label = '.'+label[:len(label)-1]
            converted_line += '\tsound_loop ' + n_times +', '+ label

        if comments is not None:
            converted_line += comments.group(1)

        if commands_return is not None:
            converted_line += '\tsound_ret'

        out_file.write(converted_line+'\n')
        current_line = mus_source.readline()

out_file.close()