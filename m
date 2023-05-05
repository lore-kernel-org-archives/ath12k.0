Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346A3C77B7C
	for <ath12k@archiver.kernel.org>; Fri,  5 May 2023 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLLq2Kw3g6sVNdUqdvpUopm1HMSaaJOsIDLElVC8y4U=; b=O+jYdYQafS6nlv
	DxyxXm7GoYwCs2o3l3xUlil+7TT0CF/fPkEfNlawInF76MC847FhJp7Gr0UYOE/aFR7WbTPLoDuLJ
	M6v4qOaQw31gyMUNb8g09fRauf4QO9H3Tn1hP0PQ9017kC6BKSQ4opnRBDldQn3dhsnbZsYLKBs+S
	8Bq2q9PG/WoaSu4r2c7i8+UABTdNYD0Vp8gwAnn4HllLKtJLTb+oVrbWs1wk2Bw8BASDQSu/9+klD
	HU4QCciGphTHPF/uh6Fjxs8CP2kymX0KAwoIF4bEpFmzE2xspfEj87gPMNhdNHEaa66evJmTehMR4
	kUUcvttVTwjnfld3fJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puv1B-00AwKj-2X
	for ath12k@archiver.kernel.org;
	Fri, 05 May 2023 12:58:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puv18-00AwJc-2g
	for ath12k@lists.infradead.org;
	Fri, 05 May 2023 12:58:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18C6A63DA1;
	Fri,  5 May 2023 12:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F455C433EF;
	Fri,  5 May 2023 12:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683291513;
	bh=iv92TilbooBt2mzK/C7ordb4HzrXSGTFp8/jdDtq6bs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Ul+XcD1eN+4+Hgs8HrTKFO7ehz+dBJfN3nxMzGZSgufOxznuKTquC3c+xw+fsz0i3
	 Z9HDQeFD7xvkipp21RGfdUW1j8wK0kb0JCHKsBxU/QqtCNRHcHizARUUfxHc0dgZiw
	 YM9v2AwWS0LTMZ7b7I+Lu0uJg7fDe7Jlxk3/GS1cDCK7G0lC61r2yr9SPvEZ2vh7WW
	 zdAr1k74H7zDa5ZaIsp4ORhsHnmJ/H96UP7gAjHooEpR90SaBA7UqhLZw3PgszYXQH
	 LvG5bqQ1KHRO92M/y4bYJfevim5Kd3NQVTdNSc2ggGYxuNw5KAB2V+wU5TtdpYA2hu
	 bk1bb3yUbHlOQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath12k: fix potential wmi_mgmt_tx_queue race
 condition
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230419095758.19998-1-quic_rgnanase@quicinc.com>
References: <20230419095758.19998-1-quic_rgnanase@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthik M <quic_karm@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168329151051.30600.2331645235698390250.kvalo@kernel.org>
Date: Fri,  5 May 2023 12:58:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_055834_906488_81EB1D05 
X-CRM114-Status: UNSURE (   9.39  )
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

> During stress test with maximum VAPs and peer connected, below warning
> is seen:
> 
> [ 1079.110967] ath12k_pci 0004:01:00.0: mgmt tx queue is full
> [ 1079.117708] ath12k_pci 0004:01:00.0: failed to queue management frame -28
> [ 1079.123191] ath12k_pci 0004:01:00.0: mgmt tx queue is full
> [ 1079.129960] ath12k_pci 0004:01:00.0: failed to queue management frame -28
> [ 1079.135641] ath12k_pci 0004:01:00.0: mgmt tx queue is full
> 
> This is caused by potential race condition while accessing skb_queue_len().
> When ath12k_mgmt_over_wmi_tx_work() and ath12k_mac_mgmt_tx() is called concurrently,
> then skb_queue_len() might fetch list length which is modified by skb_queue_tail()
> or skb_dequeue().
> 
> Replace skb_queue_len() with skb_queue_len_lockless() which will
> prevent concurrent modified access using READ_ONCE(). And also use '>=',
> in case we queue a few SKBs simultaneously.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthik M <quic_karm@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e995f3f602a3 wifi: ath12k: fix potential wmi_mgmt_tx_queue race condition

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230419095758.19998-1-quic_rgnanase@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
