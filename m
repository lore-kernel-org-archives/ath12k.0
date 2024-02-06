Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27F5C48297
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPjM9N3DPQ9iRFbHM7+DKSGvdbzmRkSlMELbvtKprvU=; b=VvH9WzgeMDUIhb0vkLbwSYb5+w
	TY5YMaxHZw0Q2q5lYD0Z5ZS/gYDHN+08xk6j8UJV4CfgKNz7lt2bu3Ubj8XMNxPkIrPIZouIwYiM6
	RPf/4Mdow8NRKsqPHkVqP5Zlfo13YzVKoC6Gn4cSSEim/s0bDxjx55Lv0DwSVwL2MYBpQ6fvmu7B5
	stkoe+F9o/N56Vez5ISk2k+VhrBRoGvR7cVhEA3chrQOObiCFlKZEjbtaOeZhdx3MKH5EpUa8U44Q
	OLSabfvAWX6rF3znCAzeTItgjW1BKMHPoWaYPDdwIfQvAnCUbikzIz4Le655T8YdAJ6dRNmERIXve
	J65sWu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKr4-00000007cIo-1M5d
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 12:47:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKr2-00000007cI2-15Ct
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 12:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 048CACE0B53;
	Tue,  6 Feb 2024 12:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC53C433F1;
	Tue,  6 Feb 2024 12:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707223629;
	bh=XJ8LEmc29rQHPuZ+xQYyUqHzDRYmO6l2IEQN/DV9nus=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jAOrH8R8ltlavmQjWZFipXJqwRZXvFsfxcYk/h8xM1T+B5SBqkbpRchjOP8hsM62x
	 y/sAEpqgHZ7CECT3Hhzi6zEyM4oaQ8kTacWj3Eq0P/hoOH4to0c/8Ou6lMqYkscNgl
	 HktSyvHjZ/CYJSCF+juVHKsFE8rDXjSMnbQpsZx/QqUlY4dJzpgCRxEEU5yexbGTAY
	 MmrB+xuxyiWSdbgAbxNPp240L1iWv7qB0q8MXWkMus1nFKPuq68QDCViLLzIJ3xd5L
	 sHH5NAmdj/nYUuk0Q+DtkyMn5eY/EHCivSwP6gdRZHQfSY9swIETXWcSLQGzPUDlYx
	 W6GEzkvvyi6oQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dave Jones <s.dave.jones@gmail.com>
Cc: ath12k@lists.infradead.org
Subject: Re: WCN7850 doesn't work on Linux kernel 6.8-rc3
References: <CANf5e8YuWEp-NdF1+nhtH6t2KLac8MqMX8HyiZgUE=MvQBiefw@mail.gmail.com>
Date: Tue, 06 Feb 2024 14:47:06 +0200
In-Reply-To: <CANf5e8YuWEp-NdF1+nhtH6t2KLac8MqMX8HyiZgUE=MvQBiefw@mail.gmail.com>
	(Dave Jones's message of "Tue, 6 Feb 2024 20:13:56 +0800")
Message-ID: <87ttmlrc8l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_044712_488893_3F4B5959 
X-CRM114-Status: UNSURE (   9.84  )
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

Dave Jones <s.dave.jones@gmail.com> writes:

> Hello,
>
> I tried to test a wcn8750-based wifi adapter under Linux kernel 6.8-rc3,
> it's not working. dmesg below:
>
> ath12k_pci 0000:02:00.0: BAR 0 [mem 0x90400000-0x905fffff 64bit]: assigned
> ath12k_pci 0000:02:00.0: MSI vectors: 1
> ath12k_pci 0000:02:00.0: Hardware name: wcn7850 hw2.0
> ath12k_pci 0000:02:00.0: qmi dma allocation failed (7077888 B type 1), will try
> later with small size
> ath12k_pci 0000:02:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x4017
> 0200
> ath12k_pci 0000:02:00.0: fw_version 0x100301e1 fw_build_timestamp 2023-12-06 04:
> 05 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> ath12k_pci 0000:02:00.0: qmi failed to load regdb bin:
> ath12k_pci 0000:02:00.0: qmi failed to load regdb file:-2
>
> Should I need regdb.bin? If so, where can I get that file? Thanks.

regdb.bin is for developer testing, end users shouldn't use that file.

Can you try ath.git master branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/

We have some patches in the pipeline which didn't sadly make it to v6.8.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

