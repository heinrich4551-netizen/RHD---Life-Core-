# Config Review

The initial config scaffold is intentionally integration-first. Before packaging for Workshop, validate all inherited base classes, P3D paths, UI icon paths, cargo entries and any external dependency classes against the final Arma 3 installation and selected Workshop dependencies.

The final release must not ship nonexistent placeholder paths. The temporary base-game model references are retained only to establish the class structure while the custom Option 06 models are produced.