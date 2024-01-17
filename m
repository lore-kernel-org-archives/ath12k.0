Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C19C47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkDfuytSSTKYDJ0qedzy5Gz2QN5nCbZlT96ROh4NK30=; b=XEpJWIxfE684LS382eOLb1545+
	hx6ZbWYlLT99FqviAYPeQxvlk8U5AHl5FBsI5DkyMDZZpKEd1pysZ0mPPe4Z6Na/zKknQn/d3xceo
	9azZ//Q8XU4IDZ9NnP1BFkiv4IhiTcus1/FlM9YEpPqxyulnEDHTMz2V8L3gjdf/P7curi1zkN+8v
	bz9rIQUgH6Yfq45JfIOZY1JyWOgEtBMV2vVSwnhWsMz3huytqfNvMdDI/PJGNMpfCottuUipi9gaX
	QoE84v3CmG5ZY0IJK6F+4n4MpN+iAk/2nG/rAmdhVZADiG2g/ghipx3vJKPu9AVwH/IR6SkxvGQwK
	LQ1RIh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ4zJ-00Fsyl-32
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 12:25:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ4zF-00FsuT-1u
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 12:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5C24DCE0AC6;
	Wed, 17 Jan 2024 12:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28C4C433F1;
	Wed, 17 Jan 2024 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705494336;
	bh=gVt7/Sn2odT1iG7XbXOMPV86sBp35yRM/f0EfvTfyNo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=g8OKgXvPNplxpaU8bvEEywnpd4mb6pAxdXPNcbVVdQDC/Fyp/dO9puraoQ8B9DJCB
	 ArStu5YLvRaBaX53hKeG3AJfbrw+6TAzO/0Oda9NGaauux2egmqK/TdQF8W5ZJT5gm
	 a0mdBgFLenWVGGSuRYXuBIClAhx6Mhe4iu/mHWVfNfVKXwGqSqqwL/hvVLaz25alqQ
	 caxmdHm5+kLVlT3F4czeaXOEb6SNa9b5ZUdp0xAree0g1ivsUGO3rkWs5SlcEkbbjY
	 Uo9/e/WR/sFHx7NTpF/zMc728Ev+GX+A4OKMYDiGTZ+wIxCnhzV671uH+hIa0S50yF
	 qSaRPSXQupk5A==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 00/12] wifi: ath12k: QCN9274 dualmac bring up
References: <20240105195639.3217739-1-quic_rajkbhag@quicinc.com>
Date: Wed, 17 Jan 2024 14:25:33 +0200
In-Reply-To: <20240105195639.3217739-1-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Sat, 6 Jan 2024 01:26:27 +0530")
Message-ID: <87le8o5epu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_042542_467169_AED4E205 
X-CRM114-Status: UNSURE (   8.15  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> QCN9274 Ath12k chipset can support single-mac or dualmac architecture.
> Currently, Ath12k driver supports only the single-mac QCN9274
> architecture.
>
> Hence, add support for dualmac QCN9274 chipset.
>
> Depends-On: wifi: ath12k: add firmware-2.bin support

There's no base-commit so it will be very difficult for me to try to fix
the conflicts. Please ALWAYS use --base, makes it easier for everyone.

I'll mark this as Changes Requested and assume there will be v3.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

