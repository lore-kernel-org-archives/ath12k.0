Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167AFC25B74
	for <ath12k@archiver.kernel.org>; Thu, 30 May 2024 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uCtb8rNNcbELUshO1Pj4q6hHd9z1bPPlQ4sQvvQXh0=; b=t0metQv8JoJ+bv2zuN3wvUbCOh
	PKZQx5hajWEy3V82tvrkyVpEcpvjw/Hz2cPgJ5Mice38c0KPsa8C1c2Bvkct6bIGG3cZKv+Pv4XsJ
	RKF7HOXSFPnsljC2Wh1d8nT3ZMnStwKrHwHxG7sHRz+JTjBgyzfmTacF1leW4ZKNkTYcBXdQElXDU
	QPVOu8vS5Y/x+CadOkUCmILIFD4L4vPElyoMKG92BJiVHd6Oyn25D0Rg3mHZ9kS7hgI+vBWJv6g8Q
	UdR8xjzc0/paY+DChKnikezsfNqe6pCTFw+p9Syc9BEef8Q7LWCUvaUTsE7xCb5arXMvugY08DPsN
	hN0OkCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCkhu-0000000882d-3KjX
	for ath12k@archiver.kernel.org;
	Thu, 30 May 2024 18:40:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCkhr-00000008824-1ZfX
	for ath12k@lists.infradead.org;
	Thu, 30 May 2024 18:40:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16D2FCE1B24;
	Thu, 30 May 2024 18:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52AADC32782;
	Thu, 30 May 2024 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717094451;
	bh=BLOo9CVjIS/IBAShUTwUmdOv6KGCT3ETni5bWuaIk0U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ksB2Zi/cH7IR99oiUvkZ+Cq3/2fyk9ej66hSJQZFvyRmVZ90NGtQnCUPI6QGlll9i
	 eFN16fMPWlmT9y6HMLsgAcCez+Xx+jh8IpfF4Ou7VwlJ0F9iLz0L2XxGPhV1IvfM0F
	 t/zG3W55v4aqkZG0Hm9VHsb7s6l4XD/qIf0tmiNvdvkU6Nw/bi/9geydTYzmdDD19/
	 DyfWUNZrcJtE97kUETiAj5+porr1Oot55hvvG9BfGKxNiQ8EtbR5xXiVmRV3CzlB5A
	 4XyKhbx46WmjbC5qlfZIKWPtJald3bE8VulPnvj5uRDQtnBJL6P7kkKvbVE+8jinOq
	 eUIOMWkTmZ8Pg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 1/8] wifi: ath12k: add ATH12K_DBG_WOW log level
References: <20240530072714.25671-1-quic_bqiang@quicinc.com>
	<20240530072714.25671-2-quic_bqiang@quicinc.com>
	<b3ff72fc-c4bd-4cb5-a6d6-ad6772657d6a@quicinc.com>
Date: Thu, 30 May 2024 21:40:48 +0300
In-Reply-To: <b3ff72fc-c4bd-4cb5-a6d6-ad6772657d6a@quicinc.com> (Jeff
	Johnson's message of "Thu, 30 May 2024 10:55:39 -0700")
Message-ID: <87jzjbm9cf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_114055_621988_03E5D371 
X-CRM114-Status: UNSURE (   6.64  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 5/30/2024 12:27 AM, Baochen Qiang wrote:
>> Currently there is no dedicated log level for WoW, so create it for future use.
>> 
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>> 
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>
> As noted in cover letter reply this needs 2024 copyright. With that added,
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

I can add that, no need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

