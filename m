Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520EBC7618E
	for <ath12k@archiver.kernel.org>; Wed, 26 Apr 2023 06:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNSE7D+2mTgbEHl6LXPu9LbFb6axNmbUr6KK0deDHCw=; b=op6tZ4ltqoj45p
	nEtiVT/yhF7SARYZ7ltfGIuKWANs/Gu2lkX1eme4OWeW9RjPxYo2jZ5x+gFp2zKXALZtPF1hoNVJN
	cAlXeBw6nBMfdWL/zede0DzKJw7LkHjAyU9w3t5du/MnvOm+Ba/9VX2edwiunR8hxK6dz+69onejH
	LXbBtLOkqv8NAoV9Ps/zg7DVDZRkmWH99VVgdtglNe2dWAUJvSURF0X7GqDeDa/Hil+m7P5c6eow2
	5tuEBxQZKe52+U7MMQNQLBz0UKBLMmgZiT6PfOIFGfsnWBxBnpbCYI++XcwzxbyU/JWbySXocO1Oh
	E4YJsnDJd16yf2VfL4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prYGB-002tZx-3C
	for ath12k@archiver.kernel.org;
	Wed, 26 Apr 2023 06:04:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prYG8-002tZC-2a
	for ath12k@lists.infradead.org;
	Wed, 26 Apr 2023 06:04:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F210760B37;
	Wed, 26 Apr 2023 06:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD47C433D2;
	Wed, 26 Apr 2023 06:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682489045;
	bh=NKlsr26o1nZ46Pg3FtTO0jgQ8SsYgX7W/XJ+pGjtVUc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VRO4FI8RWAVelaJQWVXkx5QeyH6eBLUSoAxro2ETMiGbBbg1oJxEo4Z1fBJwOF+nT
	 RILXJuzVU4hEBvD513hg56Gl3lyndoVMexcBob3eT2/iTEtOm2/REev//YzpDekwYi
	 bceAxxodOKmWbd3Ii/QafGqqy7wizQpOL9OF2za/fmIJw8iVDIyNnnXVpmXtYhPsET
	 LzX45RVudVo7jnGWKmXULtHHijNS9O/1tiabYpEbAjTHXJZYtx/rnLpD0+U1Hgzetg
	 xto1LfwPWBXW0/j4q4JOlsO0LQmWf/w2y4vnAN19B4K0CtWU48nJQoRoUCnoJG1nhm
	 qPadw7w/dZ1dg==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 00/11] wifi: ath12k: (v3) EHT support
References: <20230413215156.2649-1-quic_alokad@quicinc.com>
Date: Wed, 26 Apr 2023 09:03:59 +0300
In-Reply-To: <20230413215156.2649-1-quic_alokad@quicinc.com> (Aloka Dixit's
	message of "Thu, 13 Apr 2023 14:51:45 -0700")
Message-ID: <87ildjtc1c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_230408_942066_E6D93E9F 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Aloka Dixit <quic_alokad@quicinc.com> writes:

> Add driver support to bring AP up in EHT mode, configure a preamble
> puncturing bitmap and associate with an EHT client.
>
> v3: Modified patches 6 and 9 to fix some issues,
> changelog included in the respective patches.
> v2: This version modifies only few commit descriptions,
> changelog included in the respective patches.
>
> Following list gives the details for each patch.
> 1-4: Propagation of EHT capabilities from target to userspace.
> Patches 1, 2 refactor the existing code to make EHT additions easier.
> 5: Addition of EHT phy modes.
> 6-9: EHT related additions in peer association.
> 10: Process the new WMI service ready ext2 event.
> 11: Preamble puncturing support.
>
> Aloka Dixit (9):
>   wifi: ath12k: rename HE capabilities setup/copy functions
>   wifi: ath12k: move HE capabilities processing to a new function
>   wifi: ath12k: process EHT capabilities
>   wifi: ath12k: propagate EHT capabilities to userspace
>   wifi: ath12k: prepare EHT peer assoc parameters
>   wifi: ath12k: add WMI support for EHT peer
>   wifi: ath12k: peer assoc for 320 MHz
>   wifi: ath12k: parse WMI service ready ext2 event
>   wifi: ath12k: configure puncturing bitmap
>
> Muna Sinada (1):
>   wifi: ath12k: add EHT PHY modes
>
> Pradeep Kumar Chitrapu (1):
>   wifi: ath12k: add MLO header in peer association

This breaks WCN7850 support:

[  144.039164] ath12k_pci 0000:06:00.0: BAR 0: assigned [mem 0xda200000-0xda3fffff 64bit]
[  144.039315] ath12k_pci 0000:06:00.0: enabling device (0000 -> 0002)
[  144.046220] ath12k_pci 0000:06:00.0: Hardware name: wcn7850 hw2.0
[  144.118539] mhi mhi0: Requested to power ON
[  144.118716] mhi mhi0: Power on setup success
[  144.222303] mhi mhi0: Wait for device to enter SBL or Mission mode
[  144.627712] ath12k_pci 0000:06:00.0: chip_id 0x2 chip_family 0x4 board_id 0x104 soc_id 0x40170200
[  144.627945] ath12k_pci 0000:06:00.0: fw_version 0x1005bc12 fw_build_timestamp 2022-10-11 12:13 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
[  144.959196] ath12k_pci 0000:06:00.0: failed to parse tlv -22
[  144.959317] ath12k_pci 0000:06:00.0: failed to parse ext2 event tlv -22
[  150.263567] ath12k_pci 0000:06:00.0: failed to receive wmi service ready event: -110
[  150.276547] ath12k_pci 0000:06:00.0: failed to start core: -110

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
