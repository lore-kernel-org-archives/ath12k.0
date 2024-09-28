Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4708ACF6495
	for <ath12k@archiver.kernel.org>; Sat, 28 Sep 2024 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXK4GTqMBUt4irkEbbRizNNj+l8Ti4x9P5m4i0e4JbE=; b=j5u5+yhG/xEIaTkPEOdgoqqOu9
	T1Uug2ziXaMxouPvDGy23WxHBi1bSIdojyjzxYki66m4ZhRtTIa/zB8xbl+z3j9OtClK5NhtOtPcI
	Ndku7JbQqKvcPcfhA4T46iQ6+I1Cb2o48iL7D7NHTKliTnnL8/5jjzhVGjB/JV8bglbmc2cfwoqEw
	xNt/36HwsiztA+pFaGtepqxZrI5iBcTAwDntqW8ThY9ijpAlmIYxV9U/fdvFLu0o9yrbzkwEo3vj5
	G5g+fAkUDIyB+aSwlbRLrMRQeg9jQSmXaoUpkZAK0F82dBzk77r+32dSfdXNbv0XrH15cqDna/OaD
	i3yoRSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTcE-0000000CsGv-3T11
	for ath12k@archiver.kernel.org;
	Sat, 28 Sep 2024 09:19:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTcC-0000000CsGY-2VJY
	for ath12k@lists.infradead.org;
	Sat, 28 Sep 2024 09:19:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63582A4018C;
	Sat, 28 Sep 2024 09:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A23DC4CEC3;
	Sat, 28 Sep 2024 09:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727515187;
	bh=0HpofGMU4EYTwavpEVFLiZ98wyxVSyXqgct2C7t40e8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jLX0mI7TlnZyZXYSud21sSwyNRwWpt5tKrkLInKgaA4Ugdt6DtEd8F8pIRidmFI+u
	 pzNCL+xL7AepHINke3jKi8+Ww5Epv8bpfXIJ/S08juRiK25y4oFTpIX2/R8wBD3Y00
	 uJqiCqsXtRYFG3vTVKDDUmqFqup7658NVwGt2v3KNQey0QWXSrDwYHRwUHWFymfhwE
	 /5cJkVQxykG4gZ4jwcYVtWmYYwA4IOplVY9Z9ofUrLGt5lGRlZ+rlbW/IvwWBU+WO+
	 e9mTRht+uoTmtg/Y5khCTKYbihgpVlZpva+pBdqYiQU3MClWl9QwUnKlVfnpHSgnZJ
	 Wx1PBkcvYoHlg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: move txbaddr/rxbaddr into struct ath12k_dp
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240830081942.3623380-1-nico.escande@gmail.com>
References: <20240830081942.3623380-1-nico.escande@gmail.com>
To: Nicolas Escande <nico.escande@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751518486.2249584.15339812073510249276.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:19:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021948_736041_4F9E7794 
X-CRM114-Status: UNSURE (   7.72  )
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

Nicolas Escande <nico.escande@gmail.com> wrote:

> Those two fields are used to store the per SPT page of tx/rx descriptors send to
> the firmware for cookie conversion. Right now they are in struct ath12k_spt_info
> which means they are duplicated PPT page times while we only need one instance
> of them. This works for now as we always use the first spt_info as a global
> storage for all PPT pages.
> 
> Let's move them into struct ath12k_dp where they belong, alongside of the
> spt_info array they are tied to, to avoid waisting a good bit of memory.
> 
> Tested-on: QCN9274 hw2.0 PCI CI_WLAN.WBE.1.3-03283.1-QCAHKSWPL_SILICONZ-2
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> Reviewed-by: Remi Pommarel <repk@triplefau.lt>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3ed5cb8dfbeb wifi: ath12k: move txbaddr/rxbaddr into struct ath12k_dp

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240830081942.3623380-1-nico.escande@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


