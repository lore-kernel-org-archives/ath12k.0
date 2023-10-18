Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E5BCDB484
	for <ath12k@archiver.kernel.org>; Wed, 18 Oct 2023 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCWePiv9ASCKCnoaDQjiKPQo5+u+QWZdIsU+aU0Jzic=; b=Eqw99z9+7ni46e
	cUgTpOqwRUWXWVkMg3biPKSxJZZdh7osgEx073eWaXEpx6TiV/p6Is5dFlDbo78Y4DnJKln1bA2bM
	6WOkE9aa8EV5exLkWX82bYqqZCOFSFqLIuF5bp+mrr6SOgMwljB17h/bUvG4XvfS2O0ONLJQkcXBt
	0wt5dvcQkeSCUxhAmrYi45r8f5p9N1QYL/gnnEdLnshj2AjRiS4qYbPy8crYan4rXACfL5HPlxEJs
	JWOK59V7l9z52xlAe1DbMLVEJpPEGq3r4DHXT/GjoKBr9dTruDPIU2SNAGS/PJ8dCOMcRCxRSii4u
	5kMFYQdziNkgowkxVIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1wO-00E9Vx-2L
	for ath12k@archiver.kernel.org;
	Wed, 18 Oct 2023 08:30:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1wM-00E9Uz-1H
	for ath12k@lists.infradead.org;
	Wed, 18 Oct 2023 08:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBA15616F4;
	Wed, 18 Oct 2023 08:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A680C433C9;
	Wed, 18 Oct 2023 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697617805;
	bh=p7qtdS3dP5TCiZktRCL3CVf1Ih72w/1xVDE1TzIdIHw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Wdu6EOeEjwGiOK8JyqPu247OpNo5L+cYUyXg68WZP/UUSwNqyPzCV+YvKkMXEkgIE
	 v1uJ/9WUQz93TkNFR7sMQWOVipaE15lwXVicG4jH6ifo/dV40cJexvqkzsG8RNhc1M
	 KEP9K9SjD/1YocKyDiFdi8naJZb92tIXSPw0HlKqslHTwrY3KDDua6rqpAFFaXaj5l
	 GgLyxrA+/2bXX8ssW4Hm67udkFNMxKc2bxwKjci1iQv1PjSJJaqJPnrpmGdNOaCOVc
	 FesSb4px7bdPzwEidre0Ym7OdGR2YNS6WHHlJR7Q0uggKtdqbNrJl4rl24bpb33K/u
	 UVlLlSC7gmD+A==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath12k: register EHT mesh capabilities
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231013070007.25597-3-quic_rgnanase@quicinc.com>
References: <20231013070007.25597-3-quic_rgnanase@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169761780232.48072.9283113948539025613.kvalo@kernel.org>
Date: Wed, 18 Oct 2023 08:30:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_013006_482808_82456941 
X-CRM114-Status: UNSURE (   8.48  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> wrote:

> The capabilities for the EHT mesh are generated from the capabilities
> reported by the firmware. But the firmware only reports the overall
> capabilities and not the one which are specific for mesh.
> 
> Capabilities which requires infrastructure setup with a main STA(AP)
> controlling operations are not needed for mesh and hence remove these
> capabilities from the list.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

6b819f89c482 wifi: ath12k: register EHT mesh capabilities
3e9942fbdf4d wifi: ath12k: Enable Mesh support for QCN9274

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231013070007.25597-3-quic_rgnanase@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
