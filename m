Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B7CEB64D9
	for <ath12k@archiver.kernel.org>; Thu, 15 Jun 2023 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ce+tc28TD5bGfX0q/tqV1qecJDJhMHzAUWSzki7EpqU=; b=y+vj+JLSOtUqpN
	BCi8JlEf8d0CZxJRhvgnnHRTTfFkGPTs4oS3JvgvxjIeqC8GQJqY0ns1uMKERmXiDkMkta0XQyT2P
	C6ELwy3bbVOLGbWIWUvZkHyqx59J67ehvFJZG4i9rV7RKX1XggAQ332sSvnsP+PhUbhD/4N2PRuXI
	oDZkGlg3Epf5MBxjyBJe6uRuS37qK3SewnxUiowgxpJKxbsC6tRa2h14WTxSQYqwWlqZOirDDH1FB
	WySVYwqMZeIyF0TBupK3tAlx6U8QgRKZLBZ5jLpyosM//ag6etDIE9hBxOwcYRLeJu/3RdnnOtiV1
	t8aiGu0Hb6hbaqzT5YNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lTZ-00Em3C-0b
	for ath12k@archiver.kernel.org;
	Thu, 15 Jun 2023 11:49:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lTX-00Em1s-0F
	for ath12k@lists.infradead.org;
	Thu, 15 Jun 2023 11:49:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0FD663BE2;
	Thu, 15 Jun 2023 11:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B777C433C8;
	Thu, 15 Jun 2023 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686829752;
	bh=yEoY0UYvPFrsskPQGds0JJD8CnZfl/Ux/qTTsuDLoW4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tTr/mA3mSeJUybTsonxyUU6aV587ERVxDbeQEilqsOEEswY789CigLYspxHULZqlE
	 nQSkUKi/jgSwe226c4dUft/pztPiaT0MYUhuej9QiWW32P3s/Mup1p85yM8xniYNdc
	 8knzZi7x5hhPwTACQhnILosKeV8Dp1Cwg5Ey/BjXyaMAJL0VF/y97jsC/nJJk9eCXP
	 Oe22117o35zgykQLOqyxWchGW0uoE2u/iMvffjN61noUwL3Q60sI5Ywx7hTKangxBl
	 +dzfcNzmlt7K5s7Jhp9RumneugYINT82IAIfoxdiEET/3nk7QPxJXKx6+rE/zTFFVw
	 fk1ntjDQKyDAw==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,  Wen Gong <quic_wgong@quicinc.com>
Subject: Re: [PATCH v4 03/11] wifi: ath12k: WMI support to process EHT capabilities
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
	<20230602235820.23912-4-quic_alokad@quicinc.com>
Date: Thu, 15 Jun 2023 14:49:08 +0300
In-Reply-To: <20230602235820.23912-4-quic_alokad@quicinc.com> (Aloka Dixit's
	message of "Fri, 2 Jun 2023 16:58:12 -0700")
Message-ID: <87ttv9aqtn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_044915_155860_397785F1 
X-CRM114-Status: GOOD (  11.31  )
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

Aloka Dixit <quic_alokad@quicinc.com> writes:

> Add WMI support to process the EHT capabilities passed by
> the firmware. Add required EHT specific definitions in
> structures ath12k_band_cap and ath12k_wmi_svc_rdy_ext_parse.
>
> For single_pdev chip such as WCN7850, only one pdev is created
> and only one hardware is registered to mac80211. This one pdev
> manages both 2.4 GHz radio and 5 GHz/6 GHz radio.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Co-developed-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Co-developed-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> +struct ath12k_fw_pdev {
> +	u32 pdev_id;
> +	u32 phy_id;
> +	u32 supported_bands;
> +};

So we have now two very similar structures, ath12k_pdev and
ath12k_fw_pdev. It would be good to document above the structs their
purpose. Any ideas what I could add?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
