Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E34C3DA6F
	for <ath12k@archiver.kernel.org>; Fri, 25 Aug 2023 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyrNitYppLhXyBAlBAY7+a7goJOUaFUj76EEoCVDT7Y=; b=QOFZ5LCgNdDh9U
	8Rk55WVUI6Xw+3tixbzkqlXVppNIE5bDi0bwGyPi1R9RYDIc+hU6VknyMbJl95OoeI2K7mpTin4Ou
	11WVwwwCdzEeVOKvzUlCJ5Kr4pr70AsNtBBNvDSRB1MleHVkBCRtJqZS7kUhBGscys/dJN00jefZ8
	kI9m6zOJsxD6J1Q71b7yxfHVowJnnmP1hQMG0eMWydHiIcy5W92OrXMEO14bzoPfhyTpQnXZE5I8Y
	EkCvsC7lZNCuFzvcOcYwMg3x5fSgFihqQNG7WJPAyusuo3bdCjoTmNQ/pyaCXD7ED86tXa40/pZS3
	aS5aw7646rprwA2oSrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRde-004Zvw-25
	for ath12k@archiver.kernel.org;
	Fri, 25 Aug 2023 07:53:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRdb-004Zuy-2u
	for ath12k@lists.infradead.org;
	Fri, 25 Aug 2023 07:53:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 39F2C63B8F;
	Fri, 25 Aug 2023 07:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0ECC433C7;
	Fri, 25 Aug 2023 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692950026;
	bh=KOzRnaC44+Xlhg47OtXM9sPc7szh93iPq2k6FzlXDMI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mXhm/f1FO8Tc7xtH021mtnaY7iM//JOkkg/jY194PRLKCjVar6RkJwMRGXfWXVO/a
	 Ky4ot7sM/jn2dzIxdvApbK+dzO4D4Rwz5WM14Q9yZO4pb+qaOI4rniLhqYnyLPEO+1
	 vyOndbP2p/6jWVgcqDujuW+gbR2S7TDelFnK7R0nBx7apYNlD4sLySfKRkVk3Mg9T5
	 YYnm8GMX8nuvutG2FuyiWRmS6DdNxVDDDeByp2ckML1dK6glcA4VhyMCYpajtXzE1y
	 QppNiHpWJkXNa8xOJdUjzmZgGLZrCH5hCgQ3hmOdC4DY0pzVMBtFwA/LW6HfoQzTvX
	 aiUK60dmJ49Eg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band
 in
 EHT PHY capbility for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230824025432.19406-1-quic_wgong@quicinc.com>
References: <20230824025432.19406-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169295002356.1753110.7150166655358699685.kvalo@kernel.org>
Date: Fri, 25 Aug 2023 07:53:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_005347_979613_BB34E066 
X-CRM114-Status: UNSURE (   7.17  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> 320 MHz bandwidth is reported only for single PHY mode for WCN7850, get it
> from WMI_HOST_HW_MODE_SINGLE ath12k_wmi_caps_ext_params and report it for
> 6 GHz band.
> 
> After this patch, "iw list" show 320MHz support for WCN7850:
> EHT Iftypes: managed
>         EHT PHY Capabilities: (0xe26f090010768800):
>                 320MHz in 6GHz Supported
>         EHT bw=320 MHz, max NSS for MCS 8-9: Rx=0, Tx=0
>         EHT bw=320 MHz, max NSS for MCS 10-11: Rx=0, Tx=0
>         EHT bw=320 MHz, max NSS for MCS 12-13: Rx=0, Tx=0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

New warning:

drivers/net/wireless/ath/ath12k/wmi.c:4199:69: warning: restricted __le32 degrades to integer

Remember to ALWAYS run ath12k-check.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230824025432.19406-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
