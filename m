Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A49CC369DC
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYlXOPj1cgIGd6V6anYcfQS7uvt1A+zSUbBbB+MHYyk=; b=lFWh1FLnLEyPOxyucDsnq7cD/6
	2d6DLHxqhUBGt6VjlCqzqV9iiyKApNIv2ji3Us8ldj5rgUZPX5ttdHp149RYOWI9d7ahbz+Orvott
	gXhjpZZfuQPeM//9aZr89qC3tt+B7//tgGSyFsg/ldGM464qYgzGoJELXVtEwQXsE9Xs4qIAvl3Ad
	c9NFx4H1Ykqn7RqJZetSJWKWrMzlCdkyU4E31+wWfTQ2NHP8poc2RRjyHwz00sw4qrjODRZdlvgPM
	XHjHA117z4LlUOr2X6su37jymMT6I5vGhyCXh8d3InxA2hFCCGmT1nU9l+T4JkgXqOdNDSHBUN3LO
	dpej0JhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hAm-000000096kK-3FFa;
	Tue, 29 Apr 2025 09:22:40 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hAk-000000096jD-1XVs
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 09:22:39 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso11137755a12.0
        for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 02:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745918556; x=1746523356; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYlXOPj1cgIGd6V6anYcfQS7uvt1A+zSUbBbB+MHYyk=;
        b=BBgC3nBTjO6SKBtMC9KETGQ2b5nKG8tMV/guwvsE2T5pI8KhOAxh5pY2FEvO87pbP+
         gGFGIEsWlhAP9LeojBeVxw6Y76QduDd1Nlad8ehr5T0QhCg9p2YBYLRYEFXOFoetCGww
         jEbdIR/GujPB5OAOS5pQQS1HIK/WNzt6h9x2iupll1Kb4Mk4oq1g7p49XmTkWBtU+k5s
         5uzBspwrUM5snB1JFe0LLpfTsG0qGrBqRJFFvIdlkuC3Cw5ewwz9dKJxsEmDE1RLu5uB
         y50/I8kqnNePvtzvHwr3g6cD2P10Nkde83pHRe5/Az4MVNoShTz9Ki564LojJTMalhfz
         Hnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918556; x=1746523356;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYlXOPj1cgIGd6V6anYcfQS7uvt1A+zSUbBbB+MHYyk=;
        b=r7Ys00sl9zQml9wwXx7x7lO0NQiHb4IrSMdq88cmvPIx0WbhF86490isx/15QpcRBb
         Og/bRD7U5k/fzK02u4eeh84Ei53fa1v+eEBfuRurntrEnU0nKiUwAKpRmMw+bKt+F7G9
         +XIC0o3ACkWn+TpaM0mLCVtjlkkGnRwLOonnWJha+cN6WZC0LFrQBIjUX9Yhyfp/zTxv
         C4mVTSs2AsOYojReyw+0vkHew/K/+Ssuds8T6TLKbx129UeWWhQDNMbOxuQ4z0lhtluY
         vUW4ZxaMDmHmK9FzVgcLPF8bqHOg9I56pY2gvgxcMYng8zRu8Li6V4V0PVZ/R4NdnwF5
         EjPg==
X-Gm-Message-State: AOJu0Yy/sbMvXZYPi27Jotrkz641Z1o8vHaW9NYWaDThk/hLBkQ89Xwh
	g9r/PzO8hwo/DJSnPjYxygOfxWHxaUg7ONLwcHGTJDEeR0K1jcfnPXuCLg==
X-Gm-Gg: ASbGncvqyAsuNH/XOshFe7uE+AKVoiCeq6tcjSLjUODCCyoD5LMS6gGBv0iMhcdzzKm
	YPW0WYmxwrL7xIm/ykO7N+J4nDltdMnKDrY2LFkiQovZgxKOqHBRwesPLUdpw71UO68Crr4SPVu
	MtFIuR/wv3XeFnfqEG8xgph6Bb3niy6rSRuhJa/eW/P9/lnaKvS8m0Rhg5d5mT8tss95KmyPtw9
	GIAH+tyfQexbO7KNMyRa4YMjo9FJCKuoJdQTiDi7QnRBuYsX5BKt7UBifdX4JwtXpCczMq+UowG
	lRVV7I13zUWtaKOP3ZEknUb/kkjpV8J3E9ao6zGaxsMkhPYXI6hrvX3RujvZf8IhUHd0ZtPSXzh
	Eq2jCMK/POpPxpySCNP4QHbY=
X-Google-Smtp-Source: AGHT+IFV72fANjoX5Vl5M50nzv2sARExyGeniXvLo1n0DYcKIJbIPUaNluRThO5AiVRPUQqiIjEVYA==
X-Received: by 2002:a17:907:2689:b0:ac4:76e:cdc1 with SMTP id a640c23a62f3a-ace849026b2mr1035335966b.21.1745918555796;
        Tue, 29 Apr 2025 02:22:35 -0700 (PDT)
Received: from smtpclient.apple (7-253-142-46.pool.kielnet.net. [46.142.253.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8f3dsm735618166b.110.2025.04.29.02.22.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:22:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: wifi: ath12k: MLO not working in main/main-pending for NCM865 /
 WCM7850 in station mode
From: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>
In-Reply-To: <ed88961a-4060-4a64-9d1c-2d08bc4dd165@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 11:22:24 +0200
Cc: ath12k@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EBAC1B61-E726-4614-9709-268CFF07007F@gmail.com>
References: <231C035E-18AD-4ABD-91A5-841253644C2B@gmail.com>
 <7001407B-8507-4CD8-B96A-328927D6E286@gmail.com>
 <FBF5892D-0A0A-4AF9-9D53-B3C76673D797@gmail.com>
 <a5bceb0d-bc44-4bf8-b08f-b56b637b28d6@oss.qualcomm.com>
 <D1F01BA0-8B75-4B62-A060-D43C666820F2@gmail.com>
 <ed88961a-4060-4a64-9d1c-2d08bc4dd165@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022238_409930_45479722 
X-CRM114-Status: GOOD (  16.95  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



> On 28. Apr 2025, at 16:19, Jeff Johnson =
<jeff.johnson@oss.qualcomm.com> wrote:
>=20
> On 4/25/2025 4:52 AM, Benjamin Eggerstedt wrote:
>>> On 24. Apr 2025, at 16:28, Jeff Johnson =
<jeff.johnson@oss.qualcomm.com> wrote:
>>>=20
>>> On 4/22/2025 10:35 PM, Benjamin Eggerstedt wrote:
>>>> Hi,
>>>>=20
>>>> I compiled main-pending from here =
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=3Dmain-=
pending after "Merge branch 'pending' into main-pending =
ath-pending-202504182357 master-pending main-pending=E2=80=9D by Jeff =
Johnson. I tried =E2=80=9Cmain=E2=80=9D the day before, but saw that a =
couple of additional fixes went in and redid the previously and =
unfortunately still unsuccessful test
>>>=20
>>> Response from the development team is that the current public =
firmware is not
>>> MLO capable. An updated firmware will be pushed soon.
>>>=20
>>> /jeff
>>=20
>> Hi Jeff,
>>=20
>> I appreciate the feedback, thank you. I=E2=80=99m happy to compile, =
test & report back once such firmware becomes available.
>> Feel free to give me a nudge here.
>=20
> New WCN7850 firmware is now available in linux-firmware
> =
https://msgid.link/CA+5PVA71-_a9nG-vULohgzbSfyFyWOB9RE1x4D4vdUbw4HAegg@mai=
l.gmail.com
>=20
> WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3


Hi Jeff,

Thank you! I compiled a fresh =E2=80=9Cmain-pending=E2=80=9D today and =
used the firmware you referenced. It doesn=E2=80=99t load (no wlan =
interface) and makes a booboo when I try to =E2=80=9Csudo rmmod =
ath12k=E2=80=9D.
I=E2=80=99ll be travelling for 1,5 weeks for business unfortunately and =
cannot really be of help with further tests for the time being.

I hope the following is of help somehow =E2=80=A6

P.S. I saw the same when I just used the new firmware with the previous =
kernel.

debadm@debian:~$ sudo journalctl -k -f
[sudo] password for debadm:  Apr 29 11:05:47 debian kernel: input: HDA =
Intel PCH Front Headphone as =
/devices/pci0000:00/0000:00:1f.3/sound/card0/input12
Apr 29 11:05:47 debian kernel: input: HDA Intel PCH HDMI/DP,pcm=3D3 as =
/devices/pci0000:00/0000:00:1f.3/sound/card0/input13
Apr 29 11:05:47 debian kernel: input: HDA Intel PCH HDMI/DP,pcm=3D7 as =
/devices/pci0000:00/0000:00:1f.3/sound/card0/input14
Apr 29 11:05:47 debian kernel: input: HDA Intel PCH HDMI/DP,pcm=3D8 as =
/devices/pci0000:00/0000:00:1f.3/sound/card0/input15
Apr 29 11:05:50 debian kernel: r8169 0000:06:00.0 enp6s0: Link is Up - =
1Gbps/Full - flow control off
Apr 29 11:05:52 debian kernel: ath12k_pci 0000:03:00.0: failed to =
receive wmi unified ready event: -110
Apr 29 11:05:52 debian kernel: ath12k_pci 0000:03:00.0: failed to start =
core: -110
Apr 29 11:05:52 debian kernel: failed to send QMI message
Apr 29 11:05:52 debian kernel: ath12k_pci 0000:03:00.0: qmi failed to =
send mode request, mode: 4, err =3D -5
Apr 29 11:05:52 debian kernel: ath12k_pci 0000:03:00.0: qmi failed to =
send wlan mode off

## The above is during/after boot in dmesg
## sudo rmmod ath12k

Apr 29 11:15:52 debian kernel: BUG: kernel NULL pointer dereference, =
address: 0000000000000000
Apr 29 11:15:52 debian kernel: #PF: supervisor read access in kernel =
mode
Apr 29 11:15:52 debian kernel: #PF: error_code(0x0000) - not-present =
page
Apr 29 11:15:52 debian kernel: PGD 0 P4D 0  Apr 29 11:15:52 debian =
kernel: Oops: Oops: 0000 [#1] SMP PTI
Apr 29 11:15:52 debian kernel: CPU: 3 UID: 0 PID: 1245 Comm: rmmod Not =
tainted 6.15.0-rc2-wt-ath-ath12kgeb #2 PREEMPT(voluntary)  Apr 29 =
11:15:52 debian kernel: Hardware name: Gigabyte Technology Co., Ltd. =
B365M DS3H/B365M DS3H, BIOS F7 11/13/2021
Apr 29 11:15:52 debian kernel: RIP: =
0010:ath12k_dp_rx_pdev_free+0x1f/0x70 [ath12k]
Apr 29 11:15:52 debian kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 66 =
0f 1f 00 0f 1f 44 00 00 48 63 f6 41 54 48 69 f6 28 04 00 00 55 53 48 8b =
9c 3e 28 b3 00 00 <4c> 8b 23 48 83 c3 40 49 8b 84 24 78 d7 00 00 8b 80 =
94 00 00 00 85
Apr 29 11:15:52 debian kernel: RSP: 0018:ffffb0b040f5bc00 EFLAGS: =
00010206
Apr 29 11:15:52 debian kernel: RAX: 0000000000000001 RBX: =
0000000000000000 RCX: 0000000000000002
Apr 29 11:15:52 debian kernel: RDX: ffff96e281968000 RSI: =
0000000000000000 RDI: ffff96e288580000
Apr 29 11:15:52 debian kernel: RBP: ffff96e288580000 R08: =
000000000000001f R09: ffffffff8b7493e0
Apr 29 11:15:52 debian kernel: R10: 0000000000000001 R11: =
0000000000000000 R12: ffff96e2833df800
Apr 29 11:15:52 debian kernel: R13: ffff96e28858b300 R14: =
ffffffffc15b1308 R15: ffff96e2833df838
Apr 29 11:15:52 debian kernel: FS:  00007f4d35e82f00(0000) =
GS:ffff96ea03e67000(0000) knlGS:0000000000000000
Apr 29 11:15:52 debian kernel: CS:  0010 DS: 0000 ES: 0000 CR0: =
0000000080050033
Apr 29 11:15:52 debian kernel: CR2: 0000000000000000 CR3: =
000000010425c001 CR4: 00000000003726f0
Apr 29 11:15:52 debian kernel: Call Trace:
Apr 29 11:15:52 debian kernel:  <TASK>
Apr 29 11:15:52 debian kernel:  ath12k_dp_pdev_free+0x27/0x40 [ath12k]
Apr 29 11:15:52 debian kernel:  ath12k_core_hw_group_stop+0x64/0x90 =
[ath12k]
Apr 29 11:15:52 debian kernel:  ath12k_core_deinit+0x59/0xc0 [ath12k]
Apr 29 11:15:52 debian kernel:  ath12k_pci_remove+0x5c/0x110 [ath12k]
Apr 29 11:15:52 debian kernel:  pci_device_remove+0x3f/0xb0
Apr 29 11:15:52 debian kernel:  =
device_release_driver_internal+0x19c/0x200
Apr 29 11:15:52 debian kernel:  driver_detach+0x48/0x90
Apr 29 11:15:52 debian kernel:  bus_remove_driver+0x6d/0xf0
Apr 29 11:15:52 debian kernel:  pci_unregister_driver+0x2e/0xb0
Apr 29 11:15:52 debian kernel:  __do_sys_delete_module+0x1ce/0x310
Apr 29 11:15:52 debian kernel:  do_syscall_64+0x82/0x190
Apr 29 11:15:52 debian kernel:  ? __memcg_slab_free_hook+0xf7/0x140
Apr 29 11:15:52 debian kernel:  ? __x64_sys_close+0x3d/0x80
Apr 29 11:15:52 debian kernel:  ? kmem_cache_free+0x3ee/0x450
Apr 29 11:15:52 debian kernel:  ? syscall_exit_to_user_mode+0x4d/0x210
Apr 29 11:15:52 debian kernel:  ? do_syscall_64+0x8e/0x190
Apr 29 11:15:52 debian kernel:  ? exc_page_fault+0x7e/0x1a0
Apr 29 11:15:52 debian kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Apr 29 11:15:52 debian kernel: RIP: 0033:0x7f4d3571b417
Apr 29 11:15:52 debian kernel: Code: 73 01 c3 48 8b 0d e1 59 0d 00 f7 d8 =
64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 =
b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b1 59 0d 00 f7 =
d8 64 89 01 48
Apr 29 11:15:52 debian kernel: RSP: 002b:00007fffe8c6ede8 EFLAGS: =
00000206 ORIG_RAX: 00000000000000b0
Apr 29 11:15:52 debian kernel: RAX: ffffffffffffffda RBX: =
000055ea12031760 RCX: 00007f4d3571b417
Apr 29 11:15:52 debian kernel: RDX: 0000000000000000 RSI: =
0000000000000800 RDI: 000055ea120317c0
Apr 29 11:15:52 debian kernel: RBP: 0000000000000000 R08: =
0000000000000000 R09: 0000000000000000
Apr 29 11:15:52 debian kernel: R10: 0000000000000000 R11: =
0000000000000206 R12: 000055ea120312a0
Apr 29 11:15:52 debian kernel: R13: 00007fffe8c6f030 R14: =
000055ea12031760 R15: 00007fffe8c6f038
Apr 29 11:15:52 debian kernel:  </TASK>
Apr 29 11:15:52 debian kernel: Modules linked in: snd_hda_codec_hdmi =
snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component =
qrtr_mhi binfmt_misc intel_rapl_msr intel_rapl_common nls_ascii =
nls_cp437 vfat intel_uncore_frequency intel_uncore_frequency_common fat =
qrtr ath12k(-) qmi_helpers x86_pkg_temp_thermal intel_powerclamp =
mac80211 coretemp i915 btusb snd_soc_avs kvm_intel btrtl btintel btbcm =
snd_soc_hda_codec snd_hda_ext_core btmtk libarc4 snd_soc_core kvm =
cfg80211 bluetooth snd_compress snd_pcm_dmaengine snd_hda_intel =
drm_buddy joydev irqbypass ttm snd_intel_dspcfg snd_intel_sdw_acpi =
ghash_clmulni_intel snd_hda_codec sha512_ssse3 drm_display_helper =
sha256_ssse3 snd_hda_core sha1_ssse3 mei_hdcp mei_pxp snd_hwdep =
aesni_intel cec ppdev snd_pcm crypto_simd cryptd rapl rc_core snd_timer =
intel_cstate drm_client_lib snd intel_uncore gigabyte_wmi wmi_bmof =
drm_kms_helper mhi ee1004 pcspkr soundcore mei_me rfkill mei hid_cherry =
i2c_algo_bit intel_pmc_core parport_pc pmt_telemetry parport pmt_class =
evdev intel_vsec acpi_pad
Apr 29 11:15:52 debian kernel:  acpi_tad button sg drm configfs =
efi_pstore nfnetlink efivarfs ip_tables x_tables autofs4 ext4 =
hid_generic crc16 usbhid mbcache jbd2 hid dm_mod sd_mod xhci_pci ahci =
iTCO_wdt libahci xhci_hcd intel_pmc_bxt iTCO_vendor_support watchdog =
libata r8169 realtek mdio_devres usbcore libphy scsi_mod i2c_i801 =
i2c_smbus scsi_common usb_common video wmi fan
Apr 29 11:15:52 debian kernel: CR2: 0000000000000000
Apr 29 11:15:52 debian kernel: ---[ end trace 0000000000000000 ]---
Apr 29 11:15:52 debian kernel: RIP: =
0010:ath12k_dp_rx_pdev_free+0x1f/0x70 [ath12k]
Apr 29 11:15:52 debian kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 66 =
0f 1f 00 0f 1f 44 00 00 48 63 f6 41 54 48 69 f6 28 04 00 00 55 53 48 8b =
9c 3e 28 b3 00 00 <4c> 8b 23 48 83 c3 40 49 8b 84 24 78 d7 00 00 8b 80 =
94 00 00 00 85
Apr 29 11:15:52 debian kernel: RSP: 0018:ffffb0b040f5bc00 EFLAGS: =
00010206
Apr 29 11:15:52 debian kernel: RAX: 0000000000000001 RBX: =
0000000000000000 RCX: 0000000000000002
Apr 29 11:15:52 debian kernel: RDX: ffff96e281968000 RSI: =
0000000000000000 RDI: ffff96e288580000
Apr 29 11:15:52 debian kernel: RBP: ffff96e288580000 R08: =
000000000000001f R09: ffffffff8b7493e0
Apr 29 11:15:52 debian kernel: R10: 0000000000000001 R11: =
0000000000000000 R12: ffff96e2833df800
Apr 29 11:15:52 debian kernel: R13: ffff96e28858b300 R14: =
ffffffffc15b1308 R15: ffff96e2833df838
Apr 29 11:15:52 debian kernel: FS:  00007f4d35e82f00(0000) =
GS:ffff96ea03e67000(0000) knlGS:0000000000000000
Apr 29 11:15:52 debian kernel: CS:  0010 DS: 0000 ES: 0000 CR0: =
0000000080050033
Apr 29 11:15:52 debian kernel: CR2: 0000000000000000 CR3: =
000000010425c001 CR4: 00000000003726f0
Apr 29 11:15:52 debian kernel: note: rmmod[1245] exited with irqs =
disabled

## Attempting to "sudo modprobe ath12k debug_mask=3D0xffff=E2=80=9D =
gives me=20
## modprobe: ERROR: could not insert 'ath12k': Device or resource busy

Benny=

