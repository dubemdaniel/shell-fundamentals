#!/bin/bash

# location of the todo file
TODO_FILE="$HOME/todo.txt"

# create the file if it doesn't exist
touch "$TODO_FILE"

# keep program running forever until user exits
while true
do
    echo ""
    echo "====== TO-DO LIST ======"
    echo "1. View Tasks"
    echo "2. Add Task"
    echo "3. Delete Task"
    echo "4. Exit"
    echo "========================"

    # ask user to choose option
    read -p "Choose an option: " option

    # check what user selected
    case $option in

        1)
            echo ""
            echo "YOUR TASKS:"
            echo "----------------"

            # check if file is empty
            if [ ! -s "$TODO_FILE" ]; then
                echo "No tasks available."
            else
                # show tasks with numbers
                nl -w2 -s". " "$TODO_FILE"
            fi
            ;;

        2)
            echo ""
            read -p "Enter your task: " task

            # save task into file
            echo "$task" >> "$TODO_FILE"

            echo "Task added successfully!"
            ;;

        3)
            echo ""
            echo "TASK LIST:"
            nl -w2 -s". " "$TODO_FILE"

            echo ""
            read -p "Enter task number to delete: " number

            # delete task by line number
            sed -i "${number}d" "$TODO_FILE"

            echo "Task deleted successfully!"
            ;;

        4)
            echo "Goodbye!"
            exit
            ;;

        *)
            echo "Invalid option."
            ;;
    esac

done
