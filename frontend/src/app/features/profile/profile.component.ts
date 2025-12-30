import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, inject, OnInit } from '@angular/core';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './profile.component.html',
  styleUrl: './profile.component.scss',
})
export class ProfileComponent implements OnInit {
  private http = inject(HttpClient);
  profileData: any;

  ngOnInit(): void {
    this.fetchProfile();
  }

  fetchProfile() {
    this.http.get('http://localhost:3000/api/v1/profile')
      .subscribe({
        next: (data) => this.profileData = data,
        error: (err) => console.error('Error fetching profile:', err)
      });
  }
}