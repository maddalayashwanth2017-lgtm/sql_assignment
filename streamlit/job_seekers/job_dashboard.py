import streamlit as st
import pandas as pd
import mysql.connector
import os


# ---------------- DATABASE CONNECTION ---------------- #

password=os.getenv("DB_PASSWORD")
password="YASHwanth@9866"

import os
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password=os.getenv("DB_PASSWORD"),
    database="job_dashboard"
)

cursor = conn.cursor(dictionary=True)


# ---------------- PAGE CONFIG ---------------- #

st.set_page_config(
    page_title="Job Seekers Dashboard",
    page_icon="🏢",
    layout="wide"
)


# ---------------- CUSTOM UI STYLE ---------------- #

st.markdown("""
<style>

/* Page background */
.main {
    background: linear-gradient(180deg,#020617,#020617);
}

/* Sidebar */
[data-testid="stSidebar"] {
    background: linear-gradient(180deg,#020617,#111827);
}

/* Card container */
.card {
    background: linear-gradient(135deg,#0f172a,#020617);
    padding: 25px;
    border-radius: 18px;
    color: white;
    transition: 0.3s ease;
    border: 1px solid rgba(255,255,255,0.05);
}

/* Hover animation */
.card:hover {
    transform: translateY(-5px);
    box-shadow: 0px 12px 40px rgba(0,0,0,0.6);
}

/* Metric number */
.card h1 {
    color: #3b82f6;
}

/* Metric label */
.card h3 {
    color: #94a3b8;
}

/* Candidate card */
.profile-card {
    background: linear-gradient(135deg,#020617,#0f172a);
    padding: 20px;
    border-radius: 16px;
    margin-bottom: 15px;
    border: 1px solid rgba(255,255,255,0.05);
}

/* Buttons */
.stButton>button {
    background: linear-gradient(90deg,#2563eb,#3b82f6);
    color: white;
    border-radius: 12px;
}

/* Glow animation */
@keyframes glowPulse {

    0% {
        text-shadow: 0 0 5px #3b82f6;
    }

    50% {
        text-shadow:
        0 0 15px #3b82f6,
        0 0 30px #3b82f6,
        0 0 45px #2563eb;
    }

    100% {
        text-shadow: 0 0 5px #3b82f6;
    }
}

/* Header with glow */
.dashboard-title {
    font-size: 42px;
    font-weight: 700;
    color: #3b82f6;
    animation: glowPulse 2.5s infinite ease-in-out;
}
            /* Metric number glow animation */

@keyframes metricGlow {

    0% {
        text-shadow: 0 0 2px #3b82f6;
    }

    50% {
        text-shadow:
        0 0 8px #3b82f6,
        0 0 16px #2563eb;
    }

    100% {
        text-shadow: 0 0 2px #3b82f6;
    }
}

.metric-number {
    animation: metricGlow 2s infinite ease-in-out;
}
            


</style>
""", unsafe_allow_html=True)



# ---------------- LOAD DATA FROM MYSQL ---------------- #

query = "SELECT * FROM candidates"
cursor.execute(query)

data = cursor.fetchall()

st.session_state.data = pd.DataFrame(
    data,
    columns=["name","age","skills","qualification","experience","email"]
)


# ---------------- SIDEBAR ---------------- #

st.sidebar.markdown("## 🏢 Recruiter Control Panel")

menu = st.sidebar.radio(
    "Navigation",
    ["Dashboard", "Add Candidate", "View Candidates", "Search Candidates"]
)



# ---------------- HEADER ---------------- #

st.markdown("""
<div class="dashboard-title">
🏢 Recruiter Analytics Dashboard
</div>
""", unsafe_allow_html=True)
st.markdown("### Manage and track job seeker profiles efficiently")
st.divider()


# ---------------- DASHBOARD PAGE ---------------- #


if menu == "Dashboard":

    st.subheader("📈 Dashboard Overview")

    col1, col2, col3 = st.columns(3)

    with col1:
        st.markdown(f"""
        <div class="card">
            <h3>Total Candidates</h3>
            <h1 class="metric-number">{len(st.session_state.data)}</h1>
        </div>
        """, unsafe_allow_html=True)


    with col2:
        st.markdown(f"""
        <div class="card">
            <h3>Experienced</h3>
            <h1 class="metric-number">{len(st.session_state.data[
                st.session_state.data["experience"] > 0
            ])}</h1>
        </div>
        """, unsafe_allow_html=True)


    with col3:
        st.markdown(f"""
        <div class="card">
            <h3>Freshers</h3>
            <h1 class="metric-number">{len(st.session_state.data[
                st.session_state.data["experience"] == 0
            ])}</h1>
        </div>
        """, unsafe_allow_html=True)

# ---------------- ADD CANDIDATE PAGE ---------------- #

elif menu == "Add Candidate":

    with st.form("candidate_form", clear_on_submit=True):

        name = st.text_input("Enter Name")
        age = st.number_input("Enter Age", min_value=18)
        skills = st.text_input("Enter Skills")
        qualification = st.text_input("Qualification")
        experience = st.number_input("experience", min_value=0)
        email = st.text_input("Email")

        submit = st.form_submit_button("Add Job Seeker")


    if submit:

        if name == "" or skills == "" or qualification == "" or email == "":
            st.error("Please fill all required fields")

        elif "@" not in email:
            st.error("Enter a valid email address")

        else:
            cursor.execute(
                """
                INSERT INTO candidates
                VALUES (%s,%s,%s,%s,%s,%s)
                """,
                (name, age, skills, qualification, experience, email)
            )

            conn.commit()

            st.success("Job seeker added successfully!")

            st.rerun()


# ---------------- VIEW CANDIDATES PAGE ---------------- #

elif menu == "View Candidates":

    st.subheader("📋 Candidate Database")

    if st.session_state.data.empty:
        st.warning("No candidates available yet.")

    else:

        cols = st.columns(2)

        for i, row in st.session_state.data.iterrows():

            with cols[i % 2]:

                st.markdown(f"""
                <div class="profile-card">

                <h3>👤 {row['name']}</h3>

                📧 {row['email']} <br>
                🎓 {row['qualification']} <br>
                💼 Experience: {row['experience']} years <br>
                🛠 Skills: {row['skills']}

                </div>
                """, unsafe_allow_html=True)


                if st.button(
                    f"Delete {row['email']}",
                    key=row["email"]
                ):

                    cursor.execute(
                        "DELETE FROM candidates WHERE email=%s",
                        (row["email"],)
                    )

                    conn.commit()

                    st.success("Candidate deleted successfully!")

                    st.rerun()
# ---------------- SEARCH CANDIDATES PAGE ---------------- #

elif menu == "Search Candidates":

    st.subheader("🔎 Search Candidates")

    search_name = st.text_input("Search by Name")

    search_skill = st.text_input("Search by Skill")

    experience_filter = st.selectbox(
        "Filter by experience",
        ["All", "Freshers", "Experienced"]
    )


    filtered_data = st.session_state.data


    if search_name:

        filtered_data = filtered_data[
            filtered_data["name"].str.contains(
                search_name,
                case=False
            )
        ]


    if search_skill:

        filtered_data = filtered_data[
            filtered_data["skills"].str.contains(
                search_skill,
                case=False
            )
        ]


    if experience_filter == "Freshers":

        filtered_data = filtered_data[
            filtered_data["experience"] == 0
        ]


    elif experience_filter == "Experienced":

        filtered_data = filtered_data[
            filtered_data["experience"] > 0
        ]


    st.dataframe(filtered_data)
    