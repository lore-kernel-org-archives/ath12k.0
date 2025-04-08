Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183EEC36010
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m6NoS6tSTLHJBTzmLdQ/GO+z95NzVibJaNFXoO+LAVQ=; b=LkB2mMlanQq5EoDrsE7iVdSclC
	ise6Yngz1/lfw+jR44ZahZ5PuTk5BtI5fPuq0L40PCK2cwl54JoHEZMD79A5IFqeoznzIW2MDh9eu
	1G2w82NiZydFSk34v0iLFXa+tZExhwYFf/bCxMRE7gFFr+qTXZJkaJMBCIhIV9U4fxAEPIhWGO6yM
	u40L/t+NN2pepkQh5Fg3b2CQxVNv4pSTixmqkbk9cIrxZkL1VNkmJpkuNzQYPN2Xbr5KvU+YLHZbl
	4RqhnujyUFayTlB5K+sUTssVOupMOvC5M4RrJ7zmMYAVXr4PzwyU/n9F8VNq+ZnQCUha8oJHEk457
	PxyMSLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DuK-000000058lO-3UdT
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 18:42:48 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CTz-00000004vnW-02jV
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 17:11:34 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso5418767a91.3
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 10:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744132289; x=1744737089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6NoS6tSTLHJBTzmLdQ/GO+z95NzVibJaNFXoO+LAVQ=;
        b=IFXJ1UjNVnAck9FGGpDQWWcHSJuKWRYEqD4s95nqh3JI6eDyBB53iujqLrDbg4X4OR
         tDsuX6vLYLGYZLRZjqpZmpyG2L1b8UxQ0FrnkLLyULHgC+rF3cJW4jLGtIL5G+4GcFCp
         xFrstAmXC4R8NKL3cHaLJbhTG25cLmfum47G94WFvzmrW4AXxPquwDIzHUbzArrAPfda
         0ZCHtbNuKvQGmG1MnohOP5FbIaAuUQcGLf/aDkNIuwu82e4NFB49oacr1tRDCaUQ/F0t
         deQNFOPoeUNrc0kmvNzuFTU9WuKjNSrudXJC7wOKpsy86+Nbx7opIQLBdvTA6X9B3sDR
         XyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744132289; x=1744737089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6NoS6tSTLHJBTzmLdQ/GO+z95NzVibJaNFXoO+LAVQ=;
        b=VuhCTw7pkGh9QWGI3YHsmjeiWU7XkbzuE9SblXrgZ25pW9kETp7/2u4wgS6AhIp5wx
         PRDmNKzib8NOT+ABJjt8O3gbYhi7+vAKpO+NhK4Gq/bUDy/V8joVQJ5SzLqvHZtoqtW/
         KXbfA/bG5M0jLLRdMpRrZp47h+YJSDSezj1sUkXChBo9JP9qVTADayZkHF7uhRfxY4r2
         4ZcGDp7h7enw1wVvCFLHb2I6OlNE7I7NZN8RwKnTNXnk8YXxYDURaHXEAZp0nrzaMyqc
         w82IxUuRJTga2tMO7ywWXZRzUXNQ++rWv+jrcE/riPg9iTotAVMOJMEhXu7rNqovKgwk
         5/Iw==
X-Gm-Message-State: AOJu0YyvvXuGdQLICC+qMfmHcAn3P9ralmK/7TDXWG5KpN+olKUGOmSN
	W78nSwm9UpmISbt2rgomGWALKXhLNxD2FLOeHlZ2Kcn2hvWPUWARzYK+DWcvkfE=
X-Gm-Gg: ASbGncvgIkNnEuQ02T7t1q7kKL+9ftDl0inw7G7LeyacYsWTHI7jqljLfGVRWMVNvGR
	DanCB0Syt7Etiz4KQ4JwjxCm5B4ixjxz1FQ/sqXa+0rQvsYd1NHTv3j5oyDq00ksicPfjq4fYMa
	hS70NR6lp07FLhwnWJWc0Zb36CFNJhKI3G6IEffvDir0a/5F6udmfhOmosJXbievp3VEDqAXT15
	ngZ/CdKewkS0SKwPR41L/0iNFwS6xFNM1WxFkdUXz0f1+tGBiI52kPCKkLVoOaHhu5m4JwjDqf+
	rhxogWD/E814E3kGhEC8TyOsvxjcMRRVvcu3MKUOJzDSPLChCWRVFw==
X-Google-Smtp-Source: AGHT+IHxBBcoEXKUmL4fNgAuMUp+MPHsOMdLajx2slpwzwxkFuktQ/nft8FbCZRBqD+QxXAdgB0Aiw==
X-Received: by 2002:a17:90b:1f8c:b0:2ff:5016:7fd2 with SMTP id 98e67ed59e1d1-306dbc0d0admr9064a91.24.1744132289208;
        Tue, 08 Apr 2025 10:11:29 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca5163fsm12794605a91.19.2025.04.08.10.11.27
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:11:28 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: ath12k@lists.infradead.org
Subject: ath12k: request a board file for sm8650
Date: Wed,  9 Apr 2025 01:09:27 +0800
Message-ID: <20250408170927.5884-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_101131_053090_9A4989A9 
X-CRM114-Status: UNSURE (   6.21  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi, in my sm8650 based device(Oneplus Pad 2), it is equipped with
wcn7850, it doesn't work. No common board file for

bus=pci,vendor=17cb,device=1107,subsystem-vendor=17cb,subsystem-device=1107,qmi-chip-id=2,qmi-board-id=255

device specified board file from androd image can't be loaded. I
have also tried many board files for other devices which are from
board-2.bin, none of them worked. Can someone upload a board file
for it? Thanks!

default:
	demsg | grep -i 'ath12k'
	[    1.064804] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
	[    1.065551] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
	[    1.069350] ath12k_pci 0000:01:00.0: MSI vectors: 16
	[    1.071626] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
	[    1.642144] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
	[    1.676854] ath12k_pci 0000:01:00.0: fw_version 0x100301e1 fw_build_timestamp 2023-12-06 04:05 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
	[    1.720470] ath12k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=17cb,device=1107,subsystem-vendor=17cb,subsystem-device=1107,qmi-chip-id=2,qmi-board-id=255 from ath12k/WCN7850/hw2.0/board-2.bin
	[    1.726844] ath12k_pci 0000:01:00.0: failed to fetch board.bin from WCN7850/hw2.0
	[    1.728877] ath12k_pci 0000:01:00.0: qmi failed to load bdf:
	[    1.734862] ath12k_pci 0000:01:00.0: qmi failed to load board data file:-2

board file from android rom:
	demsg | grep -i 'ath12k'
	[    4.054474] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
	[    4.057350] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
	[    4.059490] ath12k_pci 0000:01:00.0: MSI vectors: 16
	[    4.060620] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
	[    4.635118] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
	[    4.639740] ath12k_pci 0000:01:00.0: fw_version 0x100301e1 fw_build_timestamp 2023-12-06 04:05 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
	[    4.836061] ath12k_pci 0000:01:00.0: ignore reset dev flags 0x0
	[   14.818289] ath12k_pci 0000:01:00.0: qmi failed to load bdf file
	[   14.818694] ath12k_pci 0000:01:00.0: qmi failed to load board data file:-110

One more thing deserves a notice,
fw_build_id from my Dsp firmware:
	"wlan_hmt": "WLAN.HMT.2.0-02702-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
	mainline:   "WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3"

Best wishes,
Pengyu

