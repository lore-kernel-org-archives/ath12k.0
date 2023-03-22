Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F9AC6FD1C
	for <ath12k@archiver.kernel.org>; Wed, 22 Mar 2023 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYMb78eRjP4gUwLR8Th/yPc/4WeksJfhRcQrKx4IQDA=; b=XFPRiFdkGZmSCc
	3rZo8tiINCgPJa5v5mlRv23/AKANH2si0HBYkI9WCizuBd3V337BGdcPHWI45XNe+/ehtXI98A70Y
	k5j7eE1PspHjpgHXZy7KfUz+yqpJ2IphEWFBeY/fGOD/iq47yIeCOafWuCC5PWEuRVeEgGh59GYQX
	3K1XlXXLPBdw2AcuQdDW6qNwuV8UUF4ngHOB0Y69TRpDIhwF6EIEwli5SNbB7sR8QK4hkH3fvzX+v
	O1g4vfpXBp4d0SnHrZbXoH8gRU0NYhGR3YHjTMcvRNaOvy1RYN5eTBF3yN6a12C0gLfGGOlJiQrw1
	bCUvCc8CjfdxwPQNOgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pevM1-00FZyz-0b
	for ath12k@archiver.kernel.org;
	Wed, 22 Mar 2023 10:06:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pevLy-00FZxt-0T
	for ath12k@lists.infradead.org;
	Wed, 22 Mar 2023 10:05:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9611061F72;
	Wed, 22 Mar 2023 10:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDD7C433D2;
	Wed, 22 Mar 2023 10:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679479557;
	bh=Twu27M3OjVEot50ANfuewirgwxiZlSiBne6ZVJl4WcU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FF7czHaLiNYmTiSglIMQNVZ6fY2sw8sBtFfiYVbZ9SrYYXbKAcFfGSRyRW5NjIs2t
	 Z22HXvt4egc8v6TsOb9toWkudXingtth44eKIdzi/r+itYxfBOIVZC9bnSIJLunQT0
	 c0i+UNrxhbkwc+/IIuXJfCYkUutHbcj4GaKzCzVyvUDRPYaNEdnoe/1unm5fnd0srq
	 qcXa8Qmfxdo1kCSU+7ojpgvT7FK7plpbPGyMRxMceydGWhKlTHKNap7LJAx1JA8NAj
	 bqTTsQiw1A/vV3hxV0ALl4egK3Qa/8Q+dMInKuMGnyochqvm3InLaIiZbc3HyrOznq
	 gOuL6biYq6VJg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix firmware assert during channel switch
 for
 peer sta
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230315113202.8774-1-quic_aarasahu@quicinc.com>
References: <20230315113202.8774-1-quic_aarasahu@quicinc.com>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>,
 Aaradhana Sahu <quic_aarasahu@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167947955370.29931.1748538574703666695.kvalo@kernel.org>
Date: Wed, 22 Mar 2023 10:05:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_030558_220327_CF835933 
X-CRM114-Status: GOOD (  14.78  )
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

Aaradhana Sahu <quic_aarasahu@quicinc.com> wrote:

> Currently, during change in bandwidth for peer sta, host sends the
> new value of channel width via WMI_PEER_CHWIDTH set peer param command
> alone. This can lead to firmware assert in some scenario since before
> the command, firmware was having value of channel width and its
> corresponding phymode. After the command, host tries to set the new
> value of channel width alone which can become incompatible when compared
> with its phymode.
> 
> For example:
> 
> Bandwidth Upgrade
> ~~~~~~~~~~~~~~~~~~
> After association, sta is in 40 MHz bandwidth in 11ax-HE40 phymode.
> After bandwidth upgrades, sta moves to 80 MHz but as per phymode,
> max bandwidth is still 40 MHz. Hence, firmware assert is seen.
> So in this case first phymode should be moved to 11ax-HE80
> followed by bandwidth change.
> 
> Bandwidth Downgrade
> ~~~~~~~~~~~~~~~~~~
> Similarly, reverse of above is also possible when sta is in 40 MHz
> bandwidth in 11ax-HE40 phymode. Bandwidth should be changed to 20 MHz
> and if host sends phymode first then, phymode will become 11ax-HE20
> and will be incompatible with bandwidth value and hence firmware
> assert will be seen. Hence, in this case first channel width
> should be set followed by phymode.
> 
> Fix this issue by sending WMI set peer param command for phymode as
> well as bandwidth based on the type of bandwidth change i.e upgrade
> or downgrade.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

cbc0008c9b39 wifi: ath12k: fix firmware assert during channel switch for peer sta

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230315113202.8774-1-quic_aarasahu@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
