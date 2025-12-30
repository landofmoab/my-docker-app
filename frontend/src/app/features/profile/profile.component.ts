import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, inject, OnInit, signal } from '@angular/core';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './profile.component.html',
  styleUrl: './profile.component.scss',
})
export class ProfileComponent implements OnInit {
  private http = inject(HttpClient);
  profileData = signal<any>(null);

  ngOnInit(): void {
    this.fetchProfile();
  }

  fetchProfile() {
    this.http.get('http://localhost:3000/api/v1/profile')
      .subscribe({
        next: (data) => {
          this.profileData.set(data);
        },
        error: (err) => console.error(err)
      });
  }
}