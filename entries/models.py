from django.db import models
from django.contrib.auth.models import User

class Journal(models.Model):
    name = models.CharField(max_length=100, verbose_name="Journal Name")
    user1 = models.ForeignKey(User, verbose_name="Journaler 1")
    user2 = models.ForeignKey(User, verbose_name="Journaler 2")
    is_public = models.BooleanField(default=False)

    def __unicode__(self):
        return (self.name + " (" +
                self.user1.first_name + " " + self.user1.last_name + " and " +
                self.user2.first_name + " " + self.user2.last_name + ")")

    class Meta:
        ordering = ['user1__last_name', 'user1__first_name',
                    'user2__last_name', 'user2__first_name',
                    'name']

class Entry(model.Model):
    user = models.ForeignKey(User, verbose_name="Journaler")
    journal = models.ForeignKey(Journal)
    content = models.TextField()
    date = models.DateField()
    
    def __unicode__(self):
        return str(self.journal) + " " + str(self.date)

    class Meta:
        ordering = ['journal', 'date', 'user__last_name', 'user__first_name']
