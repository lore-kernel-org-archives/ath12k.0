Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1DEC7EE2E
	for <ath12k@archiver.kernel.org>; Tue, 30 May 2023 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Lj1FBNkNt6t3ibfGVqsYWrXP7i4pWRlepE6ouxqWI0=; b=nN362HQTdXymzR
	ocSJPYxE/H9ePdHkbImEwgL6GyXSords31KW/bEOlovhCDUe6bZOJgV5H5WOhaumwv9B/5CdbAjov
	yX/gjDChkNgWAL8xoVVOVcF5VqLqINwiIxgqAmb+3OvrsdeY7bucxs4h9JpjXd3/H8sao8Jr5vRwN
	RgQpzjdokPUAR0GmU8Jee9QT1ieARtmdCqmONuyEh7NYLVNPqVVfD4gYuiBZinzRnMk1bYtPSoZQo
	nYM2a5esridXez3X8/6qHuyxvwJv5KQJFECd2sKGB/u2C7QFhJoTZ2JqcNeAkK/W92AG7uTuyVs3i
	G0zDSdbGxiPS5OpvSOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3skz-00CZ0T-1j
	for ath12k@archiver.kernel.org;
	Tue, 30 May 2023 06:22:57 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3skw-00CYzZ-1h;
	Tue, 30 May 2023 06:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
	:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XSDebSB19oA+MAG3fUqSU9st5hGlMUaKZomFXQkj8bQ=; b=YMImdWrUu2aDReyNZtLXpB54Kk
	v1V1iaz9LXAL6jIDg7iIP2MLG6I9EZxMEqmxSHtwXqtEgm79oPgihC51IsJTPgi0wEH7jjFbZXMmK
	KymQMz9B3RcEYtx41OSunnc5/SVEFBLvAtf//HXRk37oVPNR+2w054Neu4fha0KDNBT4=;
Received: from p200300da7708b3c00512399822b48468.dip0.t-ipconnect.de ([2003:da:7708:b3c0:512:3998:22b4:8468] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1q3skY-00GyzG-PZ; Tue, 30 May 2023 08:22:30 +0200
Message-ID: <1502188c-c527-3038-2163-5ca4f51ed735@nbd.name>
Date: Tue, 30 May 2023 08:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, kvalo@kernel.org, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Mario.Limonciello@amd.com, Lijo.Lazar@amd.com
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org
References: <20230530024227.2139632-1-evan.quan@amd.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 0/9] Support Wifi RFI interference mitigation feature
In-Reply-To: <20230530024227.2139632-1-evan.quan@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_232254_664905_D0E3CFC1 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 30.05.23 04:42, Evan Quan wrote:
> Due to electrical and mechanical constraints in certain platform designs there may
> be likely interference of relatively high-powered harmonics of the (G-)DDR memory
> clocks with local radio module frequency bands used by Wifi 6/6e/7. To mitigate
> possible RFI interference producers can advertise the frequencies in use and
> consumers can use this information to avoid using these frequencies for
> sensitive features.
> 
> The whole patch set is based on 6.4-rc3. With some brief introductions as below:
> Patch1:     Core ACPI interfaces needed to support WBRF feature.
> Patch2 - 4: Enable WBRF support for some Mediatek and Qualcomm wifi drivers.
> Patch5 - 9: Enable WBRF support for AMD graphics driver.
> 
> Anson Tsao (1):
>    wifi: ath11k: Add support to the Qualcomm ath11k for ACPI WBRF
> 
> Evan Quan (6):
>    wifi: ath12k: Add support to the Qualcomm ath12k for ACPI WBRF
>    drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
>    drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
>    drm/amd/pm: add flood detection for wbrf events
>    drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
>    drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7
> 
> Mario Limonciello (2):
>    drivers/acpi: Add support for Wifi band RF mitigations
>    mt76: Add support to the Mediatek MT7921 for ACPI WBRF
Wouldn't it make more sense to put this in mac80211 or cfg80211 instead 
of duplicating the logic in different drivers?

- Felix


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
