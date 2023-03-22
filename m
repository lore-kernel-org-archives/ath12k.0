Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686FBC6FD1F
	for <ath12k@archiver.kernel.org>; Wed, 22 Mar 2023 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20t/nnxeEOSGDuMXt8mPEkq+rrTfSmjuvMYKF+N6UOs=; b=zAnHqUHlWPzD0m
	XF/KExzPsxJPVdRrbKUqhOr+QLWYNwUWaVdUAxbhebpIwj0/2dlTPZVVYI6XOit+fE+WuOXVyb6hP
	VYXr6+2+GJP088HR2gRcUsQ51Iw4eh0iMBcRAi/vFT7KKO/bd9LvuNxxAaF86464fdV5xSnfJAyIB
	O1d4vkCXybhXvsfQNfBh84nPNBQTwpjNaUDJsmLDC3DrwVjjMMIgwmI79BX/fzmxS+PaAl9cT8CDK
	3DhT9le0YqCuSRCAg3crEye44aOSFWzkg5L9usUnhhc0qJlemg+5XGU999uA9IGwJRyls1dr7DUNp
	m5aShgCPH0C2tjGVG55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pevMN-00Fa2l-0G
	for ath12k@archiver.kernel.org;
	Wed, 22 Mar 2023 10:06:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pevMK-00Fa1v-00
	for ath12k@lists.infradead.org;
	Wed, 22 Mar 2023 10:06:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FC6762003;
	Wed, 22 Mar 2023 10:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40265C433D2;
	Wed, 22 Mar 2023 10:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679479579;
	bh=CsjaIYS2qGvXc8fSVyo4ENm6K5YOcQPAEp8BXkXVdM0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=A0utQ/9PBLEOFiAptg6qkqdK3uZraY0rWphgly/ewcl+wL//YoZ97+MNsMcz+OYbX
	 jeR5iRCYDil1WCvMhUSCEwvRxTq8IoO9tlOgA5Qt45T/DDowolVZ2zJ5LSyDKd4nPh
	 qIhQJaWGbPw11BQN+Q/glqhmjjLz6p6vWdCkKTuMHUujJJ7agR1/on+dmteedR4jnr
	 GhHQD5PdG+Ycb4gOFbGxOv/AvRiWIVgClMrtG6dWXN3r6dbIbtjJV4ckuLOcBPBhhv
	 UDphR+uhwm5t7y0kgZ/0zs8dgzsZFdinol8l7GYfxX5ms5e2K61383tVYKqmkTkTg+
	 CS8baoRcAGyow==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Identify DFS channel when sending scan
 channel
 list command
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230316041144.7770-1-quic_bqiang@quicinc.com>
References: <20230316041144.7770-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167947957332.29931.14263672557733620301.kvalo@kernel.org>
Date: Wed, 22 Mar 2023 10:06:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_030620_080168_F368D049 
X-CRM114-Status: UNSURE (   9.02  )
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

> WMI_CHAN_INFO_DFS flag should be set when configuring a DFS channel
> included in scan channel list. Without it, firmware will not send a
> probe request frame which is needed in connection to an AP configured
> with hidden SSID/network_id. So fix this to allow probe request frames
> to be sent in cases where a beacon frame has been seen on the channel
> first.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4c26033d75e4 wifi: ath12k: Identify DFS channel when sending scan channel list command

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230316041144.7770-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
