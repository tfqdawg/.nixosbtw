{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# c/c++
		gcc
		cmake
		pkg-config

		# python
		(python313.withPackages(
      py: with py; [ numpy pandas scipy matplotlib seaborn ]
    ))

		# typst
		typst
	];
}
