          regexBranchPattern=$(git branch -r | grep -E 'origin/feature-E-[0-9]+-.*' | sed 's|origin/||')
          echo "$regexBranchPattern"

          echo "-----------------------------------------------------------------------------------------------------------------"

          
          # Obtener las ramas fusionadas en main
          MERGED_BRANCHES=$( git branch -a --format "%(refname:short) %(upstream)" --merged main | awk '$2 !~/\/origin\// { print $1 }')
          echo "-----------------------------------------------------------------------------------------------------------------"

          #MERGED_BRANCHES=$(git branch --merged)
          echo "-----------------------------------------------------------------------------------------------------------------"

          
          # Filtrar solo las que cumplan con el patrón
          FILTERED_BRANCHES=$(echo "$MERGED_BRANCHES" | grep -E "$regexBranchPatter" || true)
          echo "-----------------------------------------------------------------------------------------------------------------"
          
          sleep 5
          if [[ -z "$FILTERED_BRANCHES" ]]; then
            echo "b_stories_merged=true" >> $GITHUB_OUTPUT
            echo "b_branch_name=$MERGED_BRANCHES" >> $GITHUB_OUTUPUT
          else
            echo "b_stories_merged=false" >> $GITHUB_OUPUT
            exit 0
          fi
          echo "-----------------------------------------------------------------------------------------------------------------"
          echo "No stories merged"

          echo "Deleting merged feature branches:"
          echo "$FILTERED_BRANCHES"

          for BRANCH in $FILTERED_BRANCHES; do  
            echo "$BRANCH"
            git push origin --delete $BRANCH
          done