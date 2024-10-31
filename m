Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B53FD767D8
	for <ath12k@archiver.kernel.org>; Thu, 31 Oct 2024 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gW7Tp9K0El3bmrSwFvaYSYaJMokkiIdhJFTc8A/K8DA=; b=EobTmdDNObwVyBancjNR+/l/I/
	QeSQGzwpYmzTFaLn/flMRpH6CKZ+gVaUYrbxqfy4FdMoIZSUjT37HxI1QBguCp9WoWlTKL4y166Su
	vOgmfcal3enKnzROrKvBuo8jOzbXrmCirXWb4jhUFiDG+6urKRBvR+aix+1QK06xgDM/Xi57fw1Lm
	l1/WaIjuBNGT2hCeEQBi3DqGh10roEZdA3vqdBuohaIYm3KpkudT479DMb+AliOs8NEVEeJbaArNa
	hEoV8//y1Vi2/TBNh4giXc9HYgvHvcoGgOCZITZkOcxuzvvyCt/l/Qwi+qvqXgK1uFdHr0LuWS2u/
	qV655DdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WDJ-00000003ohb-0rOa
	for ath12k@archiver.kernel.org;
	Thu, 31 Oct 2024 14:31:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W4J-00000003nMo-2vwa
	for ath12k@lists.infradead.org;
	Thu, 31 Oct 2024 14:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DFC7A440EE;
	Thu, 31 Oct 2024 14:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4F3C4FE0E;
	Thu, 31 Oct 2024 14:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730383498;
	bh=HVdeTGq8tw85YSsGdDSi8A8rnS3fMC4tuFjU7oRUbCE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KR2h0gI7A/NUGYNKfPWgTn9tf/w10eoK/Joft+nluD7JFlW1HMjj3sRTe0LHHZJ3f
	 Z1bAZW628FLFBnmBF5WI131W9+MKm+dd0atNbFZ1UWgmugJBEax7W+eOR34q2GGEQN
	 c4x5uLp49Z9qhWFVQFHFAs1cMrFbdUWVDat1F7BG8QI8Yhk5Whs8tF2uN9dm26OxBQ
	 cldGX7CbtH/s227j2bhjuAUbg/v2llPtimvIqUBpFiPSeIGj0iC1Vi9DGMNwSX39oO
	 6cgTW4bOBWGbw2ne7LZHiQLPrWgW3bso+6+RKacs52gqPANAOEmL63jJsdO2kyxt4f
	 H9yG+LOifqhPQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k-devel-internal@qti.qualcomm.com>,  Jeff Johnson
 <jjohnson@kernel.org>,  Nathan Chancellor <nathan@kernel.org>,  Nick
 Desaulniers <ndesaulniers@google.com>,  Bill Wendling <morbo@google.com>,
  Justin Stitt <justinstitt@google.com>,  Arnd Bergmann <arnd@kernel.org>,
  <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <llvm@lists.linux.dev>
Subject: Re: [PATCH] wifi: ath12k: mark QMI driver event helpers as noinline
References: <20241028-ath12k_qmi_driver_event_work-v1-1-0d532eb593fa@quicinc.com>
Date: Thu, 31 Oct 2024 16:04:53 +0200
In-Reply-To: <20241028-ath12k_qmi_driver_event_work-v1-1-0d532eb593fa@quicinc.com>
	(Jeff Johnson's message of "Mon, 28 Oct 2024 07:08:40 -0700")
Message-ID: <87bjz0fjwa.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072235_835327_F3B9366F 
X-CRM114-Status: GOOD (  10.62  )
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

> As described in [1], compiling the ath12k driver using clang with
> KASAN enabled warns about some functions with excessive stack usage,
> with the worst case being:
>
> drivers/net/wireless/ath/ath12k/qmi.c:3546:13: warning: stack frame size (2456) exceeds limit (1024) in 'ath12k_qmi_driver_event_work' [-Wframe-larger-than]
>
> Nathan [2] highlighted work done by Arnd [3] to address similar
> issues in other portions of the kernel.
>
> ath12k_qmi_driver_event_work() itself is a pretty lightweight
> function, but it dispatches to several other functions which do the
> real work:
> ath12k_qmi_driver_event_work()
> 	ath12k_qmi_event_server_arrive()
> 		ath12k_qmi_host_cap_send()
> 	ath12k_qmi_event_mem_request()
> 		ath12k_qmi_respond_fw_mem_request()
> 	ath12k_qmi_event_load_bdf()
> 		ath12k_qmi_request_target_cap()
> 		ath12k_qmi_load_bdf_qmi()
> 		ath12k_qmi_wlanfw_m3_info_send()
>
> Mark all of those underlying functions as 'noinline_for_stack' to
> prevent them from being inlined in ath12k_qmi_driver_event_work(),
> thereby eliminating the excessive stack usage.
>
> Link: https://msgid.link/bc214795-1c51-4cb7-922f-67d6ef98bff2@quicinc.com # [1]
> Link: https://msgid.link/20241025223321.GA3647469@thelio-3990X # [2]
> Link: https://lore.kernel.org/all/?q=f:arnd@kernel.org+Wframe-larger-than # [3]
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

