Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4618CC7EE43
	for <ath12k@archiver.kernel.org>; Fri,  9 Jun 2023 13:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krI0yFvz4Op4C7lrc/IOTijSVk8/Gkj4k+4b3Hk7J+o=; b=gkrpvXcnO2Ao/8
	MLS34ywuO93SNt7YQoK8iN+ELqtEQ0L0ZdMNqg49eIhWNiu4HDMk4c5DCClNZTEa0iIpv9ydvk1zr
	jbL8cLSdCLOLfa1JnC7W3F6GDRAYwTwUCY8uWE6vrDyiqmumdGfe66JJLY1Zh4RJioDK6lndgcIeA
	wVh/t9d9F5RXGzwYsgBmLbVjwXGN7DupANMemZ6aSJJ4czaQ/8AyK2cqqkfpRFrRihNeEn4EtAJjh
	VRexQKtBYgHXlkUC08peSuxAZsIVvBcpKQFkz7sthPxg9YyYZPlZRmwtG9/ZwhiJn4sF/0+W4TUGr
	Vi9NuLR271t+RTGb/fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cEa-00D8ec-2z
	for ath12k@archiver.kernel.org;
	Fri, 09 Jun 2023 13:32:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cEX-00D8eF-2R
	for ath12k@lists.infradead.org;
	Fri, 09 Jun 2023 13:32:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53E2365198;
	Fri,  9 Jun 2023 13:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AE4C433EF;
	Fri,  9 Jun 2023 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686317572;
	bh=WD1Ur85G/JkD3hVnsGbmyDe3nGLBZlleJ8E5RPUG/lE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=CguK+VEmiDE3jCdXAnFGucO0hr4RaokR/pDyCqb568waQsf9DJAPzz2IPZf1pGDCc
	 8l8u+DnEww/ghavAk0Lf3MvSz+a3aZFdcR1UAj7v4rQQAYZrs9/zHiwMJDLDegFdgA
	 kQSCFJPaGW/7wg/eT+p7J5PJjV5rK1U2oNguqf0wcu/8Tk0fuagZ3dKWaLCYpDvaQi
	 H0TWwLAceasUqvfsCn9Vw2suTCteSZnbeyrv+24q+jxTf8Y0RdIDwx5yQSwDTWrEbr
	 iOfdlpn6QrC8Tx0MbrpqdcaTa36qdTUVeWtonOOhKz5+xF14SGcuOfZ+AIfcQPVhCH
	 x5HDh2jF9j4JQ==
MIME-Version: 1.0
Subject: Re: [PATCH v3] wifi: ath12k: Use msdu_end to check MCBC
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230529081609.34567-1-quic_bqiang@quicinc.com>
References: <20230529081609.34567-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168631757013.7235.1908290827588270825.kvalo@kernel.org>
Date: Fri,  9 Jun 2023 13:32:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_063253_853977_78B7E8DA 
X-CRM114-Status: UNSURE (   8.40  )
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

> We are seeing a very low TCP throughput testing with some specific
> tools. This is because for sub-frames of an AMSDU, MCBC flag in
> mpdu_start may be not valid, and as a result those frames would be
> dropped by kernel.
> 
> Add a new helper to get it from msdu_end. Also clean up original
> helper since it is not needed any more.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8f04852e90cb wifi: ath12k: Use msdu_end to check MCBC

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230529081609.34567-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
