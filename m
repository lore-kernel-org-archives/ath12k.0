Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C206C6FD1F
	for <ath12k@archiver.kernel.org>; Wed, 22 Mar 2023 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRK10vigm6FQPLTIX8XteILkTgR+F2yW+AZs0bg1UgY=; b=q7yEWL6UnU3eq+
	JQLON6bRXtoV+0yZNdGOjtlp1wPQFWChkpaTd0aVwhI3hsSgpHWchL/emJXFemwYcfh+98KX2ZkPE
	RA7GbtTWbAryT0EcU9a3uwV/gM54p1gPByk1GMIheE60ZWJiwejEYNxhst8fhmSiFz6EstkSICYLB
	Xl2w2W2g0ZKaWuB+JH4/4j+v3pAB7L6aF5MbfOHXnu3EzC4NdWOL8VBv6P19TalJKtHQQg+2mr0pS
	xPJYzf7a/AzSVqCKh3y+Xw5DAR7PCtzjGPEV19J07spHTM7VZRc3GgCYw26tl0mWH7UzBBovlZkSJ
	l/mhy2KUkpK1xNGD/kSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pevN3-00FaCZ-11
	for ath12k@archiver.kernel.org;
	Wed, 22 Mar 2023 10:07:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pevMx-00FaAx-2d
	for ath12k@lists.infradead.org;
	Wed, 22 Mar 2023 10:07:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B72F61FCE;
	Wed, 22 Mar 2023 10:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12A7C433D2;
	Wed, 22 Mar 2023 10:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679479618;
	bh=wCJnJTR4oGvE/EPFhoBPtcrLE7Op0BsLuBzqdLDvQ2s=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=tQK2RFOGRqNNHlCUenv/YgvqIPKllJ7OFCJKHUo40E63fWJ5A7e1WWtO+D2WUywUg
	 YZPRk6wyqYgJ96D2+QU4IMrI1fTmQjBZvILaWFXAX4GFeEbfFsEHhk/pAUdkMimoI3
	 N8dZFl9KjHAByKAIWkivqe3R3nE3sUjjSRPYj4jliYtYUQup9C8sUpE367Flp2PNpB
	 nknEQUu3ielxbTTMaiZDT02C7nExxDCm4W+iXVUtQTA1319SyRvYlUvmNa6F2+EHQn
	 pfOV7YzoFNsut2mQW0Venry6hcouwPE0+NmG6+kkCNj5ovRwxrJGxp0C+UJcnHdtrd
	 4aJsYWVITRVQg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Enable IMPS for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230317062533.18240-1-quic_bqiang@quicinc.com>
References: <20230317062533.18240-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167947961588.29931.6965015392105440936.kvalo@kernel.org>
Date: Wed, 22 Mar 2023 10:06:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_030659_898733_68D4FCBE 
X-CRM114-Status: UNSURE (   6.20  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> To reduce power consumption, change idle_ps to true to enable
> Idle Mode Power Save (IMPS) for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

72d17c3e86d0 wifi: ath12k: Enable IMPS for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230317062533.18240-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
