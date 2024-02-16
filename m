Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775A9C48BC4
	for <ath12k@archiver.kernel.org>; Fri, 16 Feb 2024 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWu9L5P0abMC4nkKScKKrgJkGxTQ5fQAm3MZv711kgo=; b=cyuAu6/5gpvn+h9KEIqGrUyvxv
	qccMT+1gFaD1rKIO7fhHe45C9whImME8VYTZmSmD/tuS4Kctk2aTdk7NInbKgZ3WS7cjAh+Z2TSOL
	MFSxi4V3qRRzXOElQp5pTJrdJiRRG1sjTjyBt/StBzbIX+znF2fjfqin38LO8NQafbn2fNNfu6OXU
	3uerxkQUFXopoOr0v6DYwj7qFi+IugpdSsEQ2XMw2pysbS6DJ5tGDsznFSLiLi0vbalaHLiTwRC8e
	0dyCz2ru37iCTLaHbZzaul7w6YIH+UsW20FMuQeOaz2q3qtWjeuWhQSi6CBeY+uPnmLTYRN5vajJl
	zzfYnZwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1Bl-000000031GV-0oKT
	for ath12k@archiver.kernel.org;
	Fri, 16 Feb 2024 16:35:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1Bj-000000031Fk-0Pyu
	for ath12k@lists.infradead.org;
	Fri, 16 Feb 2024 16:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E774B61FDE;
	Fri, 16 Feb 2024 16:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C561C433C7;
	Fri, 16 Feb 2024 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708101344;
	bh=Ln8SvTSKUBvAst/PdaGwGh7GdSDxPCTOFBToh/EUHKU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YUpmOZ9I0aLwJcrYutr+JPvg/qE+8Y+Msy6FvdjxUX133kIQQCavXVwJV4xuSYzSt
	 OBahGWxivh0b3PVDpGHQ+abXaRDW71xGgqqZ5aAoixRVDsDgqssa4M5onDbQyyXxLm
	 mXqGIrKvZJSSFJk/FNFZI/cl+HfqKj9vLxCjEijEVgxi9SCOb7oCHSqHWuSotNajJz
	 gdiM49diHqL3sT6ChuBS+374wHeLFhteeEgeJR31RCoguDKLT6P6qAp5dpS3e8l/wB
	 DPEqEVTcc57NIWAM8qigHg8Fd0KCKFJL0xBGgAJVuU0/N8Ijts3WOqeRsFyEYNqauz
	 MWWkD9J8z7jwg==
From: Kalle Valo <kvalo@kernel.org>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram
 R <quic_srirrama@quicinc.com>
Subject: Re: [PATCH v2 03/12] wifi: ath12k: modify ath12k mac start/stop ops
 for single wiphy
References: <20240206091954.4144454-1-quic_ramess@quicinc.com>
	<20240206091954.4144454-4-quic_ramess@quicinc.com>
Date: Fri, 16 Feb 2024 18:35:41 +0200
In-Reply-To: <20240206091954.4144454-4-quic_ramess@quicinc.com> (Rameshkumar
	Sundaram's message of "Tue, 6 Feb 2024 14:49:45 +0530")
Message-ID: <8734tsnz8i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_083547_215484_535BA660 
X-CRM114-Status: GOOD (  13.61  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:

> From: Sriram R <quic_srirrama@quicinc.com>
>
> When mac80211 does drv start/stop, apply the state change
> for all the radios within the wiphy in ath12k.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>

I haven't reviewed the patchset fully yet, first quick impressions:

> +static void ath12k_drain_tx(struct ath12k_hw *ah)
> +{
> +	int i;
> +	struct ath12k *ar;

We usually try to have reverse xmas style, of course not always possible
but here it is.

> +	ar = ah->radio;
> +
> +	for (i = 0; i < ah->num_radio; i++) {
> +		ath12k_mac_drain_tx(ar);
> +		ar++;
> +	}
> +}

Please avoid pointer arithmetic (in this case 'ar++') as much as
possible, it's just so easy to shoot yourself in the foot. In patch 1
you add ath12k_ah_to_ar(), why not use it?

And I see this pattern quite a lot, should we have
ath12k_for_each_radio() or something like that? Or did I see that macro
in some patch already?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

