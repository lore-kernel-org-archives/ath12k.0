Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49A1CD98CE
	for <ath12k@archiver.kernel.org>; Fri, 12 Jun 2026 20:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rWobm3GD5TmB4esI08HzQseAZB8ymCU6AJWXweueHV8=; b=m1UOOi3Vjybqig
	H6PtmPXe4gJdDEOSxTCrAAfhHwpZWLY3EP1+4bJfmnx9mjcXub1O/KRLnpQ8ZGhf/3TZ1ARWZRjH/
	SFHjALWkQPIgYMUyYNEhPc2nqN9sHkq4qabB7KXQptbqd89pHqvtAM1njCNmlKiwm5/3JIFNE1SlJ
	ilr9VGARC5BMNpRICKf/o+YmIRlRz/dSXVSZeRCGDMIGz+pRFIts9fgJKi+jYQpCmoVSxSCrkIwDT
	3BiBS81VBilGZkyGiWNZ2M0WCGOtGtixHrEMlG+qdp30ciy8AihIQc1o0W3RJIO+1sSFlUOuRXuDx
	2eqMEuww0z8TaGDw3hbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8lA-0000000BYuz-28TR;
	Fri, 12 Jun 2026 20:45:48 +0000
Received: from mail103c25.carrierzone.com ([64.29.147.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8l7-0000000BYud-0gUJ
	for ath12k@lists.infradead.org;
	Fri, 12 Jun 2026 20:45:47 +0000
ARC-Seal: i=1; d=carrierzone.com; s=mailmia; a=rsa-sha256; cv=none;
	t=1781297142;
	b=ybuZJOab+dti+TqpG5KMlAMnjEtHWnEGY7oyK98cISSDBzqij5+OTEvS8JsU2tUi8/9M
	 ArLQ7/736UWkzmDZRZ73qq0lGMzzc8T8hvZ5LBf6NY1N0EGfdUPNNPUXtSNVu8wFZ4NeT
	 GTM9VZ9LFaHgE+du/cOOSGUwz/HydKIhi0=
ARC-Message-Signature: i=1; d=carrierzone.com; s=mailmia; a=rsa-sha256;
	c=relaxed/relaxed; t=1781297142;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=rWobm3GD5TmB4esI08HzQseAZB8ymCU6AJWXweueHV8=;
	b=BtyWrD1FSegmkSJLEWwVFFl65ODxoyzfiynmO53XlwzvgcwtEzVnh0FUmTV2IIzCsNPN
	 MPKOZWLHO01AYslxZhewQIn7+gExT+1kmQu1t6dr4Dnr2r+od6A52/rDeZlHyhtYx6SDP
	 DGilTGEAoSOBh3+1JeGaWVp/I3G2RRUDpo=
ARC-Authentication-Results: i=1; mail103c25.carrierzone.com; arc=none smtp.remote-ip=127.0.0.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1781297142;
	bh=rWobm3GD5TmB4esI08HzQseAZB8ymCU6AJWXweueHV8=;
	h=From:To:CC:Subject:Date:Reply-to;
	b=rf6+w+AIZhbQF+8k3y3fDNnHdeRmkMDmzQ/NAbPsjbSomUrt+ZG8K93my3OqOOdnN
	 K+tFZNhPko89yomZLBP9Vi2kxyrDWcwbULXnFlCpBaF2diGgLD8GZvXOWDmwUA47j0
	 cNknFhtx38AQ0rOi4b4Sb9KBIYKiyiluSgltGGI4=
Authentication-Results: mail103c25.carrierzone.com;
	 none
Received: from mail103c25.carrierzone.com (localhost [127.0.0.1])
	by mail103c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 65CKjfsc585803
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <ath12k@lists.infradead.org>; Fri, 12 Jun 2026 20:45:41 +0000
Received: (from webmail@localhost)
	by mail103c25.carrierzone.com (8.14.9/8.12.2/Submit) id 65CKjelD585796
	for ath12k@lists.infradead.org; Fri, 12 Jun 2026 16:45:40 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: ath12k@lists.infradead.org
CC: 
Subject: COMPEX WLE7000Ex(2/5/6) PROOF OF CONCEPT host APD - update on MLO for
 single band modules
Date: Fri, 12 Jun 2026 16:45:40 -0400
Message-ID: <1781297140.qpgs27exw4w0o84g@mailapp03.register.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-Rspamd-Status: No, score=0.90
X-Rspamd-Result: default: False [0.90 / 6.00];
	FROM_DN_EQ_ADDR(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ONE(0.00)[1];
	SCAN_INIT(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	VADE_SPAMSTATE(0.00)[clean];
	RCVD_TLS_LAST(0.00)[];
	SCAN_DONE(0.00)[0ms];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	HAS_REPLYTO(0.00)[pgupta@hindutool.com];
	LOCAL_OUTBOUND(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-VADE-SPAMCAUSE: dmFkZTEag2VkJW93dCIIeDaGEvdrf4HbLWtedxLYD2YTTfOsTuGagAVYL1QKqPx/x+Ehq4q4/DhUFgI6WcW8b/2Iv6BJea1NiNIT2zWtxvDnHBd19S2PAk5u0r4yYja9q7iwW3NohSr+xb5r8CsoLDcZiDRDJhmj6c+kdXw4aq855unyyRRPpGtfPOg+nSLjyhOdg1v8X405Q3UDl9rxBGuYKZ18al3BwGsmwMI10DG9YwoPGzZgigugnwXLTtwmPZdUPhBySlrM1PqpKwo3yoOI67WdQ37SfJRclbAeqv1Kgut9QIl9ARGEf5cCf+JjEvBOHdg+ohGGLTND/ylhCNRgud5fkm+G22A8apfdtVj46EP8ED7KLZBTuIK3ywnDKuY7/dFzowkLvw5IG/+fVykq7eZA4dDZO5pybjVYAEhRXv6SxQN88CJ5qjAwGLnNmtz3/gipztcv7XIUmgADjfCu16wwqztodpCyLUp8Cvqq6Zl5tcKLlSek+gqy3id2FAUnicxa6M+Lgn/D5ajM08LduEgG1IoOgrnf3n6EZBhsU0UzWxICZxjukk/QgWl47lfNAsyy2YYVpknojfJ3vVr8/a7pLkG92IcsfQpDWOBqOpdNJAEZXNoZXKEV38mGirWl/NSvc3fa40Ei/vM1XzLKFZqqVI/CJ9AP9flS94i4TT+lWw
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_134545_583271_F880747C 
X-CRM114-Status: GOOD (  10.32  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: pgupta@hindutool.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

I have 3 single band compex modules (WLE7000E2, WLE7000E5, WLE7000E6) that =
I am currently
testing under Ubuntu 26.04 stock kernel.
Below is a PoC (Proof of concept) that these modules can work under plain v=
anilla linux (ath12k +
HostAPD)

Note: Firmware binaries are needed from compex
NOTE: DKMS custom compiled module needed for ath12k_wifi driver
NOTE: HostAPD requires recompile with 802.11be support
NOTE: Tested, compiled, stress tested, and output formatted with the help o=
f Claude Code Fable 5
NOTE: I have not yet connected devices to the modules, so I do not have inf=
o on transmission throughput etc.

Prashant

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Compex_Ath12k_HostAPD =E2=80=94 Wi-Fi 7 (802.11be / EHT) PROOF OF CONCEPT
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Status : PROOF OF CONCEPT =E2=80=94 captured live on real hardware
Sanitized : passphrases, SSID branding, usernames, host passwords, MAC
NIC-specific octets, and link-local addresses are MASKED for
public sharing; all command output is otherwise verbatim.
Box : test-router (Dell R730xd), Ubuntu 26.04, kernel 7.0.0-22-generic
Radios : 3=C3=97 Compex WLE7000E (QCN9274 hw2.0, single-band) on PCIe riser=
s
wlp129s0 =3D 2.4 GHz (board_id 0x1, PCIe Slot 1 / bus 81)
wlp133s0 =3D 5 GHz (board_id 0x2, PCIe Slot 2 / bus 85)
wlp132s0 =3D 6 GHz (board_id 0x4, PCIe Slot 3 / bus 84)
Captured : 2026-06-11/12 during the =C2=A7S171 on-box test run
Provenance : Doc 10 (HostAPD and WiFi 7 AP Configuration Guide) PART A0 + B=
1
+ PART D radio configs; bugs found en route fixed in =C2=A7S171
(corrections.md): fragm/rts_threshold legacy sentinels =E2=86=92 -1, and
apt-mark hold hostapd promoted to a required step. Method:
superpowers systematic-debugging + Perplexity research.
Result : ALL THREE radios reach state=3DENABLED with ieee80211be=3D1 and
measurably transmit (beacon airtime) on 2437 / 5745 / 5955 MHz.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

---------------------------------------------------------------------------=
-----
SECTION 1 =E2=80=94 BUILDING THE DRIVER STACK
---------------------------------------------------------------------------=
-----
The single-band Compex QCN9274 cards do NOT enumerate on the stock Ubuntu
26.04 ath12k. Three fixes are required (Doc 10 PART A0, =C2=A7S164), plus a=
n
EHT-capable hostapd userspace build (Doc 10 PART B1, =C2=A7S167 B-26).

1.1 Compex vendor board-2.bin + regdb.bin overlay (Doc 10 A0.1)
The stock linux-firmware package supplies base firmware-2.bin; ONLY the
vendor-tuned board calibration is overlaid (rollback copy kept):
# --- operator-set: lan-fileserver (192.168.0.100) login + the directory
# holding the unzipped Compex package (board-2.bin + regdb.bin) ---
HT_USER=3D<user> # lan-fileserver SSH login
HT_PASS=3D<REDACTED> # lan-fileserver SSH password (no keys)
HT_SRC=3D"/home/Shared Folder/Hardware/Compex Wifi/WLE7000x" # dir with the=
 two .bin files

sudo apt-get install -y sshpass
sudo install -d -m 0755 -o root -g root /opt/compex-wle7000e
for f in board-2.bin regdb.bin; do
sshpass -p "$HT_PASS" scp -P 8888 -o StrictHostKeyChecking=3Daccept-new \
"$HT_USER@192.168.0.100:$HT_SRC/$f" /tmp/
done
sudo install -m 0644 -o root -g root /tmp/board-2.bin /opt/compex-wle7000e/=
board-2.bin
sudo install -m 0644 -o root -g root /tmp/regdb.bin /opt/compex-wle7000e/re=
gdb.bin
rm -f /tmp/board-2.bin /tmp/regdb.bin

# Integrity gate =E2=80=94 MUST print "OK" for BOTH lines before overlaying=
:
sha256sum -c <<'EOF'
2378f4b8303482b197ee0bffe4146a2c928144f30905df8c14006aafdae5bc09 /opt/compe=
x-wle7000e/board-2.bin
3d4208d28014f80799db048994ddfd13cbcda97d8576a8d9f7d8e55299107140 /opt/compe=
x-wle7000e/regdb.bin
EOF

# Keep a one-time rollback copy of the stock board-2.bin, then overlay:
sudo cp -n /lib/firmware/ath12k/QCN9274/hw2.0/board-2.bin \
/lib/firmware/ath12k/QCN9274/hw2.0/board-2.bin.stock 2>/dev/null || true
sudo install -m 0644 /opt/compex-wle7000e/board-2.bin \
/lib/firmware/ath12k/QCN9274/hw2.0/board-2.bin
sudo install -m 0644 /opt/compex-wle7000e/regdb.bin \
/lib/firmware/ath12k/QCN9274/hw2.0/regdb.bin
echo
echo "Compex board-2.bin board-ID coverage (expect 1, 2, 4 present):"
strings /lib/firmware/ath12k/QCN9274/hw2.0/board-2.bin \
| grep -oE 'qmi-board-id=3D[0-9]+' | sort -u

1.2 Patched ath12k via DKMS (Doc 10 A0.2 =E2=80=94 FIX 1 + FIX 2), VERBATIM=
=2E
Installs /usr/local/sbin/ath12k-repatch and builds package
ath12k-qcn9274sb/1.0 for the running kernel. FIX 1 caps wmi_ep_count
for the absent MAC1; FIX 2 skips unknown WMI dma-ring module ids
(fw 1.6 sends id 2/3) instead of aborting the service-ready parse:

install -d -m 0755 /usr/local/sbin
cat > /usr/local/sbin/ath12k-repatch <<'ATH12K_REPATCH'
#!/bin/bash
# /usr/local/sbin/ath12k-repatch =E2=80=94 (re)build the patched single-ban=
d QCN9274
# ath12k for a kernel (default: running kernel). Installed by Doc 10 A0.2;
# invoked manually (sudo ath12k-repatch), by /etc/kernel/postinst.d/
# zz-ath12k-repatch after a kernel upgrade, and by ath12k-dkms-verify.servi=
ce
# at boot (both A0.6). Logs to /var/log/ath12k-repatch.log.
KVER=3D"${1:-$(uname -r)}"
exec > >(tee -a /var/log/ath12k-repatch.log) 2>&1
echo "=3D=3D=3D=3D=3D $(date -Is) ath12k-repatch kernel=3D$KVER pid=3D$ =3D=
=3D=3D=3D=3D"
# if invoked right after an apt run, wait for the dpkg lock to clear:
for _ in $(seq 1 180); do fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1=
 || break; sleep 5; done

apt-get update
apt-get install -y build-essential dkms "linux-headers-$KVER"

# enable deb-src and fetch the kernel source (provides the ath12k tree)
sed -i 's/^Types: deb$/Types: deb deb-src/' /etc/apt/sources.list.d/ubuntu=
=2Esources
apt-get update
[ -f
"/usr/src/linux-${KVER%%-*}/drivers/net/wireless/ath/ath12k/wmi.c" ] || (
cd /usr/src && { apt-get source "linux-image-unsigned-$KVER" ||
apt-get source linux; } )

PKG=3Dath12k-qcn9274sb
VER=3D1.0
SRC=3D"/usr/src/linux-${KVER%%-*}/drivers/net/wireless/ath/ath12k" # e.g. l=
inux-7.0.0
DST=3D"/usr/src/${PKG}-${VER}"

dkms status -m "$PKG" -v "$VER" 2>/dev/null | grep -q "$PKG" && dkms remove=
 -m "$PKG" -v "$VER" --all
rm -rf "$DST"; mkdir -p "$DST"; cp -a "$SRC/." "$DST/"
find "$DST" \( -name '*.o' -o -name '*.ko' -o -name '*.mod' -o -name '*.mod=
=2Ec' \
-o -name '.*.cmd' -o -name 'modules.order' -o -name 'Module.symvers' \) -de=
lete 2>/dev/null

# apply both patches; the python aborts (non-zero) if any anchor is not an =
exact single match
if python3 - "$DST" <<'PYEOF'
import sys, os
def patch(path, old, new, label):
d =3D open(path).read()
n =3D d.count(old)
if n !=3D 1:
sys.exit(f"[FAIL] {label}: expected 1 match in {os.path.basename(path)}, fo=
und {n}")
open(path, "w").write(d.replace(old, new, 1)); print(f"[ OK ] {label}")
ATH =3D sys.argv[1]; HTC =3D ATH+"/htc.c"; WMI =3D ATH+"/wmi.c"
A_OLD =3D ("\tdefault:\n\t\thtc->wmi_ep_count =3D ab->hw_params->max_radios=
;\n\t\tbreak;\n\t}\n")
A_NEW =3D ("\tdefault:\n\t\thtc->wmi_ep_count =3D ab->hw_params->max_radios=
;\n"
"\t\t/* QCN9274 single-band fix (Doc 10 A0.2 / =C2=A7S164): single-MAC card=
s\n"
"\t\t * advertise fewer PHYs via QMI (ab->qmi.num_radios) than\n"
"\t\t * hw_params->max_radios (2 for qcn9274 hw2.0); opening a WMI\n"
"\t\t * endpoint for the absent MAC1 fails. Cap to the fw-reported count.\n=
\t\t */\n"
"\t\tif (ab->qmi.num_radios !=3D U8_MAX &&\n"
"\t\t ab->qmi.num_radios >=3D 1 &&\n"
"\t\t ab->qmi.num_radios < htc->wmi_ep_count)\n"
"\t\t\thtc->wmi_ep_count =3D ab->qmi.num_radios;\n\t\tbreak;\n\t}\n")
B1_OLD =3D ("\tstruct ath12k_dbring_cap *dir_buff_caps;\n\tint ret;\n\tu32 =
i;\n")
B1_NEW =3D ("\tstruct ath12k_dbring_cap *dir_buff_caps;\n\tint ret;\n\tu32 =
i, j;\n")
B2_OLD =3D ("\tdir_buff_caps =3D ab->db_caps;\n"
"\tfor (i =3D 0; i < dma_caps_parse->n_dma_ring_caps; i++) {\n"
"\t\tif (le32_to_cpu(dma_caps[i].module_id) >=3D WMI_DIRECT_BUF_MAX) {\n"
"\t\t\tath12k_warn(ab, \"Invalid module id %d\\n\",\n"
"\t\t\t\t le32_to_cpu(dma_caps[i].module_id));\n"
"\t\t\tret =3D -EINVAL;\n\t\t\tgoto free_dir_buff;\n\t\t}\n\n"
"\t\tdir_buff_caps[i].id =3D le32_to_cpu(dma_caps[i].module_id);\n"
"\t\tdir_buff_caps[i].pdev_id =3D\n"
"\t\t\tDP_HW2SW_MACID(le32_to_cpu(dma_caps[i].pdev_id));\n"
"\t\tdir_buff_caps[i].min_elem =3D le32_to_cpu(dma_caps[i].min_elem);\n"
"\t\tdir_buff_caps[i].min_buf_sz =3D le32_to_cpu(dma_caps[i].min_buf_sz);\n=
"
"\t\tdir_buff_caps[i].min_buf_align =3D le32_to_cpu(dma_caps[i].min_buf_ali=
gn);\n"
"\t}\n\n\treturn 0;\n\nfree_dir_buff:\n"
"\tath12k_wmi_free_dbring_caps(ab);\n\treturn ret;\n}\n")
B2_NEW =3D ("\tdir_buff_caps =3D ab->db_caps;\n"
"\tfor (i =3D 0, j =3D 0; i < dma_caps_parse->n_dma_ring_caps; i++) {\n"
"\t\tif (le32_to_cpu(dma_caps[i].module_id) >=3D WMI_DIRECT_BUF_MAX) {\n"
"\t\t\t/* QCN9274 single-band fix (Doc 10 A0.2 / =C2=A7S164): fw 1.5/1.6\n"
"\t\t\t * advertises dma-ring module ids the host enum does not know;\n"
"\t\t\t * skip them instead of failing the whole service-ready parse.\n\t\t=
\t */\n"
"\t\t\tath12k_warn(ab, \"skipping unsupported dma ring module id %d\\n\",\n=
"
"\t\t\t\t le32_to_cpu(dma_caps[i].module_id));\n"
"\t\t\tcontinue;\n\t\t}\n\n"
"\t\tdir_buff_caps[j].id =3D le32_to_cpu(dma_caps[i].module_id);\n"
"\t\tdir_buff_caps[j].pdev_id =3D\n"
"\t\t\tDP_HW2SW_MACID(le32_to_cpu(dma_caps[i].pdev_id));\n"
"\t\tdir_buff_caps[j].min_elem =3D le32_to_cpu(dma_caps[i].min_elem);\n"
"\t\tdir_buff_caps[j].min_buf_sz =3D le32_to_cpu(dma_caps[i].min_buf_sz);\n=
"
"\t\tdir_buff_caps[j].min_buf_align =3D le32_to_cpu(dma_caps[i].min_buf_ali=
gn);\n"
"\t\tj++;\n\t}\n\n\tab->num_db_cap =3D j;\n\n\treturn 0;\n}\n")
patch(HTC, A_OLD, A_NEW, "FIX 1 htc.c wmi_ep_count cap")
patch(WMI, B1_OLD, B1_NEW, "FIX 2a wmi.c add index j")
patch(WMI, B2_OLD, B2_NEW, "FIX 2b wmi.c skip unknown dma-ring module id")
print("[DONE] patches applied")
PYEOF
then
cat > "$DST/dkms.conf" <<EOF
PACKAGE_NAME=3D"$PKG"
PACKAGE_VERSION=3D"$VER"
AUTOINSTALL=3D"yes"
MAKE[0]=3D"make -C \${kernel_source_dir} M=3D\${dkms_tree}/\${PACKAGE_NAME}=
/\${PACKAGE_VERSION}/build modules"
CLEAN=3D"make -C \${kernel_source_dir} M=3D\${dkms_tree}/\${PACKAGE_NAME}/\=
${PACKAGE_VERSION}/build clean"
BUILT_MODULE_NAME[0]=3D"ath12k"
BUILT_MODULE_LOCATION[0]=3D"."
DEST_MODULE_LOCATION[0]=3D"/updates/dkms"
BUILT_MODULE_NAME[1]=3D"ath12k_wifi7"
BUILT_MODULE_LOCATION[1]=3D"wifi7"
DEST_MODULE_LOCATION[1]=3D"/updates/dkms"
EOF
dkms add -m "$PKG" -v "$VER"
if dkms build -m "$PKG" -v "$VER" -k "$KVER"; then
dkms install -m "$PKG" -v "$VER" -k "$KVER" --force
depmod -a "$KVER"
echo "=3D=3D install paths (MUST be under updates/dkms) =3D=3D"
modinfo -n ath12k ath12k_wifi7
else
echo "!! dkms build FAILED =E2=80=94 tail of make.log:"
find /var/lib/dkms/$PKG/$VER -name make.log -exec tail -n 40 {} \;
fi
else
echo "!! PATCH FAILED =E2=80=94 anchors did not match this kernel's source=
=2E NOT building."
echo " Re-port the patches against /usr/src/linux-*/drivers/net/wireless/at=
h/ath12k/"
echo " (see ubuntu2604-compextroubleshooting.txt)."
fi
ATH12K_REPATCH
chmod 0755 /usr/local/sbin/ath12k-repatch

# build + install the patched ath12k for the CURRENT kernel now (output is
# shown on screen and appended to /var/log/ath12k-repatch.log):
ath12k-repatch


1.3 GRUB: REMOVE iommu=3Dpt, KEEP intel_iommu=3Don (Doc 10 A0.3 =E2=80=94 F=
IX 3), then
reboot. With iommu=3Dpt the firmware's 28 MB 32-bit-coherent HOST_DDR
allocation fails ("qmi dma allocation failed =E2=80=A6 type 1" =E2=86=92 "w=
mi unified
ready -110"). On-box GRUB state is verified in =C2=A73.10 below.

1.4 EHT hostapd userspace build (Doc 10 PART B1) =E2=80=94 the stock apt ho=
stapd,
even at v2.11, is compiled WITHOUT CONFIG_IEEE80211BE and rejects
ieee80211be=3D1. Build 2.11 from source and pin the package:

/usr/sbin/hostapd. The apt package is kept ONLY for its hostapd@.service
systemd template (referenced by the per-radio overrides in PART C):
$ sudo apt install -y build-essential pkg-config libnl-3-dev libnl-genl-3-d=
ev libssl-dev hostapd
$ cd /usr/local/src && sudo rm -rf hostap-2.11 && sudo mkdir -p hostap-2.11=
 && cd hostap-2.11
$ sudo curl -fsSLo hostapd-2.11.tar.gz https://w1.fi/releases/hostapd-2.11=
=2Etar.gz
$ sudo tar xzf hostapd-2.11.tar.gz && cd hostapd-2.11/hostapd
$ sudo cp defconfig .config
# enable Wi-Fi 7 (EHT) + Wi-Fi 6 (HE) + WPA3-SAE + nl80211 driver:
$ for k in CONFIG_DRIVER_NL80211 CONFIG_IEEE80211N
CONFIG_IEEE80211AC CONFIG_IEEE80211AX CONFIG_IEEE80211BE CONFIG_SAE
CONFIG_OWE CONFIG_MBO; do \
sudo sed -i "s|^#${k}=3Dy|${k}=3Dy|" .config; \
grep -q "^${k}=3Dy" .config || echo "${k}=3Dy" | sudo tee -a .config >/dev/=
null; done
$ sudo make -j"$(nproc)"
$ sudo install -m 0755 hostapd hostapd_cli /usr/sbin/ # overwrite the stock=
 (non-EHT) binary
$ sudo apt-mark hold hostapd # =C2=A7S171: PIN the package =E2=80=94 REQUIR=
ED, not optional.
# A later `apt upgrade` silently reinstalls the stock non-EHT hostapd
# over this binary; the radios then fail D6a with "unknown configuration
# item 'ieee80211be'". Observed live on test-router (=C2=A7S171): the box h=
ad
# reverted to 2:2.11-0ubuntu5 and all radios were dead until this rebuild=
=2E
# Un-hold only to deliberately rebuild a newer hostapd: `apt-mark unhold`=
=2E
$ /usr/sbin/hostapd -v # Expected: hostapd v2.11
$ grep '^CONFIG_IEEE80211BE=3Dy' .config && echo "EHT compiled in =E2=9C=93=
"
# After PART B writes the radio configs, CONFIRM the new binary accepts EHT=
:
# sudo /usr/sbin/hostapd -t /etc/hostapd/wlp132s0.conf
# -> must NOT print "unknown configuration item 'ieee80211be'"

---------------------------------------------------------------------------=
-----
SECTION 2 =E2=80=94 HOSTAPD CONFIGURATION FILES (AS TESTED, ONE PER RADIO)
---------------------------------------------------------------------------=
-----
Written by Doc 10 PART D paste blocks (=C2=A7S166 inline literals; =C2=A7S1=
71
fragm/rts_threshold=3D-1 fix in the 2.4 GHz file). These are the EXACT file=
s
the running APs in Section 4 were started from, fetched off the box:


----------------------------------------------------------------------
/etc/hostapd/wlp129s0.conf (as tested =E2=80=94 config hash redacted in thi=
s public copy)
----------------------------------------------------------------------
# hostapd configuration =E2=80=94 wlp129s0 / 2.4 GHz
# Hardware: Compex WLE7000E2 =E2=80=94 test-router
# Bridge: wbr (192.168.1.0/24)
# Generated 2026-06-12T00:49:14+00:00 by Doc 10 PART B3 static-literal past=
e

interface=3Dwlp129s0
ctrl_interface=3D/run/hostapd-wlp129s0
ctrl_interface_group=3Dhostapd
bridge=3Dwbr
driver=3Dnl80211

ssid=3DExampleNet-2.4GHz
country_code=3DUS
# country_code=3DUS matches the self-managed ath12k US/DFS-FCC domain
# (the radios ignore 'iw reg set'; see PART A7).

hw_mode=3Dg
channel=3D6
# 2.4 GHz (US): ch 1-11 at 30 dBm; ch 6 chosen for clean non-overlap
# (1/6/11 plan). channel=3D0 enables ACS if ath12k supports it
# (verify via 'iw phy phyN info | grep -i acs').

ieee80211d=3D1
ieee80211h=3D1
ieee80211n=3D1
ieee80211ac=3D0
ieee80211ax=3D1
ieee80211be=3D1

wds_sta=3D1
wds_bridge=3Dwbr

ht_capab=3D[HT40+][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_CCK-40=
]

he_su_beamformer=3D1
he_su_beamformee=3D1
he_mu_beamformer=3D1
he_bss_color=3D1
he_bss_color_partial=3D0

# Security =E2=80=94 WPA3-Personal transition (SAE + SAE-EXT-KEY + WPA-PSK)
wpa=3D2
wpa_key_mgmt=3DSAE SAE-EXT-KEY WPA-PSK
wpa_passphrase=3D<REDACTED-PASSPHRASE>
rsn_pairwise=3DCCMP CCMP-256 GCMP-256
group_cipher=3DCCMP
sae_require_mfp=3D1
ieee80211w=3D1

macaddr_acl=3D0

beacon_int=3D100
dtim_period=3D2
rts_threshold=3D-1
fragm_threshold=3D-1
max_num_sta=3D100

logger_syslog=3D-1
logger_syslog_level=3D2
logger_stdout=3D-1
logger_stdout_level=3D2

----------------------------------------------------------------------
/etc/hostapd/wlp133s0.conf (as tested =E2=80=94 config hash redacted in thi=
s public copy)
----------------------------------------------------------------------
# hostapd configuration =E2=80=94 wlp133s0 / 5 GHz UNII-3 ch149 80 MHz
# Hardware: Compex WLE7000E5 =E2=80=94 test-router
# Bridge: wbr (192.168.1.0/24)
# Generated $(date -Iseconds) by Doc 10 PART B4 static-literal paste

interface=3Dwlp133s0
ctrl_interface=3D/run/hostapd-wlp133s0
ctrl_interface_group=3Dhostapd
bridge=3Dwbr
driver=3Dnl80211

ssid=3DExampleNet-5GHz
country_code=3DUS
# country_code=3DUS (self-managed US/DFS-FCC domain). UNII-3 5735-5855
# MHz at 30 dBm, no DFS; ch149 80 MHz (center idx 155) covers 5735-5825.

hw_mode=3Da
channel=3D149

ieee80211d=3D1
ieee80211h=3D1
ieee80211n=3D1
ieee80211ac=3D1
ieee80211ax=3D1
ieee80211be=3D1

wds_sta=3D1
wds_bridge=3Dwbr

vht_capab=3D[MAX-MPDU-11454][SHORT-GI-80][SHORT-GI-160][TX-STBC-2BY1][RX-ST=
BC-1][SU-BEAMFORMER][SU-BEAMFORMEE][MU-BEAMFORMER][RX-ANTENNA-PATTERN][TX-A=
NTENNA-PATTERN]
vht_oper_chwidth=3D1
vht_oper_centr_freq_seg0_idx=3D155

ht_capab=3D[HT40+][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1]

he_su_beamformer=3D1
he_su_beamformee=3D1
he_mu_beamformer=3D1
he_oper_chwidth=3D1
he_oper_centr_freq_seg0_idx=3D155

eht_oper_chwidth=3D1
eht_oper_centr_freq_seg0_idx=3D155

he_bss_color=3D2
he_bss_color_partial=3D0

# Security =E2=80=94 WPA3-Personal transition (SAE + SAE-EXT-KEY + WPA-PSK)
wpa=3D2
wpa_key_mgmt=3DSAE SAE-EXT-KEY WPA-PSK
wpa_passphrase=3D<REDACTED-PASSPHRASE>
rsn_pairwise=3DCCMP CCMP-256 GCMP-256
group_cipher=3DCCMP
sae_require_mfp=3D1
ieee80211w=3D1

macaddr_acl=3D0

beacon_int=3D100
dtim_period=3D2
max_num_sta=3D100

logger_syslog=3D-1
logger_syslog_level=3D2

----------------------------------------------------------------------
/etc/hostapd/wlp132s0.conf (as tested =E2=80=94 config hash redacted in thi=
s public copy)
----------------------------------------------------------------------
# hostapd configuration =E2=80=94 wlp132s0 / 6 GHz / Indoor LPI
# Hardware: Compex WLE7000E6 =E2=80=94 test-router
# Bridge: wbr (192.168.1.0/24)
# Generated $(date -Iseconds) by Doc 10 PART B5 static-literal paste

interface=3Dwlp132s0
ctrl_interface=3D/run/hostapd-wlp132s0
ctrl_interface_group=3Dhostapd
bridge=3Dwbr
driver=3Dnl80211

ssid=3DExampleNet-6GHz
country_code=3DUS
country3=3D0x49
# country3=3D0x49 ("I") =3D Indoor (LPI). ath12k is self-managed US/DFS-FCC=
;
# the full 6 GHz band (UNII-5/6/7/8) is available at 30 dBm LPI, no AFC.

hw_mode=3Da
channel=3D1
op_class=3D134

ieee80211d=3D1
ieee80211h=3D0
ieee80211n=3D0
ieee80211ac=3D0
ieee80211ax=3D1
ieee80211be=3D1

wds_sta=3D1
wds_bridge=3Dwbr

he_oper_chwidth=3D2
he_oper_centr_freq_seg0_idx=3D15

eht_oper_chwidth=3D2
eht_oper_centr_freq_seg0_idx=3D15

he_su_beamformer=3D1
he_su_beamformee=3D1
he_mu_beamformer=3D1
he_bss_color=3D3
he_bss_color_partial=3D0

# Security =E2=80=94 WPA3-Personal ONLY (mandatory for 6 GHz; PMF required)
wpa=3D2
wpa_key_mgmt=3DSAE SAE-EXT-KEY
wpa_passphrase=3D<REDACTED-PASSPHRASE>
rsn_pairwise=3DGCMP-256 CCMP-256
group_cipher=3DGCMP-256
sae_require_mfp=3D1
ieee80211w=3D2

macaddr_acl=3D0

beacon_int=3D100
dtim_period=3D2
max_num_sta=3D100

logger_syslog=3D-1
logger_syslog_level=3D2


---------------------------------------------------------------------------=
-----
SECTION 3 =E2=80=94 TEST BATTERY: RADIOS UP & HARDWARE RECOGNIZED (live out=
put)
---------------------------------------------------------------------------=
-----

##### SECTION 3 BATTERY =E2=80=94 HARDWARE RECOGNITION #####

=3D=3D=3D 3.1 PCIe enumeration (lspci) =E2=80=94 three QCN9274 radios =3D=
=3D=3D
$ lspci -nn | grep -i 'qcom\|17cb'
81:00.0 Network controller [0280]: Qualcomm Technologies, Inc QCN62xx/92xx =
Wireless Network Adapter [17cb:1109] (rev 01)
84:00.0 Network controller [0280]: Qualcomm Technologies, Inc QCN62xx/92xx =
Wireless Network Adapter [17cb:1109] (rev 01)
85:00.0 Network controller [0280]: Qualcomm Technologies, Inc QCN62xx/92xx =
Wireless Network Adapter [17cb:1109] (rev 01)

=3D=3D=3D 3.2 Dell SMBIOS slot mapping =3D=3D=3D
$ dmidecode -t slot | grep -E 'Designation|Bus Address' (PCIe slots 1-3)
Designation: PCIe Slot 1
Bus Address: 0000:81:00.0
Designation: PCIe Slot 2
Bus Address: 0000:85:00.0
Designation: PCIe Slot 3
Bus Address: 0000:84:00.0
Bus Address: 0000:82:00.0

=3D=3D=3D 3.3 DKMS module (patched ath12k =E2=80=94 Doc 10 PART A0.2) =3D=
=3D=3D
$ dkms status
ath12k-qcn9274sb/1.0, 7.0.0-22-generic, x86_64: installed (Original modules=
 exist)

=3D=3D=3D 3.4 Loaded driver stack =3D=3D=3D
$ lsmod | grep -E 'ath12k|mac80211|cfg80211'
ath12k_wifi7 147456 0
ath12k 921600 1 ath12k_wifi7
mac80211 1933312 2 ath12k,ath12k_wifi7
cfg80211 1536000 3 ath12k,ath12k_wifi7,mac80211

=3D=3D=3D 3.5 ath12k firmware + board file probe (dmesg) =3D=3D=3D
$ dmesg | grep -iE 'ath12k' | grep -iE 'board|firmware|wmi.*ready|pdev' | h=
ead -12
[ 15.505265] ath12k_wifi7_pci 0000:84:00.0: chip_id 0x0 chip_family 0xb boa=
rd_id 0x4 soc_id 0x401a2200
[ 15.509679] ath12k_wifi7_pci 0000:85:00.0: chip_id 0x0 chip_family 0xb boa=
rd_id 0x2 soc_id 0x401a2200
[ 15.510291] ath12k_wifi7_pci 0000:81:00.0: chip_id 0x0 chip_family 0xb boa=
rd_id 0x1 soc_id 0x401a2200

=3D=3D=3D 3.6 Compex board-2.bin overlay in place (Doc 10 PART A0.1) =3D=3D=
=3D
$ ls -la /lib/firmware/ath12k/QCN9274/hw2.0/
total 4920
drwxr-xr-x 2 root root 4096 Jun 6 03:51 .
drwxr-xr-x 3 root root 4096 Apr 20 18:07 ..
lrwxrwxrwx 1 root root 44 Mar 19 12:32 Notice.txt.zst -> ../../../ath11k/IP=
Q6018/hw1.0/Notice.txt.zst
-rw-r--r-- 1 root root 910008 Jun 6 02:22 board-2.bin
-rw-r--r-- 1 root root 45353 Mar 19 12:32 board-2.bin.zst
-rw-r--r-- 1 root root 4035287 Mar 19 12:32 firmware-2.bin.zst
-rw-r--r-- 1 root root 25656 Jun 6 02:22 regdb.bin

=3D=3D=3D 3.7 Three PHYs enumerated =3D=3D=3D
$ ls /sys/class/ieee80211/ ; iw dev
phy0
phy1
phy2
phy#2
Interface wlp132s0
addr 04:f0:21:xx:xx:3b
type managed
phy#1
Interface wlp129s0
addr 04:f0:21:xx:xx:84
type managed
phy#0
Interface wlp133s0
addr 04:f0:21:xx:xx:fe
type managed

=3D=3D=3D 3.8 EHT (Wi-Fi 7 / 802.11be) capability per PHY =3D=3D=3D
$ iw phy phy0 info | grep -c EHT =E2=86=92 22 EHT capability lines
[phy0] EHT MAC Capabilities (0x3700):
[phy0] EHT PHY Capabilities (0xe2ffdbe0187700001c):
$ iw phy phy1 info | grep -c EHT =E2=86=92 19 EHT capability lines
[phy1] EHT MAC Capabilities (0xb700):
[phy1] EHT PHY Capabilities (0xe00103e0187700001c):
$ iw phy phy2 info | grep -c EHT =E2=86=92 25 EHT capability lines
[phy2] EHT MAC Capabilities (0x3700):
[phy2] EHT PHY Capabilities (0xe2ffdbe0187700001c):

=3D=3D=3D 3.9 Band support per PHY (which radio is which band) =3D=3D=3D
phy0 =E2=86=92 interface wlp133s0 =E2=86=92 Band 2 (Band 1=3D2.4GHz, Band 2=
=3D5GHz, Band 4=3D6GHz)
phy1 =E2=86=92 interface wlp129s0 =E2=86=92 Band 1 (Band 1=3D2.4GHz, Band 2=
=3D5GHz, Band 4=3D6GHz)
phy2 =E2=86=92 interface wlp132s0 =E2=86=92 Band 4 (Band 1=3D2.4GHz, Band 2=
=3D5GHz, Band 4=3D6GHz)

=3D=3D=3D 3.10 EHT-capable hostapd build (Doc 10 PART B1) =3D=3D=3D
$ /usr/sbin/hostapd -v ; apt-mark showhold
hostapd v2.11
apt-mark hold: hostapd

---------------------------------------------------------------------------=
-----
SECTION 4 =E2=80=94 TEST BATTERY: RADIOS TRANSMITTING UNDER HOSTAPD (live o=
utput)
---------------------------------------------------------------------------=
-----
=3D=3D=3D 4.1 Start all three APs (hostapd -B, per-radio config) =3D=3D=3D
$ hostapd -B /etc/hostapd/wlp129s0.conf
wlp129s0: interface state UNINITIALIZED->COUNTRY_UPDATE
wlp129s0: interface state COUNTRY_UPDATE->HT_SCAN
$ hostapd -B /etc/hostapd/wlp133s0.conf
wlp133s0: interface state UNINITIALIZED->COUNTRY_UPDATE
wlp133s0: interface state COUNTRY_UPDATE->HT_SCAN
$ hostapd -B /etc/hostapd/wlp132s0.conf
SAE: Enabling SAE H2E on 6 GHz
wlp132s0: interface state UNINITIALIZED->COUNTRY_UPDATE
wlp132s0: interface state COUNTRY_UPDATE->ENABLED

=3D=3D=3D 4.2 Daemons running =3D=3D=3D
$ pgrep -a hostapd
276000 /usr/sbin/hostapd -B /etc/hostapd/wlp129s0.conf
276004 /usr/sbin/hostapd -B /etc/hostapd/wlp133s0.conf
276009 /usr/sbin/hostapd -B /etc/hostapd/wlp132s0.conf

=3D=3D=3D 4.3 hostapd_cli STATUS per radio (the Doc 10 D6a gate) =3D=3D=3D
$ hostapd_cli -p /run/hostapd-wlp129s0 -i wlp129s0 status | grep -E 'state|=
ieee80211be|freq|ssid|channel'
state=3DENABLED
phy=3Dphy1
freq=3D2437
channel=3D6
ieee80211ax=3D1
ieee80211be=3D1
eht_oper_chwidth=3D0
ssid[0]=3DExampleNet-2.4GHz
num_sta[0]=3D0

$ hostapd_cli -p /run/hostapd-wlp133s0 -i wlp133s0 status | grep -E 'state|=
ieee80211be|freq|ssid|channel'
state=3DENABLED
phy=3Dphy0
freq=3D5745
channel=3D149
ieee80211ax=3D1
ieee80211be=3D1
eht_oper_chwidth=3D1
ssid[0]=3DExampleNet-5GHz
num_sta[0]=3D0

$ hostapd_cli -p /run/hostapd-wlp132s0 -i wlp132s0 status | grep -E 'state|=
ieee80211be|freq|ssid|channel'
state=3DENABLED
phy=3Dphy2
freq=3D5955
channel=3D1
ieee80211ax=3D1
ieee80211be=3D1
eht_oper_chwidth=3D2
ssid[0]=3DExampleNet-6GHz
num_sta[0]=3D0

=3D=3D=3D 4.4 iw dev =E2=80=94 AP mode, live channel/width/txpower =3D=3D=
=3D
$ iw dev
Interface wlp132s0
type AP
channel 1 (5955 MHz), width: 160 MHz, center1: 6025 MHz
txpower 21.00 dBm
Interface wlp129s0
type AP
channel 6 (2437 MHz), width: 20 MHz, center1: 2437 MHz
txpower 26.00 dBm
Interface wlp133s0
type AP
channel 149 (5745 MHz), width: 80 MHz, center1: 5775 MHz
txpower 24.00 dBm

=3D=3D=3D 4.5 Beacon TX proof =E2=80=94 'channel transmit time' delta over =
10 s (0 stations) =3D=3D=3D
wlp129s0 : channel-transmit-time 1400 ms -> 1649 ms (=CE=94=3D249 ms airtim=
e TX'd in 10 s, zero clients =3D beacons)
wlp133s0 : channel-transmit-time 417 ms -> 462 ms (=CE=94=3D45 ms airtime T=
X'd in 10 s, zero clients =3D beacons)
wlp132s0 : channel-transmit-time 209 ms -> 244 ms (=CE=94=3D35 ms airtime T=
X'd in 10 s, zero clients =3D beacons)

=3D=3D=3D 4.5b raw survey excerpt (wlp132s0, 6 GHz, in-use channel) =3D=3D=
=3D
$ iw dev wlp132s0 survey dump (in-use channel block)
frequency: 5955 MHz [in use]
noise: -102 dBm
channel active time: 68960 ms
channel busy time: 1012 ms
channel receive time: 0 ms
channel transmit time: 244 ms
=3D=3D=3D 4.6 wbr bridge membership (hostapd auto-enslaved the AP interface=
s) =3D=3D=3D
$ ip link show master wbr
wlp133s0:
wlp129s0:
wlp132s0:

=3D=3D=3D 4.7 eno2 lifeline untouched =3D=3D=3D
eno2 UP 192.168.0.252/24 fe80::xxxx:xxxx:xxxx:xxxx/64

---------------------------------------------------------------------------=
-----
NOTES
---------------------------------------------------------------------------=
-----
* Interpretation of =C2=A74.5: with num_sta[0]=3D0 on every BSS (no clients=
), a
rising "channel transmit time" is airtime spent EMITTING =E2=80=94 i.e. bea=
cons.
All three radios accumulate TX airtime (2.4 GHz beacons at 20 MHz cost the
most airtime; 6 GHz EHT160 the least), proving RF output on 2437 MHz,
5745 MHz, and 5955 MHz simultaneously.
* The three APs were LEFT RUNNING after capture so the SSIDs
(ExampleNet-2.4GHz / -5GHz / -6GHz, WPA3-SAE) can be verified with any
client device. Stop them with: sudo pkill -f 'hostapd.*wlp'
* hostapd `-t` is NOT a config-test flag (it means "timestamp logs" and run=
s
the AP in the foreground); a valid config therefore blocks. Use the D6a
hostapd_cli gate (as in =C2=A74.3) for positive verification.
* The eno2 management lifeline (192.168.0.252) was untouched throughout.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
END OF DOCUMENT
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

