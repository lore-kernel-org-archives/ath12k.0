Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C78C77B7C
	for <ath12k@archiver.kernel.org>; Fri,  5 May 2023 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sViqlxvn7Zu/x8lJvwbEhYWvMalfn7ZRCVy42M2p+qE=; b=DWT2hvLPVVPap4
	6UQbWaz7rhp/v8TgKyfvwYbwPidUreqEO9ntcnqsP6sqwuamHJPEk/eV4QAfE+65yc/w6k0Khz+L6
	eIHubN/4wQ0MxgxeBFB8VJ64sDSq1Elc4CwpMa90Bw2C0AitxyVbpfeMb5tcothJSE820MuUbVMK2
	ueifE4VeOmBrluZWK2O9yFjPfInz4CbGdeORQXQpiUA7Gkc88MKtPIUYzmGLyxqW+qNCfKz2wD893
	MVrNbw2eNZcc1oMhYRi8/kS+QrJTOBkqERxVCfkyQZh8kve3VpINdUPOIzA8tsDt5jNJtbLHwaamy
	AP0q1+gl5WaTuK6AYyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvzR-00B2sf-34
	for ath12k@archiver.kernel.org;
	Fri, 05 May 2023 14:00:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puuzb-00Aw8V-2l
	for ath12k@lists.infradead.org;
	Fri, 05 May 2023 12:57:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17D2363D08;
	Fri,  5 May 2023 12:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFE0C433D2;
	Fri,  5 May 2023 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683291418;
	bh=LqboN86lk1pQb0m3e4Qf+Jmh3aLEz38XRms+T3U9DV8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jk6xg26/MvKP7C1mM1xoErVGTJPC4g3I1YmMcN5kNDTkZem5jYR/rvU3V01yupBrL
	 Abjz3waGIOI0J5Az2LTcEW7Iuk60pXEnwnthCvSr6I6wtevPPJztFEMG3qjRrrz37H
	 rZQAcuc27pqXmxUsMWMDD6o2LtkrGb41RMPVOfMuFtrmty/o4me5w5sGE1JFLgwSdn
	 3x2ERJ++/RnXKfcf4zzEKRnaTL9hapyBb1/89UneoIqApAMZ84x1bau+/W0lkGfY/Z
	 WbijULaQoa+VVi6FuEQabtPLq2Aut1f2zZJnWOmdlU40saKx/E7p8CJyUpu8wp7wdl
	 JesekotGjS+xQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath12k: add wait operation for tx management
 packets
 for flush from mac80211
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230419095738.19859-1-quic_rgnanase@quicinc.com>
References: <20230419095738.19859-1-quic_rgnanase@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthik M <quic_karm@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168329141362.30600.16864220030105499975.kvalo@kernel.org>
Date: Fri,  5 May 2023 12:56:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_055659_974185_741F2B0C 
X-CRM114-Status: GOOD (  10.38  )
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

> Transmission of management packets are done in a work queue. Sometimes
> the workqueue does not finish Tx immediately, then it lead after the next
> step of vdev delete finished, it start to send the management packet to
> firmware and lead firmware crash.
> 
> ieee80211_set_disassoc() have logic of ieee80211_flush_queues() after
> it send_deauth_disassoc() to ath12k, its purpose is make sure the
> deauth was actually sent, so it need to change ath12k to match the
> purpose of mac80211.
> 
> To address these issues wait for Tx management as well as Tx data packets.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthik M <quic_karm@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

5189a8dba849 wifi: ath12k: add wait operation for tx management packets for flush from mac80211

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230419095738.19859-1-quic_rgnanase@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
