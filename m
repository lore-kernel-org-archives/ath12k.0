Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104EDE732DB
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xK6ezliqknzO29BJC0Gbd/yEoYf84y410rW5buAYmY=; b=wQOpDVos0Xafe0
	315au5AeCUjQqrpuEahGT0ybp8SCi4viXB/gIq5pswXwR+k8HQQGQOCC/U68oWAc4FTpwWhKhqQq6
	PloFcqOU3DyThaO00eTjlxaoeo2bOUavDjjJQ2CnOPQY7N0kh3CJA7FhyzmoWY8Umc52SS4potaXD
	34BtMdcfR77s9fdo9l2Eu162cO7CjzEfUI7G8PQokQG1E+z/sNnW+NXgvrDQVFNitU0+I4ZJXDEUu
	zQe3ITGsS/et+VlmPZ4LrB0cDM1ARTCpuTe/cp1KrQk0yU28MLhXAHVBQXAtUMkg3Xm51C/2rTK6d
	uNGJucOcbubbVYCo3J+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsbX-005E5c-2R
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 15:07:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsbV-005E2r-1B
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 15:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CFB32CE1FAC;
	Thu, 28 Sep 2023 15:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2742CC433C8;
	Thu, 28 Sep 2023 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913618;
	bh=ClghSr2Zt4PMbSNdtJuup5mNFI8jI1jAJR5AfuRQ/1E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dFXVEk4LrsrYvJyNN4yQpBrkvFWt4iG57Jlbf49A/5jT45OfbjwYCPg0I8skOer7/
	 FPtTvmT8ZjSLCEXMPg29DciBN5hjU/AFcTYLPpS8/6Mv2Dne6EUP5by9jk4r0q82mB
	 FGMdW/UT9ykQEpdJF7jWtz5xvBBKYe7j8QsFgaZXzZNPCG39vv9RRUd+8utahJUc3s
	 A9VyjWALg9JTeBIgy3oZRTOiFkZMV2/0gRaDlpR1kCNRyESHJyZ+86aCA6vl4xR5BR
	 uaSZQcPHU4myIMS0RwIOr+EuviGMCydWLsGss5J4j4REMaHORafAY6TQSS//WtJ5pJ
	 GwvYpRXI0+aYg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: change to treat alpha code na as world wide
 regdomain
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230906090355.19181-1-quic_wgong@quicinc.com>
References: <20230906090355.19181-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591361532.3019228.18442918001635347196.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:06:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_080701_624901_1207C3C5 
X-CRM114-Status: UNSURE (   6.12  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Some firmware versions for WCN7850 report the default regdomain with
> alpha code "na" by default when load as a world wide regdomain,
> ath12k should treat it as a world wide alpha code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c86ba8ee7e32 wifi: ath12k: change to treat alpha code na as world wide regdomain

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230906090355.19181-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
