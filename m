Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF61CE79CE
	for <ath12k@archiver.kernel.org>; Wed, 20 Sep 2023 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6ay5agZ8kbyDc/dklUQBbrWg7kIPF30UqVZ/n97w+Q=; b=WXWAodOyHcslQV
	hZGIUTVOuFva6sNtpT1uQ7NDmlUcS3NRGBSIE+6ejaLmN7p0q7Le60t3FlHPXgWcjfiuXCyq0jkqE
	3yCV6JKFG7O0qoTDmTlzjTEdtQc7zZlXRraj4yb/PgvwEbAnEP/T5liR4q60LO0RHvITZQLyFRTDM
	26Kw0BZ0T9/BrduHBj2LEQDiGQi5Kadw6aohTdwf3VT426dHz6fQiyaDkV/z+zNC6d7mEOFffL4B5
	Quah0AEyRS6Y+A36vTD/jgtJW0LpPlc2Q3dYZFtV3DR4VTFwRonXoUPY4ZMFxju3U0dNcSu9orx6H
	EriEC0U7+WuPU7e/0vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixCA-003AiN-2l
	for ath12k@archiver.kernel.org;
	Wed, 20 Sep 2023 13:24:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixC7-003AhL-2N
	for ath12k@lists.infradead.org;
	Wed, 20 Sep 2023 13:24:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8A3AECE1B4B;
	Wed, 20 Sep 2023 13:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90ADC433C9;
	Wed, 20 Sep 2023 13:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695216279;
	bh=RwL3dL2/nzqtTW9xS47chqHQeFCLtHtSkPRtK73J8UI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=eRDoAeClGwjnXpGQTpftuBnk/x61KsR8isNBmuwdC78r2e6QRu/MTa1L2n599MYCN
	 jHW/gy2U3zlOQ3wKYw7863hcGnKa8IkUVVscgTYoF8PTcUFCmO3fbLNlOk5nFwIui8
	 U10S77ytegjjPXJvgg1586thw2fGgiLgTcCqx775p5cg+/KgwqA43kznnTqSvrSez/
	 7mn8Dt9VXtOSqmCt39wPn0orq/Mt00EGCWFfKgyQ1PaecyTAHf1WR8EmbzrGu0nXJj
	 zDgZAi9Yot2XG5uB2BtEvZ690BR5qrHOV/OBJEeWLtqXHQkyp6LftqC1BimVsfRJkv
	 6YyYLnRJnjaUA==
MIME-Version: 1.0
Subject: Re: [PATCH v3] wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band
 in
 EHT PHY capability for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230828040420.2165-1-quic_wgong@quicinc.com>
References: <20230828040420.2165-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169521627689.1118199.8777112577980679434.kvalo@kernel.org>
Date: Wed, 20 Sep 2023 13:24:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_062443_973290_7CE09B19 
X-CRM114-Status: UNSURE (   7.28  )
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
> After this patch, "iw list" shows 320 MHz support for WCN7850:
> 
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

Patch applied to ath-next branch of ath.git, thanks.

d4e244c85e45 wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band in EHT PHY capability for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230828040420.2165-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
