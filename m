Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286CAC6FD1D
	for <ath12k@archiver.kernel.org>; Wed, 15 Mar 2023 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bu5ht2/LEmTBS22NfvB3QsjddeomOzrtoK56VQAtAkY=; b=CmxB+foGsUYik3
	Yz4oTPmlg3VGFFmO4Ur/k2TYAMHGu4VuYr7TUodsJ79VLEjHI2dU+P92VKfMgrMLwQ9ofIdyHs9Et
	opWHCBgBDjpuduly8dQAVaviN5KQNmEwTBVgoEprT4Fl+CNOOah7wwks69sF+fJmqGNhIuDJP6u+D
	Q73M3ecD11tnWvoR2qJTSk3KOkPC4wRVYcPo2k+CsMlm0QBOJUIvGKA/DxCyejrCs/lYSVvZEvv5+
	dIAMMebnG6sNFrkwfdWHV8HilnxN0KV0rEot/IVP/LkJ12SiPgyu1GQOPjTj7OJouAoTXr69qhx2A
	16+URQpHO7AbuFuv2J0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcODQ-00D2aL-2N
	for ath12k@archiver.kernel.org;
	Wed, 15 Mar 2023 10:18:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcODN-00D2Zz-32
	for ath12k@lists.infradead.org;
	Wed, 15 Mar 2023 10:18:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DEF361CB0;
	Wed, 15 Mar 2023 10:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B443C4339B;
	Wed, 15 Mar 2023 10:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678875516;
	bh=P4PR/J1VSp93ASIxZ95h9QGDLtrqnHpwJX+AZxMNMiA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=vPDNpTZFF02nnIbA8wP8f0pmHYThgI1wYVo95qD16L+YOup+r/10ImZaBeTsuc4ZC
	 x5P/eFMQ8Hiw5LsLeWHTse0+HPiCE2fKC6uKnymsiFDLx3EDNGB4gjU+lYXPmXaSx3
	 LK2sGy/ysXCdSq2DvSfYvvs2eKEoh9a+MWz4TuhXVEPOKTsWzQwqxeJjhhP2lJrAz8
	 89XxuFPUXDi+hLRqqWjj4uORwAZFnLmjoE2+o//lwbgZCB/tvG9qhAXBs9Ld0/UZA7
	 hOFt2cbX9sxjlz8qqSoiZxG6P1+TIC/I2/5bIi9g8cMTvWzSJeVgpq4Wb+FcdW0edu
	 6ekOvkH+HUw1A==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Add missing unwind goto in
 ath12k_pci_probe()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230307104706.240119-1-harshit.m.mogalapalli@oracle.com>
References: <20230307104706.240119-1-harshit.m.mogalapalli@oracle.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: unlisted-recipients:;
 (no To-header on input), error27@gmail.com,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
 Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167887550837.27926.11659991726085359589.kvalo@kernel.org>
Date: Wed, 15 Mar 2023 10:18:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_031838_016724_D91A60CF 
X-CRM114-Status: UNSURE (   7.79  )
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

Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:

> Smatch Warns:
>         drivers/net/wireless/ath/ath12k/pci.c:1198 ath12k_pci_probe()
>         warn: missing unwind goto?
> 
> Store the error value in ret and use correct label with a goto.
> 
> Only Compile tested, found with Smatch.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/all/Y+426q6cfkEdb5Bv@kili/
> Suggested-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

488d9a484f96 wifi: ath12k: Add missing unwind goto in ath12k_pci_probe()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230307104706.240119-1-harshit.m.mogalapalli@oracle.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
