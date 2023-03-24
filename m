Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019F5C6FD1C
	for <ath12k@archiver.kernel.org>; Fri, 24 Mar 2023 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PtEtHdnhcsiGdMuoMfbu1HbwZlxLhNZljm4Uf686c0=; b=Gk1oJdyzAUzIZ4
	QjF3cXzvhtBrZlCcFJ7/qfrozhbanqGoOzhuRZN1xggO/Jhl95yYE2SBlkBq0nl+8/iVW8m+hoiAC
	WOnNsg1Z9/zRLMovLS0vK82gyXzplwENwezegXCLifPuuKSluJUjniPz5k5FYm0KPvVxd0UURUoQT
	GBUasZ5UFG5f1Tk8H9Qs65ui5kiqqW9FLCprCLOZfH3VeYPsbkwGMSd+l3PoYBH8LZQIboBzk7uTM
	ZkxR1LAl0VJPg9n2WkR9nlK5zwrKdGTjzMiilzaC8fCgakIt7+xi3j/iOeimw7o4Zp4WWuTfJJ+dm
	KqLepEf/3Hc9Fojgmzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfijh-004hqy-28
	for ath12k@archiver.kernel.org;
	Fri, 24 Mar 2023 14:49:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfije-004hp4-2f
	for ath12k@lists.infradead.org;
	Fri, 24 Mar 2023 14:49:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D093CB824C4;
	Fri, 24 Mar 2023 14:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A613EC433D2;
	Fri, 24 Mar 2023 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679669378;
	bh=Hl8W0w9BtHpICBcGok2UYwa+8acwZYFJHjOzIeFWJDM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=oy16oRUHxjuk07I4+78mpaFTIk4K7ilRS5IJOxNDrxMrVMIetRP48/DA7ONRsdtIN
	 YP2IjkX4yZKJQ3PbPSuLElkNnwF2+yy0HT8qkLJnrxmwwPpTNJWGLC4MwBEFerov6T
	 IqZTauETTw8gH1lWX+bylV0xovpJH+99oCmFfKGDIvu9RKfotulbvQD1sNqfUvJPMn
	 QAAK7GOcj2z8Flt3N3RmJrzO6g1st/Ux1zI9Pm/7vW2RqYetLhfGcwonw9xVI75Kxu
	 DwtI0UzoH/Km4CWz9S2obL6SCU65VxX73liVx+5Q6wKy1IWkSDYL6Dqd2hQ8mR+w43
	 rIGmQWGSRxYvg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: incorrect channel survey dump
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230320091208.25535-1-quic_hprem@quicinc.com>
References: <20230320091208.25535-1-quic_hprem@quicinc.com>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Harshitha Prem <quic_hprem@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167966937560.27260.15117945912260469719.kvalo@kernel.org>
Date: Fri, 24 Mar 2023 14:49:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_074943_013681_AC9903F4 
X-CRM114-Status: GOOD (  11.07  )
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

> When underlying hardware supports more than one band, then wiphy
> is aware of all the frequency bands present. Example, say
> wiphy0 is aware of 2 GHz, 5 GHz and 6 GHz band information.
> Hence, when an virtual AP interface is brought up in auto channel
> selection on each band. Survey is initiated from the userspace application
> for all the virtual AP interfaces simultaneously.
> 
> For survey dump collection, freq_to_idx() api is used to map the index of
> particular frequency to populate its survey. When the dump was collected,
> the index fetched was incorrect. Example, in case of multi-hardware,
> the index of channel 36 was reported as 14, because wiphy0 had index 0-13
> for 2 GHz channels, instead of 0 for that ar which resulted in invalid
> survey sent to userspace application.
> 
> The incorrect index was because of the mapping did not consider whether
> the freq band is present in its radio structure (ar) or not.
> 
> To handle this, the freq_to_idx() api should map index for the
> particular band in the ar structure.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

25d165c49802 wifi: ath12k: incorrect channel survey dump

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230320091208.25535-1-quic_hprem@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
