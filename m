Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21087C25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7USIkEz9VFRzx1ZZBV8sQCBcKUNxWfJqVAwPaQVdf0=; b=nvRTpniVxDURB9acbRcNdhM/mX
	8cZsKBthJAOvHILHmsbFM2K2S1g/JXwUhDaTQvY4g5le5ih5LIvDpYWxainmMndsm67IQOqVT/uZy
	I90JOhcAXv4tSwqNhXf/QbDoDDwTfRsaEhabR/y6MTnzsK7QBO/vJQL4/DieFIsXyxQo5/b8fmc+E
	UbjQDcJIGqoMhxd159IhtBe98QA/II6NxL476+E1l02KW9kB2vSXgvCfNaHEtPtzMSNzfl2hKLjNk
	ICRRX/wMV9v02zU7veQxhJNwLDTESrmIL2EeTlm9MfqPKXn2DJoLprx+UH8kDsabSuJj3UTBUZpYF
	O+spOWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0so-00000001amx-3OPh
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 17:45:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0sl-00000001amX-2aul
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 17:45:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0354362289;
	Tue, 28 May 2024 17:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62EAC32782;
	Tue, 28 May 2024 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716918306;
	bh=092slm6u3SuLv+jBx+DbZLRXByFStQ2yboHpj2kR4tg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=S/zPixi1pXk6vLG7WdKE46o+AmOJT5wWIEEMce5FZcOcfXitt+pP9hALu1o69UaNY
	 /pp7c2VnvUxJO/7WVW9h4JD/Or3TnRj9aKQyO9J/j/k0yXjMkgjH+jla85vqKIeOAl
	 XbyRBSo2B0qfTbftgPiGaFk1Y27RvPD65Dn1cBvi0IRkAekDLKVOiSOycGjgkSSfD/
	 F5WSjrGhvOA9Y7mf1OGJj2JO9U0/Oc1nNNWYIcjJtvx+wdi5OXmRNuUzcUpjGrQvsK
	 vuS9huuT5HzJSkZ1DcZAZhrRzslAJbKBPhuwnPO69A7wj5Sia6XqGBD9OBrG9okLWm
	 9NYbKCjuDNvAQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix race due to setting
 ATH12K_FLAG_EXT_IRQ_ENABLED too early
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240524023642.37030-1-quic_bqiang@quicinc.com>
References: <20240524023642.37030-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171691830369.1700985.14695281653028868170.kvalo@kernel.org>
Date: Tue, 28 May 2024 17:45:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_104507_869142_D78A82F1 
X-CRM114-Status: GOOD (  14.63  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Commit 5082b3e3027e ("wifi: ath11k: fix race due to setting
> ATH11K_FLAG_EXT_IRQ_ENABLED too early") fixes a race in ath11k
> driver. Since ath12k shares the same logic as ath11k, currently
> the race also exists in ath12k: in ath12k_pci_ext_irq_enable(),
> ATH12K_FLAG_EXT_IRQ_ENABLED is set before NAPI is enabled.
> In cases where only one MSI vector is allocated, this results
> in a race condition: after ATH12K_FLAG_EXT_IRQ_ENABLED is set
> but before NAPI enabled, CE interrupt breaks in. Since IRQ is
> shared by CE and data path, ath12k_pci_ext_interrupt_handler()
> is also called where we call disable_irq_nosync() to disable
> IRQ. Then napi_schedule() is called but it does nothing because
> NAPI is not enabled at that time, meaning that
> ath12k_pci_ext_grp_napi_poll() will never run, so we have
> no chance to call enable_irq() to enable IRQ back. Since IRQ
> is shared, all interrupts are disabled and we would finally
> get no response from target.
> 
> So port ath11k fix here, this is done by setting
> ATH12K_FLAG_EXT_IRQ_ENABLED after all NAPI and IRQ work are
> done. With the fix, we are sure that by the time
> ATH12K_FLAG_EXT_IRQ_ENABLED is set, NAPI is enabled.
> 
> Note that the fix above also introduce some side effects:
> if ath12k_pci_ext_interrupt_handler() breaks in after NAPI
> enabled but before ATH12K_FLAG_EXT_IRQ_ENABLED set, nothing
> will be done by the handler this time, the work will be
> postponed till the next time the IRQ fires.
> 
> This is found during code review.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

0a993772e0f0 wifi: ath12k: fix race due to setting ATH12K_FLAG_EXT_IRQ_ENABLED too early

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240524023642.37030-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


