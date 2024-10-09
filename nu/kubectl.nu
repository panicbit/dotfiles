
module kubectl {
    export alias k = ^kubectl

    export alias kg = ^kubectl get
    export alias kgp = ^kubectl get pods
    export alias kgd = ^kubectl get deployments

    export alias kd = ^kubectl describe
    export alias kdp = ^kubectl describe pods
    export alias kdd = ^kubectl describe deployments
}

use kubectl *
