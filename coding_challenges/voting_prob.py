"""
A quick brainstorming on a friends question how to simply rank campaings and users based on their behavior.
"""

def calculate_show_campaign_probability(
    campaigns: int, total_votes: int, votes_given_count: int
) -> str:
    campaign_show_probability = (
        1 / campaigns
        + ((campaigns - 1) * 0.01 / votes_given_count)
        - ((total_votes - votes_given_count) * 0.01 / votes_given_count)
    )
    return print(f"""
    campaings: {campaigns}
    total votes: {total_votes}
    votes given count: {votes_given_count}
    probability to show: {campaign_show_probability}
    """)


calculate_show_campaign_probability(
    campaigns=5, total_votes=1, votes_given_count=1
)

calculate_show_campaign_probability(
    campaigns=5, total_votes=2, votes_given_count=1
)

calculate_show_campaign_probability(
    campaigns=120, total_votes=46, votes_given_count=10
)

calculate_show_campaign_probability(
    campaigns=120, total_votes=46, votes_given_count=1
)


def calculate_user_rank(current_score: float, votes_given_count: int, bonus_points: int, campaigns: int) -> str:
    if votes_given_count == 0:
        new_score = 0
    else:
        new_score = (current_score + bonus_points / votes_given_count + bonus_points) / 1 + campaigns
    return  print(f"""
    current_score: {current_score}
    votes given count: {votes_given_count}
    bonus points {bonus_points}
    campaigns: {campaigns}
    new score: {new_score}
    """)

calculate_user_rank(0, 1, 0, 0)
calculate_user_rank(0, 2, 1, 0)
calculate_user_rank(1, 1, 1, 1)
calculate_user_rank(5, 10, 4, 1)
calculate_user_rank(5, 10, 6, 1)
calculate_user_rank(25, 100, 63, 1)
calculate_user_rank(25, 100, 50, 1)
calculate_user_rank(25, 100, 90, 1)
