          regexBranchPattern="git branch -r | grep -E 'origin/feature-E-[0-9]+-.*' | sed 's|origin/||'"
          echo "$RESULTADO_JSON" | jq -r '.items[].path' | grep -P "$regexBranchPattern"


          # Obtener las ramas fusionadas en main
          MERGED_BRANCHES=$(git branch -a --format "%(refname:short) %(upstream)" | awk '$2 !~/\/origin\// { print $1 }')

          # Filtrar solo las que cumplan con el patrón
          FILTERED_BRANCHES=$(echo "$MERGED_BRANCHES" | grep -E "$regexBranchPatter" || true)

          if [[ -z "$FILTERED_BRANCHES" ]]; then
            echo "No merged feature branches to delete."
            exit 0
          fi

          echo "Deleting merged feature branches:"
          echo "$FILTERED_BRANCHES"

          for BRANCH in $FILTERED_BRANCHES; do
            echo "$BRANCH"
            #git push origin --delete $BRANCH
          done