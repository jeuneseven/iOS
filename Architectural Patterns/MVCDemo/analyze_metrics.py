import os
import re
import math
from collections import defaultdict

# Define common Objective-C operators
operators = set([
    '+', '-', '*', '/', '%', '++', '--', '==', '!=', '>', '<', '>=', '<=', 
    '&&', '||', '!', '&', '|', '^', '~', '<<', '>>', '=', '+=', '-=', '*=', 
    '/=', '%=', '&=', '|=', '^=', '<<=', '>>=', '@'
])

# Define common control flow keywords
control_flow_keywords = set([
    'if', 'else if', 'for', 'while', 'case', 'catch', '&&', '||'
])

def remove_comments_and_strings(code):
    # Remove single-line comments
    code = re.sub(r'//.*?\n', '', code)
    # Remove multi-line comments
    code = re.sub(r'/\*.*?\*/', '', code, flags=re.S)
    # Remove strings
    code = re.sub(r'@"[^"]*"', '', code)
    return code

def extract_metrics_from_code(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        code = file.read()
    
    code = remove_comments_and_strings(code)
    
    # Extract operators and operands
    tokens = re.findall(r'\b\w+\b|[^\s\w]', code)
    n1, n2, N1, N2 = set(), set(), 0, 0
    operator_counts = defaultdict(int)
    operand_counts = defaultdict(int)
    
    for token in tokens:
        if token in operators:
            n1.add(token)
            operator_counts[token] += 1
        elif re.match(r'\w+', token):
            n2.add(token)
            operand_counts[token] += 1
    
    N1 = sum(operator_counts.values())
    N2 = sum(operand_counts.values())
    
    return len(n1), len(n2), N1, N2, code

def calculate_cyclomatic_complexity(code):
    # Initialize cyclomatic complexity with 1
    complexity = 1
    
    for keyword in control_flow_keywords:
        matches = re.findall(r'\b' + keyword + r'\b', code)
        complexity += len(matches)
    
    return complexity

def calculate_metrics(n1, n2, N1, N2, LOC, CLOC, CC):
    if LOC == 0:
        LOC = 1  # Avoid log of zero
    if CLOC == 0:
        CLOC = 1  # Avoid division by zero

    vocabulary = n1 + n2
    length = N1 + N2
    if vocabulary == 0:
        vocabulary = 1  # Avoid log of zero
    volume = length * math.log2(vocabulary)
    
    # Normalize cyclomatic complexity
    normalized_cc = math.log(CC + 1)

    # Calculate maintainability index components
    mi_base = 171
    mi_volume = 5.2 * math.log(volume)
    mi_cc = 0.23 * normalized_cc
    mi_loc = 16.2 * math.log(LOC)
    mi_cloc = 50 * math.sin(math.sqrt(2.4 * (CLOC / LOC)))
    
    # Print debug information
    print(f"Base MI: {mi_base}")
    print(f"Volume MI: {mi_volume}")
    print(f"Normalized CC MI: {mi_cc}")
    print(f"LOC MI: {mi_loc}")
    print(f"CLOC MI: {mi_cloc}")
    
    maintainability_index = mi_base - mi_volume - mi_cc - mi_loc + mi_cloc

    # Ensure maintainability index is within reasonable range
    if maintainability_index < 0:
        maintainability_index = 0
    elif maintainability_index > 171:
        maintainability_index = 171
    
    return volume, maintainability_index

def analyze_project(project_dir):
    n1, n2, N1, N2 = 0, 0, 0, 0
    LOC, CLOC = 0, 0
    total_cc = 0
    
    for root, _, files in os.walk(project_dir):
        if 'Pods' in root:
            continue  # Skip Pods directory
        
        for file in files:
            if file.endswith('.m') or file.endswith('.h'):
                file_path = os.path.join(root, file)
                file_n1, file_n2, file_N1, file_N2, code = extract_metrics_from_code(file_path)
                n1 += file_n1
                n2 += file_n2
                N1 += file_N1
                N2 += file_N2
                with open(file_path, 'r', encoding='utf-8') as f:
                    lines = f.readlines()
                    LOC += len(lines)
                    CLOC += len([line for line in lines if line.strip().startswith('//') or '/*' in line or '*/' in line])
                    total_cc += calculate_cyclomatic_complexity(code)
    
    volume, maintainability_index = calculate_metrics(n1, n2, N1, N2, LOC, CLOC, total_cc)
    
    # Print debug information
    print(f"Vocabulary (n1 + n2): {n1 + n2}")
    print(f"Length (N1 + N2): {N1 + N2}")
    print(f"LOC: {LOC}")
    print(f"CLOC: {CLOC}")
    print(f"CC: {total_cc}")
    print(f"Volume: {volume}")
    print(f"Maintainability Index: {maintainability_index}")

if __name__ == '__main__':
    project_dir = os.getcwd()  # Get current directory path
    analyze_project(project_dir)
