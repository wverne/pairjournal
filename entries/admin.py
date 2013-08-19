from django.contrib import admin
from entries.models import *

class JournalAdmin(admin.ModelAdmin):
    list_display = ('name', 'user1', 'user2', 'is_public')

class EntryAdmin(admin.ModelAdmin):
    list_display = ('journal', 'date', 'user')

admin.site.register(Journal, JournalAdmin)
admin.site.register(Entry, EntryAdmin)
