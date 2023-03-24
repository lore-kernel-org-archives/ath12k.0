Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E403C77B60
	for <ath12k@archiver.kernel.org>; Fri, 24 Mar 2023 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vv7jWR7yvJ9emrXUiaSZrB3C/GP10P1cC9GM3/iHrqs=; b=Fag5lf7GZgEmYK
	aobMJCi1kjDliZuk8a2NZ8GRXuhinZW2w9E56PozUMsSn0mL2H+Xueaxv+vwaE7PXrtN8MWjgx4Sk
	lSQsQBaCnPN/z80nbe49oGEE+/KHV55xwLxyEHRX8QiQfSORLXD0hbL3kG7AnOs9et2EUMVEdob0R
	fx6AqcC9T/WctnPpBs11x9Wql+KhqA2WrZASG8H34PymXBnwD6/B060l6owHwwgm2hiDBe20bZpLW
	3Ow6b3RX4Mvdc8/wcbA2bl4CNhN77a+56rzRx64LbEWe4fszjU0+03kA9zOxB4R8prme5faIxp4w6
	unnM9Gd71a4k9F7GdGng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfiiT-004hFt-2T
	for ath12k@archiver.kernel.org;
	Fri, 24 Mar 2023 14:48:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfiiE-004h6k-2j
	for ath12k@lists.infradead.org;
	Fri, 24 Mar 2023 14:48:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 048F862B49;
	Fri, 24 Mar 2023 14:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C8FC433EF;
	Fri, 24 Mar 2023 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679669293;
	bh=59V+XprMe1CK/peoI3vFhJIIr76W6/AmLfObBg/sjeM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ctDUN9XqTxC+6uAQ+l3dhP49/uqU8qVfj+v/BdGugUoZMF42d1gAVLHZihNESnCuW
	 SCN5IH0sQki214HCYV0t7/YbCv3tNUT/mRIW67+tTSaxX4NEse6JvWBuoVdw+ZgvNq
	 xomxSMwKzgMHZYCVXjSCh0vhVK/OwU2n5T+mmT0AI4AIcZ91YqUalQfq68S07/2cB6
	 wZukIsiPVKb1ik3XmzCItwuzwV9VPK+6KFD2BATyNvnMJzN1HupWwBenilRkvUVqVb
	 8B9o5yUH1YO8McGy5n9bPRYlo+gX06s6IiMerHU3Gpns93qanCiLqxs6oweVxmnIut
	 yfP3pqn4W+QaQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fill peer meta data during reo_reinject
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230317162056.20353-1-quic_mdharane@quicinc.com>
References: <20230317162056.20353-1-quic_mdharane@quicinc.com>
To: Manish Dharanenthiran <quic_mdharane@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Manish Dharanenthiran <quic_mdharane@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167966928962.27260.2628983691559791238.kvalo@kernel.org>
Date: Fri, 24 Mar 2023 14:48:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_074814_922070_F0DC62C9 
X-CRM114-Status: UNSURE (   8.63  )
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

> Firmware expects physical address in the reo entrance ring when MLO is
> enabled and peer meta data in the queue_addr_lo for the non MLO cases.
> Current implementation fills the physical address for the non MLO cases
> and firmware decodes it differently which leads to SOC CSR region
> access which is not related to firmware/MAC operation.
> 
> Fix this by sending only peer_meta data and destination indication bit
> during non MLO case. This prevents firmware from invalid decoding.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Manish Dharanenthiran <quic_mdharane@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4b50d4205207 wifi: ath12k: fill peer meta data during reo_reinject

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230317162056.20353-1-quic_mdharane@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
