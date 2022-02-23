{{- define "pydiocells.configmap" -}}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.names.fullname" . }}-install
  labels:
    {{- include "common.labels" . | nindent 4 }}
data:
  pydiocells-install: |-
    frontendapplicationtitle: {{ .Values.pydioinstall.title }}
    frontendLogin: {{ .Values.pydioinstall.username }}
    frontendPassword: {{ .Values.pydioinstall.password }}
    frontendRepeatPassword: {{ .Values.pydioinstall.password }}
    dbConnectionType: tcp
    dbTCPHostname: {{ printf "%v-%v" .Release.Name "mariadb" }}
    dbTCPPort: 3306
    dbTCPName: {{ .Values.mariadb.mariadbDatabase }}
    dbTCPUser: {{ .Values.mariadb.mariadbUsername }}
    dbTCPPassword: {{ .Values.mariadb.mariadbPassword | trimAll "\"" }}
{{- end -}}
