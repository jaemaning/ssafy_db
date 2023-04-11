from django.db import models

# Create your models here.
class Doctor(models.Model):
    name = models.TextField()
    
    def __str__(self) -> str:
        return f"{self.name} 전문의"
    
class Patient(models.Model):
    # 중개 테이블 자동 생성 django 에서 지원
    doctors = models.ManyToManyField(Doctor, through='Reservation')
    name = models.TextField()

    def __str__(self) -> str:
        return f"{self.pk}번 환자 {self.name}"

# 중개 테이블 직접생성 (customizing 가능)
class Reservation(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    symptom = models.TextField()
    reservated_at = models.DateTimeField(auto_now_add=True)

    def __str__(self) -> str:
        return f"{self.doctor_id}번 의사의 {self.patient_id}번 환자"
