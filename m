Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D0CD4F3C
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJVEETkGBWUMQJVVpXvXyDV7q+8Z00I8HhFUkr6tm10=; b=zuk2mhrhQdCre17/EaSePVdzve
	zzBcF1vCRnxrj+KHDxqacmvGRfpYa6U1WHBQre/P5pJV2X6VwS2fl76NKluIJ+almbnqNBfR204hx
	CCPiNKVBmHDTwSxqVcvN6j8P+p3FAdTcCLXSY9hBQYKVjFmHu1WD2D5ePS6obXxrDRqwNZbbhCmFt
	1T1SHd29RiPd1xebad3uwr6NuWxCFxjWi+gkckqUUCWCI1eAUaFn9rNu79Tu9+TbfsEkTjV4XkA7P
	IVn3vfSbhJi3sfQEWo0msc7xXy9lIDHm9fXrn0kHt1nVCncdLURYXZu8df/306N5wMoktodyyKHQt
	gU7l1Vmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLTJ-00000001q1Y-21EV;
	Tue, 19 May 2026 14:31:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLTG-00000001q0j-1XHz
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 14:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E81043247;
	Tue, 19 May 2026 14:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92F5C2BCB3;
	Tue, 19 May 2026 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779201057;
	bh=vJVEETkGBWUMQJVVpXvXyDV7q+8Z00I8HhFUkr6tm10=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Hb/kkxQuZMcHG+E12HLmGO9AJ4R//w787E55fajhj+XnKCaOXgyjnAmIt5BteU4/a
	 5yBte2UVlcVhijYUEtL4DVJ+t4AgLCbb8j73KFc0hn22meqZmfGJqPS6NcUlLAINKs
	 MYJ8drBkkkA+RSiHv4iwKVmeCNxJn9fRw3zs42m1Ahb/pBlZMc+I+V/aQ6fScnTGdO
	 Q1AWL0OWdAAvmpuUouDXLwy3hEX+dLSnN1aS/fGt9mN1cYditYYPOwUUGI/DPDevd+
	 3hvlv5pMYxCaG/MEunCS3RQgrPL+kHOC6D7uzslZJ2X2a/NmAPD6nJVe7ASaWtJHeb
	 XtZ2dYGVtitAw==
From: Thomas Gleixner <tglx@kernel.org>
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] genirq: export irq_can_set_affinity() for
 module drivers
In-Reply-To: <20260519011627.713068-2-hangtian.zhu@oss.qualcomm.com>
References: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
 <20260519011627.713068-2-hangtian.zhu@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:30:54 +0200
Message-ID: <875x4jxyht.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_073058_420248_4EA8A30E 
X-CRM114-Status: UNSURE (   7.12  )
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

eviewed-by: Thomas Gleixner <tglx@kernel.org>
On Tue, May 19 2026 at 09:16, Hangtian Zhu wrote:
> Export irq_can_set_affinity() for loadable drivers that need a runtime
> check for IRQ affinity capability.
>
> In hierarchical IRQ setups where the effective irqchip path lacks
> .irq_set_affinity(), drivers may need to switch to a fallback policy.
> Without this export, module drivers cannot use the core helper and have
> to open-code equivalent checks.
>
> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>

Assuming this goes through the wireless tree:

Acked-by: Thomas Gleixner <tglx@kernel.org>

If not, please let me know and I pick it up.

