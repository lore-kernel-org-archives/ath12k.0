Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5420DC4167D
	for <ath12k@archiver.kernel.org>; Thu,  2 Nov 2023 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7vsuUjBDdpY/NAnojfvAhEKxIBCBYmWM/B6megHNXU=; b=AqaRNB8H8K7JxG
	SbieXDO+uGFqpiVGK35urQAcsEQgTLhKEQVAtrkCqwEyGbWWpdGmPgzPWLLkcKlAhqV5jiPoTqXfr
	LyVRnOYT4/IlOIqjZory8W0Aah3Bb6HLYDprKh2uMmnXv5taWhcg4td25ozl6UGRyIDzciff4e7qC
	7XeY77WW1j/Mfn2zj5W4cG9+ioRmMqcqE8wGhwqiWR2VUAedNQDx4qdz6PuVCF3KYEpOgTGLd0tvN
	m4n1oqAId+2w1KYw/RKfr+Fa8JKAn+Wvn9pwhz/lQr9OiUh7RIV/ga+hIB6GHlav58rz6EXnMcpld
	CtJvhR3vE1YrthbJ4Y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZhM-009lA3-0E
	for ath12k@archiver.kernel.org;
	Thu, 02 Nov 2023 15:33:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZhJ-009l97-2S
	for ath12k@lists.infradead.org;
	Thu, 02 Nov 2023 15:33:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5C900B81D0A;
	Thu,  2 Nov 2023 15:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B5EC433CA;
	Thu,  2 Nov 2023 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698939206;
	bh=YSkyxTlpftdDqfkFADcgeMcrGL2jgJI037pt5vjQbnQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uP+ZFFDt6A60vU/c+ND9HCqauis7ntCATYz7mBF0HL86s9MkY6+WQwyvgGJIe4z6g
	 CRlwRDO4UuTLIG/3nRk1kH2EdI8/h+YmFgIdzudTx6koiJexaXr1Z+FB3CchQlR6nG
	 pj3v9ohBBJD5yL9AySEXmUCW4lR72dhBZKRf+cgNAx0GzkuhJx3MZZ7qdd6uDd003v
	 s9dsOucSWUZlNm+hQ2R+CSY7VbirFQf/bbrlR+3M1cC6HcGxAHVXIKm7m1wfRAwmdD
	 uJr0aLfARWz6iwl1MlFsO03Ov0pgBynVV+YVx35bMAf07V2/gUnuliF+8euZSIi4qF
	 Yl3ZbCNGwMiTg==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  P
 Praneesh <quic_ppranees@quicinc.com>
Subject: Re: [PATCH 06/13] wifi: ath12k: Add logic to write QRTR node id to
 scratch
References: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
	<20231030222700.18914-7-quic_rajkbhag@quicinc.com>
Date: Thu, 02 Nov 2023 17:33:22 +0200
In-Reply-To: <20231030222700.18914-7-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Tue, 31 Oct 2023 03:56:53 +0530")
Message-ID: <87v8akuq4d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_083329_956419_72A2C91A 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> From: P Praneesh <quic_ppranees@quicinc.com>
>
> Currently only one MHI device is registered successfully on platform
> having two or more identical MHI devices. This is beacuse QMI service
> runs with identical QRTR node ID. And, qrtr-lookup cannot register
> more than one QMI service with identical node ID.
>
> Hence, generate a unique QRTR instance ID from PCIe domain number and
> bus number. QMI allows node id to be written on scratch register.
> Add logic to write QRTR node id to the register. It is available for
> firmware to uniquely identify an instance.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

BTW we got a test report that this breaks WCN7850 support.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
