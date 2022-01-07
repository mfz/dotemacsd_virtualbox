(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/home/florian/Notes/AssociationAnalysis.org" "/home/florian/Notes/BayesianMethodsInML.org" "/home/florian/Notes/Blogging.org" "/home/florian/Notes/Books.org" "/home/florian/Notes/CH_and_CVD.org" "/home/florian/Notes/Capture.org" "/home/florian/Notes/CausalInference.org" "/home/florian/Notes/ClassicalMechanics.org" "/home/florian/Notes/ClusterUse.org" "/home/florian/Notes/CognitiveSystems.org" "/home/florian/Notes/DL1.org" "/home/florian/Notes/DL2.org" "/home/florian/Notes/DataAnalysis.org" "/home/florian/Notes/DataSets.org" "/home/florian/Notes/DecodeRecipees.org" "/home/florian/Notes/DeepLearningGenomics.org" "/home/florian/Notes/DeepRepresentationLearning.org" "/home/florian/Notes/DiseaseGeneIdentification.org" "/home/florian/Notes/Dog.org" "/home/florian/Notes/Emacs.org" "/home/florian/Notes/ExpressionAnalysis.org" "/home/florian/Notes/ExpressionDeconvolution.org" "/home/florian/Notes/FunctionalAnnotation.org" "/home/florian/Notes/GPU.org" "/home/florian/Notes/GWAS.org" "/home/florian/Notes/GenomeAssembly.org" "/home/florian/Notes/GenomicVisualizationR.org" "/home/florian/Notes/GenotypeChips.org" "/home/florian/Notes/GenotypeLikelihoods.org" "/home/florian/Notes/ImputationPipeline.org" "/home/florian/Notes/Interview.org" "/home/florian/Notes/Journal.org" "/home/florian/Notes/JuliaModelingToolkit.org" "/home/florian/Notes/Kubernetes.org" "/home/florian/Notes/LLVM.org" "/home/florian/Notes/LinearAlgebra.org" "/home/florian/Notes/LinuxServer.org" "/home/florian/Notes/MGUS.org" "/home/florian/Notes/ModelThinking.org" "/home/florian/Notes/Networks.org" "/home/florian/Notes/NumericalMethods.org" "/home/florian/Notes/PathwayAnalysis.org" "/home/florian/Notes/Phenotypes.org" "/home/florian/Notes/ProbabilisticProgramming.org" "/home/florian/Notes/Programming.org" "/home/florian/Notes/ProteinPrediction.org" "/home/florian/Notes/QuantumComputing.org" "/home/florian/Notes/RNASeq.org" "/home/florian/Notes/ReinforcementLearning.org" "/home/florian/Notes/ReproducibleData.org" "/home/florian/Notes/SciML.org" "/home/florian/Notes/Singularity.org" "/home/florian/Notes/Spark.org" "/home/florian/Notes/StatisticalProcessControl.org" "/home/florian/Notes/StatisticalRethinking.org" "/home/florian/Notes/StatsML.org" "/home/florian/Notes/UbuntuVirtualBox.org" "/home/florian/Notes/VCF.org" "/home/florian/Notes/VariantNormalization.org" "/home/florian/Notes/WritingGNUEmacsExtensions.org" "/home/florian/Notes/caret.org" "/home/florian/Notes/eQTL.org" "/home/florian/Notes/fastai.org" "/home/florian/Notes/gpg.org" "/home/florian/Notes/julia.org" "/home/florian/Notes/juliaSnippets.org" "/home/florian/Notes/pymc3.org"))
 '(package-selected-packages
   '(all-the-icons-ivy-rich org-roam-ui 0blayout helm-bibtex bibtex-completion org-roam-bibtex company-quickhelp ox-hugo yasnippet window-numbering which-key use-package solarized-theme rainbow-delimiters org-plus-contrib org-pdftools ob-julia-vterm lsp-mode jupyter julia-mode doom-themes doom-modeline counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
