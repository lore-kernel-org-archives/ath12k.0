Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913ACC04FFE
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdRFkaSybFwbLPWcFNv0naIFdeP3pPZARMUoQI1o0jg=; b=Q3RUNzhVCQM3ftbiL+q6CdUYQa
	j4ZhTtQ4M+rY+bzyaW4lwF8fO49evb8nlAt7kVdioNdvpT6clnffBaVkdqB40oXyQXxOLUgNtIG02
	6p/ag+dC4Lp/IVU2m+WyhWdejB8lGiw6C42uu8ENBh0kAiJ+Yx4eEbZSrdXV48de5LpUZNkDXSrZF
	KviWgyNYdW/v7jTWTQibVzG7T3VIy8rVR5xciN2PuCVP5ShVPA4YfEpNK2Pz4lfLjrQ+ByASqBXtm
	HQthLQjFTr4Q9OuqFxBUtc3yMrMRALWiXrC0OAHMQUdIqgI2bxvLnKefpPZUpx7rNamn1/N5XFdNF
	HVUTdKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8ziu-0000000E3Ng-0pEK
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 09:54:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8ziq-0000000E3Li-28Ni
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 09:54:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 22901CE0B21;
	Mon, 20 May 2024 09:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7CBC2BD11;
	Mon, 20 May 2024 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716198861;
	bh=uYrv5PX3Df7ftZ7PfT0kNiA7out8G32lBVtnYUGxOJI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=K03BJK/hQDuSgtmAWmcgFKZSIYBf6rh2t0Gk7GUSmArsPCecDF9hQR9kX47pQBaR2
	 9ImBWEVIFTa/lf5tcltRFSHTWB3CrYMVRYahJ4MBqc6VpwL1MwYcMjFxg/C8pfKIyD
	 +id3Fkg4H7GXJ6wbBvCyTz6moTH/TYel2WIImIRFBNzMS6vdNJlkZ3YGFbW+D1bPRA
	 pnDgfbKFq2c0iYxZZJoVK1EZ42Bq4U70+JNuXk4vbzzEeh9i/R0ikDKVf+K5+/vteY
	 Thdn/u1vtXgK1B+x4okOq6mwi7hm6nmmlwQgRywrtwpBgWjRr7JBvt2Tjm+VfijFKf
	 PQXTGZ20u7Asw==
From: Kalle Valo <kvalo@kernel.org>
To: pgupta@hindutool.com
Cc: ath12k@lists.infradead.org
Subject: Re: board-2.bin
References: <1716180196.ixiafmuo0wckk0ws@mailapp03.register.com>
Date: Mon, 20 May 2024 12:54:18 +0300
In-Reply-To: <1716180196.ixiafmuo0wckk0ws@mailapp03.register.com>
	(pgupta@hindutool.com's message of "Mon, 20 May 2024 00:43:16 -0400")
Message-ID: <87seycerlh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_025424_944934_93EC0599 
X-CRM114-Status: GOOD (  16.36  )
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

"pgupta@hindutool.com" <pgupta@hindutool.com> writes:

> I have been reading through the various posts, and while I found
> someone who reported the exact same problem, I was unable to find a
> response from anyone who could present a solution
>
> I have a Compex WLW7000E6

Any recommendations from where it would be easiest to order such board?
I'm based in Europe and would like to get one.

Is the board otherwise plug&play to an M.2 E-key slot or does it need
something special?

> and am using the latest kernel version 6.8.0-31-generic (ubuntu 24.04
> LTS)

BTW in general we don't support distro kernels:

https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-ker=
nel-bug-reports-are-ignored/#your-kernel-was-apparently-built-by-a-linux-di=
stributor-or-hardware-vendor

> Despite having the requisite files in /lib/firmware/ath12k/QCN9274/hw2.0:
>
> -rw-r--r-- 1 root root 8241152 May 19 23:47 amss.bin
> -rw-r--r-- 1 root root 2821564 May 20 00:03 amss.bin.zst
> -rw-r--r-- 1 root root  382856 May 20 00:03 board-2.bin
> -rw-r--r-- 1 root root=C2=A0=C2=A0 21517 May 20 00:03 board-2.bin.zst
> -rw-r--r-- 1 root root=C2=A0 421888 May 19 23:47 m3.bin
> -rw-r--r-- 1 root root=C2=A0 139662 May 20 00:03 m3.bin.zst
> -rw-r--r-- 1 root root=C2=A0=C2=A0 10699 May 20 00:03 Notice.txt.zst
> -rw-r--r-- 1 root root=C2=A0=C2=A0 24310 May 19 23:47 regdb.bin
> -rw-r--r-- 1 root root=C2=A0=C2=A0=C2=A0 3187 May 19 23:47 regdb.bin.zst
>
> I continue to receive the following errors:
>
> [=C2=A0=C2=A0=C2=A0 5.885930] ath12k_pci 0000:83:00.0: BAR 0 [mem
> 0xc8000000-0xc81fffff 64bit]: assigned
> [=C2=A0=C2=A0=C2=A0 5.886287] ath12k_pci 0000:83:00.0: MSI vectors: 16
> [=C2=A0=C2=A0=C2=A0 5.886294] ath12k_pci 0000:83:00.0: Hardware name: qcn=
9274 hw2.0
> [=C2=A0=C2=A0=C2=A0 6.745247] ath12k_pci 0000:83:00.0: memory type 10 not=
 supported
> [=C2=A0=C2=A0=C2=A0 6.750101] ath12k_pci 0000:83:00.0: chip_id 0x0 chip_f=
amily 0xb
> board_id 0xff soc_id 0x401a2200
> [=C2=A0=C2=A0=C2=A0 6.750110] ath12k_pci 0000:83:00.0: fw_version 0x10098=
b57
> fw_build_timestamp 2022-09-19 18:18 fw_build_id
> QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> [=C2=A0=C2=A0=C2=A0 6.761065] ath12k_pci 0000:83:00.0: failed to fetch bo=
ard data for
> bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255 from
> ath12k/QCN9274/hw2.0/board-2.bin
> [=C2=A0=C2=A0=C2=A0 6.761212] ath12k_pci 0000:83:00.0: failed to fetch bo=
ard-2.bin or
> board.bin from QCN9274/hw2.0
> [=C2=A0=C2=A0=C2=A0 6.761247] ath12k_pci 0000:83:00.0: qmi failed to load=
 bdf:
> [=C2=A0=C2=A0=C2=A0 6.761250] ath12k_pci 0000:83:00.0: qmi failed to load=
 board data file:-2

This means that board-2.bin is missing the board file for your device.
For AP devices like QCN9274 board files handling is difficult, usually
Device Tree is the only way to get automatic board file loading working.

Did you get any software with your the board? Do you know if the board
is calibrated or not?

Can you run:

find /lib/firmware/ath12k/ -type f | xargs md5sum

Also read:

https://wireless.wiki.kernel.org/en/users/drivers/ath12k/bugreport

> but he zst files were copied over from the WCN7850 directory.

I do not know what these zst files are. And don't copy anything from
WCN7850 directory, the files are not compatible. The best is to run
'make install' within ath12k-firmware.git repository, manually fixing
files will end up into problems.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

