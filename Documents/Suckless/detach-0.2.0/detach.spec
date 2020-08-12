%define  RELEASE  1
%define  rel      %{?CUSTOM_RELEASE} %{!?CUSTOM_RELEASE:%RELEASE}

Name:		detach
Version:	0.2.0
Summary:	Detaches a program from the terminal
Release:	%rel
Copyright:	GPL
Group:		Applications/System
Source:		%{name}-%{version}.tar.gz
URL:		http://detach.sourceforge.net/
BuildRoot:	/var/tmp/%{name}-%{version}-root

%description
This program detaches a program from a terminal so that it can run
independently.  This should be useful when running X programs from a
terminal.

%prep
%setup

%build

CFLAGS="$RPM_OPT_FLAGS" ./configure --prefix=%{_prefix} \
        --sysconfdir=%{_sysconfdir} --localstatedir=%{localstatedir} \
        --libdir=%{_libdir} --bindir=%{_bindir} --datadir=%{_datadir} \
        --includedir=%{_includedir} --sbindir=%{_sbindir}

make

%install
rm -rf $RPM_BUILD_ROOT

make prefix=$RPM_BUILD_ROOT%{_prefix} \
        sysconfdir=$RPM_BUILD_ROOT%{_sysconfdir} \
        localstatedir=$RPM_BUILD_ROOT%{localstatedir} \
        libdir=$RPM_BUILD_ROOT%{_libdir} bindir=$RPM_BUILD_ROOT%{_bindir} \
        datadir=$RPM_BUILD_ROOT%{_datadir} \
        includedir=$RPM_BUILD_ROOT%{_includedir} \
        sbindir=$RPM_BUILD_ROOT%{_sbindir} install

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-, root, root)
%doc AUTHORS COPYING README NEWS
%{_bindir}/detach
