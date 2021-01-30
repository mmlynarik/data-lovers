from timeit import default_timer as timer


def maskify(cc):
    # Replace all characters in a provided string with # except of the last 4
    return "#"*(len(cc)-4) + cc[-4:]


def maskify2(cc):
    # Replace all characters in a provided string with # except of the last 4
    return cc.replace(cc[:-4], "#"*len(cc[:-4]))


start = timer()
maskify(cc="4556364607935616")
maskify(cc="4556364")
maskify(cc="glkdjhsoihgoieoigewnhoigjhoiewjgoiejgoiewjgoiewjgoiewjg")
end = timer()
print(end - start)

print("-" * 10)

start2 = timer()
maskify2(cc="4556364607935616")
maskify2(cc="4556364")
maskify2(cc="glkdjhsoihgoieoigewnhoigjhoiewjgoiejgoiewjgoiewjgoiewjg")
end2 = timer()
print(end2 - start2)
