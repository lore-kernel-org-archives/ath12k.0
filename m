Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925C8CE79D0
	for <ath12k@archiver.kernel.org>; Wed, 20 Sep 2023 13:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eOyHdN3v/roOvq2LZF5zjirqww/lZxjcyMVzV44DGc=; b=rPEKY+XEAKlobX
	wgJZPMaHjj97CkNg3mCPWaLDRuKoXJvD8k0W/majsucRdQAUlP6m1I9LpY/Lz3u6djshlqLgasN+i
	BQ59FANmB3X39d7KxWWCZtpdRhUDq9TKBt04rNlYO166nKBr5tFV5+3yPcCrQco7kcm598CY0dhTz
	lUZgSLZTPLgHICgJW8meZerXrTycblSz7XI1AKjFsY1yKuOJ0iKs65bILQEjg8MM0Dbx6rexlfsVI
	84anHpSLbTI97/Sr7nycSV7OQG8lxPVh08rcPJ3PDL0YCgNmsSVFmCcs7LqkabLZxBwBtYuy6W6gu
	OMxeF14prxibpSCo7PzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qix2q-0039Qq-10
	for ath12k@archiver.kernel.org;
	Wed, 20 Sep 2023 13:15:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qix2n-0039QP-23
	for ath12k@lists.infradead.org;
	Wed, 20 Sep 2023 13:15:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 74CD3B81D6B;
	Wed, 20 Sep 2023 13:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD9DC433C8;
	Wed, 20 Sep 2023 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695215702;
	bh=Mf/851V73fxlfhoYSnXEInZvAqBsgEPB8mWBSfVMRfk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SofpNG1sFMsX0/WRGO9rukrOcPmdNaGf3eIhp2/7M/2JQhjgzQBt3o3aXVc6V1jWl
	 Jn9Gk893DccHRpJKRXSmLTA/uER2VLJaFUIKanPIpuzDNbckt7mubK9YmI3IzJCrb2
	 W3MaNxAppI+6FiQyQSNZu7gHzSr+J4+YtXXx4qUsWx5cLBpzPj6XgbR4DkJpzbq/U3
	 JcfFXhGhcl/xd1PYL4+el2M/4UxGrYrCSyOI8g00XwVqh/wrFcS8H226FS1kj2Ngbl
	 6qwCb/W5+yg+bTyu3LUl7rL2swsgkrRkuRZ6QKSB4XPqI+7fF0gOjECGmOpqxRrfR3
	 0Pl8bKRNDvb4Q==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath12k: fix WARN_ON during
 ath12k_mac_update_vif_chan
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230802085852.19821-2-quic_mdharane@quicinc.com>
References: <20230802085852.19821-2-quic_mdharane@quicinc.com>
To: Manish Dharanenthiran <quic_mdharane@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manish Dharanenthiran <quic_mdharane@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169521569886.1118199.14851919916487311370.kvalo@kernel.org>
Date: Wed, 20 Sep 2023 13:15:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_061505_818839_6D8A7935 
X-CRM114-Status: UNSURE (   7.06  )
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

Manish Dharanenthiran <quic_mdharane@quicinc.com> wrote:

> Fix WARN_ON() from ath12k_mac_update_vif_chan() if vdev is not up.
> Since change_chanctx can be called even before vdev_up.
> 
> Do vdev stop followed by a vdev start in case of vdev is down.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manish Dharanenthiran <quic_mdharane@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

8b8b990fe495 wifi: ath12k: fix WARN_ON during ath12k_mac_update_vif_chan
3f53624f74f4 wifi: ath12k: fix radar detection in 160 MHz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230802085852.19821-2-quic_mdharane@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
