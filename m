Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE389C4345F
	for <ath12k@archiver.kernel.org>; Fri,  3 May 2024 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O34z7L5eMFrdmzHn36eQcMVr8C3BjMC98zV26gr1ifo=; b=fC48iLnFPcYv1TxOsPoO4hfvZJ
	BRsUGvuon0JtV9hZuLYuX+VLq5DpTwbEWuLsXAhqnqNPJOSy/T5P4T8aRwLpAVWLEQqYN2leo93YW
	Ji+34ZxGf7wZ2PNP9XJlWPZXsFeKgckL/4R9q3ywPC3TC0s29Jv/eZSmi7PaPz9DV5DH28vwJmkWS
	7sJLDbwqzizWw9X1gvnqYcJiWa/0xKAiNIpzJYx9gI2pEHaPJEoA7T25v92YNKoUvP5h9Qwr5FuuA
	EyVIJccS3Uit69wP9LtsnI1CeBkXANkyznVNlsAJN9riJ79J+11Le3oEJ9ePOESqd7MAvQsBEEnco
	Sn8Sh34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2siP-0000000GbfC-24SH
	for ath12k@archiver.kernel.org;
	Fri, 03 May 2024 13:12:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2siM-0000000GbeR-1fFV
	for ath12k@lists.infradead.org;
	Fri, 03 May 2024 13:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D898CE17CE;
	Fri,  3 May 2024 13:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787ECC116B1;
	Fri,  3 May 2024 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714741952;
	bh=jBar2W6RBh1+V35XaFhWDL8yZRs0q9RXTXHdlT0dLZc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DBqI4fqa7jYGNW0KwMMfbO9a7KR1ELmYvkUEtzfj67AAbFcuY1DKWS10tNz2vCi0/
	 pdkEqlAFhsz8FyYkR3FCWctALv2f09Ofw6Cwy+PAzQ+EvF9YDvg8PS+DS9Y0Ou/DfO
	 zb8aD/eitwXiGljtvCDisMfrQtJV7Jsm9kxj2j/h86eQzstK43I+hwQE0aK8KDuk6h
	 PDBtBiYs/zC75N2HMC1IgMN6ofEjAPGWg/J2zk7s6RAT6GB8ZkIWsw2CbzHin/z49w
	 UhWx5g7F9HM6hyT74alA7T8Fi4XFwkLp0TkhxVFdjNZCLcuzhwmKg+5RlP/6EFW3Xw
	 ImggDibAOGCJQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/3] wifi: ath12k: Refactor the hardware recovery
 procedure
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240425090307.3233434-2-quic_periyasa@quicinc.com>
References: <20240425090307.3233434-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171474194939.1512332.8024949318765059348.kvalo@kernel.org>
Date: Fri,  3 May 2024 13:12:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_061238_770642_60D5BCE3 
X-CRM114-Status: UNSURE (   6.02  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Currently, in multi-wiphy models, the recovery handler access mac80211
> HW from the radio/link structure. This will be incorrect for single wiphy
> model, as they will hold multiple link/radio structures. To fix this,
> access mac80211 HW based on the number of hardware in the SoC/chip. This
> approach makes the recovery handler compatible with both multi wiphy and
> single wiphy models.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

ecd509b6f263 wifi: ath12k: Refactor the hardware recovery procedure
9b4e5caaf590 wifi: ath12k: Refactor the hardware state
acaa84009fad wifi: ath12k: Add lock to protect the hardware state

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240425090307.3233434-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


