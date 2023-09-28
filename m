Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68860E732E2
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKZw8CfToF2h3kKzVqOwkiIwjSBYvq8ZbLC8vyv+e5M=; b=EwY1WHbrSEfOdq
	Mc7qARsEt6gsqFIAZA0jGA/73JZd2/jsc3cstjqjmxeGJZcB41C/rdXn3YIhptJD9zl01TYmum7O/
	ncVO5c5vbFIv6YO8SXVfopCBI6jKMl8m0ZUFHBGztvsDGD0bzLqrNsk9CfnyY2OfNG9CP5Nlgpwxm
	Oiuz0PvFLrvrYgiHJaEUXyHZxZsI2UdTZllfEfIZkCY08Yvn5mxe5zAbNBsiEeDRdTON0Ic1+pydH
	JwN1QL/M8DyXfZ5xWeXK+O/9mJj6M7ffdQnBCgDEt61Nl4pff6iWNiXSZrQ3hn6Nj9XmMYZG3E9am
	0lj43ihUjW7IXmcezoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsZk-005Cw1-0C
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 15:05:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsZf-005Csq-36
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 15:05:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8E0A1B81BE9;
	Thu, 28 Sep 2023 15:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083D4C433C8;
	Thu, 28 Sep 2023 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913505;
	bh=70kQOEUrDVTP7ywr5KzsufrCQtknfZXRqKz7L88PkyY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=VL2s/o0bK6r4lu2bu8vm/ROSWfrWcitdFUtt3v1R9J/xU6Uqa4J2iCjaIYEc1x4xv
	 y5QtZKaCap0zBqouiLid5wubswI1owrrsajKdCpL6VY9/4sfxbS1SN6ixxELmpwHtR
	 HRqEA1Al7EyWrMz0GcCWKE7YRc5NZCFTm1GNTEqvR5bj+/vq4n3I7K8md8WTIrSS3J
	 APu9F6kRa5+QYmuB7sse7ils6g6/N2hflyB3DkDC30T9jLSefaMGhKq2YD1x/W4hpn
	 vcP7aHvvME5QHkcW09GcUgHkpIk5wTDqH5BaQf8vTf+8/lu+okYUudvakoGSSPl+wJ
	 v/jJC6HycK2Bw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: indicate scan complete for scan canceled
 when
 scan running
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230906085746.18968-1-quic_wgong@quicinc.com>
References: <20230906085746.18968-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591350295.3019228.15462824983218170799.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:05:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_080508_151426_BCF5395D 
X-CRM114-Status: GOOD (  11.97  )
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

> ath12k prints "Received scan event for unknown vdev" when doing the
> following test:
> 1. trigger scan
> 2. wait 0.2 second
> 3. iw reg set is issued or 11d scan complete event is sent from firmware
> 
> Reason is:
> When iw reg set is issues or the 11d scan complete event is received, the
> new country code will be set to the firmware, and the new regdomain info
> indicated to ath12k, then the new channel list will be sent to the firmware.
> The firmware will cancel the current scan after receiving WMI_SCAN_CHAN_LIST_CMDID
> which is used for the new channel list, and the state of ath12k is
> ATH12K_SCAN_RUNNING, then ath12k_get_ar_on_scan_abort() returns NULL and
> ath12k_scan_event() returns at this point and does not indicate scan
> completion to mac80211.
> 
> Indicate scan completion to mac80211 and get rid of the "Received scan
> event for unknown vdev" print for the above case.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

870c6a72739c wifi: ath12k: indicate scan complete for scan canceled when scan running

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230906085746.18968-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
