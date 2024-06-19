Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E4DC27C79
	for <ath12k@archiver.kernel.org>; Wed, 19 Jun 2024 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ws9IbQsHNt1Mc+be1/yKlj8m+CCJ39r8C57+/6wwaE=; b=ZdHTn2KpAq0tK6aMV91xLcQ8jp
	p6PUSs/c6wqL/YF3iGT+mXxXrAoyLow1mJH1gHJ+/TsHbd9CGrLahyMjX/4B3pmftW7UO8mcEg3n2
	VpOBIAYmJ8mhD5ik7mB6a9mHrmrDoXJ4QdAOOmfqxpOLmajKnD0IFeVa/qCZ+G+dE2479R96GHAq2
	i3oOv/uzSUMFQlpx1TpcqweQMHph32+zuAinqtqiXjlEAk2bLAn2ve/p5L9EOg5yofRPdA+kkeeMM
	2hLf/2Y9+kHqqzl9ohgUNt/y0c0nfLKx7Eiz7TfZFQzQa2d9C4mBuEcd/cBlW+J2xS91wlYWs93JT
	S6P0t2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJw9Y-00000001U0x-33WX
	for ath12k@archiver.kernel.org;
	Wed, 19 Jun 2024 14:19:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJw9V-00000001Tz1-1KN3
	for ath12k@lists.infradead.org;
	Wed, 19 Jun 2024 14:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8148C61C06;
	Wed, 19 Jun 2024 14:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC18C2BBFC;
	Wed, 19 Jun 2024 14:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718806748;
	bh=vD2Up9i4qk6AnPoJeI+9alphwx6tMA2LrV03Bcepd7Q=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WQ0QnPS6PVMHpdFGLVZJY5LYh5TOx3d8TfZji/owDGI4RGnb9d9NGV5XI1QLXJu6F
	 ARie9UFEquawApl9V8jZ4xL0D5YvWs0nz5WWW9HFgJGF2AFIlAnHlZHcuZV+9hOI29
	 fyZpTOlrYXCNjJ6PWrxjv0oYbe60jOf02FOxluZeh9s4kPj+wbrLtnhy3ncLo9kkRu
	 J/WQY98BqbYkMO6bxe5a91hsTEwh753wCoknA3c/MPkS0sVouTpqfT4E+bClTF6DAA
	 TmrKz0b5wt8NxvFv9QNeX2g0ypynHhifzwTZgJ4wB5QEahvoY9106GC9zZiRuWcxj/
	 LZPTL4tI+ZVOQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix firmware crash due to invalid peer nss
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240613053528.2541645-1-quic_ajithc@quicinc.com>
References: <20240613053528.2541645-1-quic_ajithc@quicinc.com>
To: Ajith C <quic_ajithc@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Ajith C <quic_ajithc@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171880674564.605247.6790441017714967286.kvalo@kernel.org>
Date: Wed, 19 Jun 2024 14:19:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_071909_477928_4B31A46C 
X-CRM114-Status: GOOD (  10.50  )
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

Ajith C <quic_ajithc@quicinc.com> wrote:

> Currently, if the access point receives an association
> request containing an Extended HE Capabilities Information
> Element with an invalid MCS-NSS, it triggers a firmware
> crash.
> 
> This issue arises when EHT-PHY capabilities shows support
> for a bandwidth and MCS-NSS set for that particular
> bandwidth is filled by zeros and due to this, driver obtains
> peer_nss as 0 and sending this value to firmware causes
> crash.
> 
> Address this issue by implementing a validation step for
> the peer_nss value before passing it to the firmware. If
> the value is greater than zero, proceed with forwarding
> it to the firmware. However, if the value is invalid,
> reject the association request to prevent potential
> firmware crashes.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ajith C <quic_ajithc@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

db163a463bb9 wifi: ath12k: fix firmware crash due to invalid peer nss

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240613053528.2541645-1-quic_ajithc@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


