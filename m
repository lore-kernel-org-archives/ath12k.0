Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC759C6FD20
	for <ath12k@archiver.kernel.org>; Fri, 24 Mar 2023 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rq+TNLAonHrYtNIF5aHKhGAWTPvskPlzJ41rMKkOaGU=; b=Hi3fgy8RpjcrGu
	o2nC+raSx+Nlj7JwdcRjtug8Kmy7hlitC4JbqcRUj+H/9KiaySx2fdRakYlFM7Rd7kxe/LU/MN8qB
	hASgZcUAG5F7moGQYYzuqmuaa033NCbaCJUUiDg2rkxGjezqNFDLigVUQdRE3BYn+4+xdbj3yD87d
	rjRLZkcvrU0p7ny/mt46gRXMJ5OpsrCJySXFpGHArjDHHBb16zSJ+NhYiBpsyCtXqbA4kfypdYMzV
	vui6X6uOC77e2XOi3XRjo2neHAJVyzEkF8pTMHv8VvjmdoQ822e60aRdzII5B4EHgHnYzfKEKoCOd
	5TEYq95JXoY+Zzz6nhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfij7-004he1-1A
	for ath12k@archiver.kernel.org;
	Fri, 24 Mar 2023 14:49:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfij4-004hc2-1m
	for ath12k@lists.infradead.org;
	Fri, 24 Mar 2023 14:49:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3B075B824C5;
	Fri, 24 Mar 2023 14:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1C6C433D2;
	Fri, 24 Mar 2023 14:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679669344;
	bh=MANfTqFiGj84M3too4SLDUu3WWV9uomOPjQ4Z8QKHq0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FSoigjj3B7w1mdxO0XH+Bgh87X+RIhDEJMkjxgC1wVJijS6MlLZCihDbPCAu/k9QA
	 qBcmO8d1WnEhHQmbCcClboNAdFke2y3eC+seXmr3hn8sIzxFdY65ipSB8Q9ZydX/eY
	 vl2YIrG5E1thTFmPbZbjSZCpziiZ4VoI/wKEaT2Y4kJbI6IPlYicnPjV9sJBbq3Mbi
	 PacRpiGSE89n6Uf9ldlacTHwhMOFTu4nCQmTSwsSPNGQPEMUizQQPDxFEJFyXFd+d7
	 +u8k3sMvUZzsYidfnyzmEit4bKjPk1ru7BU9Ktw+K/tUc7csU9qXhMHRCLfZMypldM
	 97KUZpNKfQ8Tg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix incorrect handling of AMSDU frames
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230320090400.30027-1-quic_hprem@quicinc.com>
References: <20230320090400.30027-1-quic_hprem@quicinc.com>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Harshitha Prem <quic_hprem@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167966934129.27260.16769299047349911111.kvalo@kernel.org>
Date: Fri, 24 Mar 2023 14:49:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_074906_737155_E2C99FD1 
X-CRM114-Status: GOOD (  10.13  )
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

Harshitha Prem <quic_hprem@quicinc.com> wrote:

> When a data traffic with size greater than 1500 is initiated,
> say size 65500, it is sent as a set of AMSDUs (3 MSDUs)
> in a MPDU.
> 
> These AMSDUs are incorrectly classified as multicast
> and peer id gets changed, except for first msdu,
> because of mcast_bcast bit derived from rx_desc
> for every msdu received.
> 
> The mcast_bcast bit in rx_desc is only valid for
> first msdu. Hence, add changes to derive mcast_bcast
> only if it is a first msdu.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

392b6b76fd39 wifi: ath12k: fix incorrect handling of AMSDU frames

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230320090400.30027-1-quic_hprem@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
