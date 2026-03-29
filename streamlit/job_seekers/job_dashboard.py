import streamlit as st
import pandas as pd

st.set_page_config(
    page_title="Job Seekers Dashboard",
    page_icon="🏢",
    layout="wide"
)

file_path = "job_seekers.xlsx"


if "data" not in st.session_state:

    try:
        st.session_state.data = pd.read_excel(file_path)

    except:
        st.session_state.data = pd.DataFrame(
            columns=["Name","Age","Skills","Qualifications","Experience","Email"]
        )


st.sidebar.title("📈 Recruiter Panel")

menu = st.sidebar.radio(
    "Navigation",
    ["Dashboard", "Add Candidate", "View Candidates", "Search Candidates"]
)

st.title(" Welcome to Job Seekers Dashboard")
st.markdown("### Manage and track job seeker profiles efficiently")
st.divider()


if menu == "Dashboard":

    st.subheader("📈 Dashboard Overview")

    col1, col2, col3 = st.columns(3)

    with col1:
        st.metric(
            "Total Candidates",
            len(st.session_state.data)
        )

    with col2:
        st.metric(
            "Experienced",
            len(st.session_state.data[
                st.session_state.data["Experience"] > 0
            ])
        )

    with col3:
        st.metric(
            "Freshers",
            len(st.session_state.data[
            st.session_state.data["Experience"] == 0
            ])
        )



elif menu == "Add Candidate":

    with st.form("candidate_form"):

        name = st.text_input("Enter Name")
        age = st.number_input("Enter Age", min_value=18)
        skills = st.text_input("Enter Skills")
        qualification = st.text_input("Qualification")
        experience = st.number_input("Experience", min_value=0)
        email = st.text_input("Email")

        submit = st.form_submit_button("Add Job Seeker")

    if submit:

        new_data = pd.DataFrame(
            [[name, age, skills, qualification, experience, email]],
            columns=st.session_state.data.columns
        )

        st.session_state.data = pd.concat(
            [st.session_state.data, new_data],
            ignore_index=True
        )

        st.session_state.data.to_excel(file_path, index=False)

        st.success("Job seeker added successfully!")



elif menu == "View Candidates":

    st.subheader("📋 Candidate Database")
    st.caption("View, download or manage candidate records")

    st.dataframe(st.session_state.data)

    st.download_button(
        label="Download Candidate Data",
        data=st.session_state.data.to_csv(index=False),
        file_name="job_seekers.csv",
        mime="text/csv"
    )

    delete_email = st.text_input(...)

    if st.button("Delete Candidate"):

        st.session_state.data = st.session_state.data[
            st.session_state.data["Email"] != delete_email
        ]

        st.session_state.data.to_excel(file_path, index=False)

        st.success("Candidate deleted successfully!")



elif menu == "Search Candidates":

    search_skill = st.text_input("Search by Skill")

    experience_filter = st.selectbox(
        "Filter by Experience",
        ["All", "Freshers", "Experienced"]
    )

    filtered_data = st.session_state.data

    if search_skill:
        filtered_data = filtered_data[
            filtered_data["Skills"].str.contains(search_skill, case=False)
        ]

    if experience_filter == "Freshers":
        filtered_data = filtered_data[
            filtered_data["Experience"] == 0
        ]

    elif experience_filter == "Experienced":
        filtered_data = filtered_data[
            filtered_data["Experience"] > 0
        ]

    st.dataframe(filtered_data)