//
//  SupaBaseManager.swift
//  StreamerStakes
//
//  Created by rishab sanjay on 11/9/24.
//

import Foundation
import Supabase


struct AppUser {
    let uid: String
    let email: String?
}
class SupabaseManager {
    static let shared = SupabaseManager()
    let client: SupabaseClient

    private init() {
        self.client = SupabaseClient(
            supabaseURL: URL(string: "https://xzrqxtewxtusdregnryv.supabase.co")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh6cnF4dGV3eHR1c2RyZWducnl2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3MDk5NDMsImV4cCI6MTk5MTI4NTk0M30.iwEoybwrVbpSPaq7eV4LItp-2s7vR1FlHH2jhQlvawk"
        )
    }

    func login(email: String, password: String) async throws -> AppUser {
        print("Attempting login with email: \(email)")
        let session = try await client.auth.signIn(email: email, password: password)
        print("Login successful, user ID: \(session.user.id.uuidString)")
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
}
