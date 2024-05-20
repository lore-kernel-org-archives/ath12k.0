Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D34C25B78
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 04:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XRq/qEe+o0s0GaHXoqzS6P2z86syLpfUdFBBJM0QgRw=; b=De3UWMJGrE3qFt
	KRm1ascj3sgEbf4mq9CQ6lc4ETiRth72wP2hJj2zoCzmv1/eZzaZfEL7hq5FSqZ3L0zmiOW3vUPRY
	eFlslsZGPupKzWqd+mYzfKNiAJkiE6nqOoisPufoYIihvQ49RIMRcfPm0T+rT6dyYyyc6kbLI19Jb
	PZ9OX/0cbRP33MuMcQdMKFJu29JO+iojVfbcj+eqDN6qFL7fvyxK1NAFJ8idCQUdjCDLSek9JEm2P
	LCjen1okKIOhOrgEsv2eupzK+gYCdk9t2k1OhPbwOFzYTGWjO40+bhvXA8LVhjaVx9JZ3mJxcm4qD
	Q70/AvLN6ckbo9hNNCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8urq-0000000DVTi-42Ys
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 04:43:22 +0000
Received: from mail214c25.carrierzone.com ([64.29.147.108])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8urm-0000000DVSp-3RIT
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 04:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1716180197;
	bh=GEM3SZnwdmDpZY9fgxSWzjHYWdA7b2HMwWWUVGPqtcE=;
	h=From:To:CC:Subject:Date:Reply-to:From;
	b=qtcI9MAY7M+gsABKtQzZ/za5ZY6HkIyvRhpt/rx0OF3RUmU7wf2pAL+Dn3F3dTyiX
	 ozJk/rFZdS579w0QNyGhQhjBJmMkhNq6uOpmehX4LDBsFLWhzkH0BSxLmVD+UruX4i
	 e8Nxsoyvrww9yErxuvRhmVM6Z+q2G3X74giGe4JQ=
Feedback-ID: pgupta@hindutoo
Received: from mail214c25.carrierzone.com (localhost [127.0.0.1])
	by mail214c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 44K4hGiT088209
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <ath12k@lists.infradead.org>; Mon, 20 May 2024 04:43:17 +0000
Received: (from webmail@localhost)
	by mail214c25.carrierzone.com (8.14.9/8.12.2/Submit) id 44K4hGMG088208
	for ath12k@lists.infradead.org; Mon, 20 May 2024 00:43:16 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: ath12k@lists.infradead.org
CC: 
Subject: board-2.bin
Date: Mon, 20 May 2024 00:43:16 -0400
Message-ID: <1716180196.ixiafmuo0wckk0ws@mailapp03.register.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdehledgkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffquffvqffrkfetpdfqfgfvpdfgpfggqdevvdehnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkgggtgfhrsehtqhertddttdejnecuhfhrohhmpedfphhguhhpthgrsehhihhnughuthhoohhlrdgtohhmfdcuoehpghhuphhtrgeshhhinhguuhhtohholhdrtghomheqnecuggftrfgrthhtvghrnhephfdtvdffhfdtieejfefhfedvheegtdejtdetkeejgfeugfetleehleetleegveefnecuffhomhgrihhnpegtohguvghlihhnrghrohdrohhrghenucfkphepuddvjedrtddrtddrudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhhvghlohepmhgrihhlvddugegtvdehrdgtrghrrhhivghriihonhgvrdgtohhmpdhmrghilhhfrhhomhepphhguhhpthgrsehhihhnughuthhoohhlrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghthhduvdhksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_214319_061276_A64557EC 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
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

Hello,

I have been reading through the various posts, and while I found someone wh=
o reported the exact same problem, I was unable to find a response from any=
one who could present a solution

I have a Compex WLW7000E6, and am using the latest kernel version 6.8.0-31-=
generic (ubuntu 24.04 LTS)

Despite having the requisite files in /lib/firmware/ath12k/QCN9274/hw2.0:

-rw-r--r-- 1 root root 8241152 May 19 23:47 amss.bin
-rw-r--r-- 1 root root 2821564 May 20 00:03 amss.bin.zst
-rw-r--r-- 1 root root  382856 May 20 00:03 board-2.bin
-rw-r--r-- 1 root root=C2=A0=C2=A0 21517 May 20 00:03 board-2.bin.zst
-rw-r--r-- 1 root root=C2=A0 421888 May 19 23:47 m3.bin
-rw-r--r-- 1 root root=C2=A0 139662 May 20 00:03 m3.bin.zst
-rw-r--r-- 1 root root=C2=A0=C2=A0 10699 May 20 00:03 Notice.txt.zst
-rw-r--r-- 1 root root=C2=A0=C2=A0 24310 May 19 23:47 regdb.bin
-rw-r--r-- 1 root root=C2=A0=C2=A0=C2=A0 3187 May 19 23:47 regdb.bin.zst

I continue to receive the following errors:

[=C2=A0=C2=A0=C2=A0 5.885930] ath12k_pci 0000:83:00.0: BAR 0 [mem 0xc800000=
0-0xc81fffff 64bit]: assigned
[=C2=A0=C2=A0=C2=A0 5.886287] ath12k_pci 0000:83:00.0: MSI vectors: 16
[=C2=A0=C2=A0=C2=A0 5.886294] ath12k_pci 0000:83:00.0: Hardware name: qcn92=
74 hw2.0
[=C2=A0=C2=A0=C2=A0 6.745247] ath12k_pci 0000:83:00.0: memory type 10 not s=
upported
[=C2=A0=C2=A0=C2=A0 6.750101] ath12k_pci 0000:83:00.0: chip_id 0x0 chip_fam=
ily 0xb board_id 0xff soc_id 0x401a2200
[=C2=A0=C2=A0=C2=A0 6.750110] ath12k_pci 0000:83:00.0: fw_version 0x10098b5=
7 fw_build_timestamp 2022-09-19 18:18 fw_build_id QC_IMAGE_VERSION_STRING=
=3DWLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
[=C2=A0=C2=A0=C2=A0 6.761065] ath12k_pci 0000:83:00.0: failed to fetch boar=
d data for bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255 from ath12k/QCN9274=
/hw2.0/board-2.bin
[=C2=A0=C2=A0=C2=A0 6.761212] ath12k_pci 0000:83:00.0: failed to fetch boar=
d-2.bin or board.bin from QCN9274/hw2.0
[=C2=A0=C2=A0=C2=A0 6.761247] ath12k_pci 0000:83:00.0: qmi failed to load b=
df:
[=C2=A0=C2=A0=C2=A0 6.761250] ath12k_pci 0000:83:00.0: qmi failed to load b=
oard data file:-2


All of the binaries have been downloaded from https://git.codelinaro.org/cl=
o/ath-firmware/ath12k-firmware, but he zst files were copied over from the =
WCN7850 directory.

Any ideas?

Prashant Gupta (pgupta@hindutool.com)

