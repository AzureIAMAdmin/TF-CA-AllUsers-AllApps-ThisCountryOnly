resource "azuread_conditional_access_policy" "allow_country" {
  display_name = "${var.display_name_cap}"
  state        = var.ca_state

  conditions {
    client_app_types    = ["all"]

    applications {
      included_applications = ["All"]
      excluded_applications = []
    }

    locations {
      included_locations = ["All"]
      excluded_locations = ["${var.display_name_country}"]
    }

    users {
      included_users = ["All"]
      excluded_users = []
    }
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["block"]
  }
}