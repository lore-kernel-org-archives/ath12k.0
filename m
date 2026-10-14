Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592D9CC6B2C
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 20:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OWEw1y+7jiUWTAz/9BEGibbvR7uznEdBfDaaovYCeps=; b=Uj0qSD9ydkg0ixfy6n9pjdYA4s
	QPuVc3OtCCGG0u9ybb40FHsCNC+b9h0RufMt9nvlFathzNcGAjs0o/4o/erOFOkoGqW2Ka3uWm8kj
	KZQ59/sDspWIoiJJDIGWJRvTEgxOdv7Xgkmsa9ajh3igmKlVpKd1qa4XUqAWIAkCkwJojhmv9dIMe
	7oaVlzXdr/zDQjOmcdg990k/Sq36wVBFhglI/XoUZR6yu7p67P6198JLCqKMV5wHjhpgRzjnMFHhO
	Uu7sgRe14C2G6mRp6DkoPjTPlWIvGHi197FV2Zylsep5joHGoQXxxg82VHvTiF55fo+Yw5FfXqluH
	xdNY1UMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5Rw-0000000GFvz-27jn;
	Wed, 14 Oct 2026 20:19:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5Ru-0000000GFvc-35N1
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 20:19:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2882500f8f.2
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 13:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792009180; x=1792613980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWEw1y+7jiUWTAz/9BEGibbvR7uznEdBfDaaovYCeps=;
        b=UVMEDDYHjd2lMbG66P1WyXm4Ux/bLUZy8s6BNCU/yh0dZvCUed96WNkNydWZjr13fY
         Ut0+NQ3PMzf6+z7+BNpjPo727yalw/j8DLnDcLRuK7y30JGqfLm1U64Tk8JbwDwGbbNm
         7UH166cs5mLjktvUN1MyLNr7/jK3wzGeLLRMyqXc2SQSRpD6I94svK0utg3C3M4abeoH
         twV3bqNzjhQ5cg/K2xgNg1HkR7phXBw5XDDqm6vTTDhRhO8xs6WIR80dEIRI2uIjDaZa
         Bu2YvtD+2ylPj9jXPTZov0Ek42AY2PQcvYWBNKoIGlJ2M5vFUqJDS7LIdms+ejqherWB
         NH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792009180; x=1792613980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWEw1y+7jiUWTAz/9BEGibbvR7uznEdBfDaaovYCeps=;
        b=1aMvlb/FbkzjALeX7/Pj8lVm5So9/ocAHx9tN1KzVrIefzkBF6rsnDGb8l2jZaLYde
         SEMlSS7MdSY4Vt0Zv+ozN/OGqwY7HiExmZBrgCHbO6JTYrnc+6KvMb+RNKgAd7x2K7qO
         ZVu4aXH7+9qyVUbc+UJgRT4iZ1YRNr6BzIuZVu9nky+9tsUHk6MOvThxzoJwxSaRa0pS
         AZBW/DuhcpjmQMzL06fwQu+GYYwKYxpn5wE8LyghocaB0jLB776degWQxzT+hEY+oTd+
         LG+XCe6iy2d7WKjc1jUL2CjZZU7SCNG3KwlpSdK87JQ0JXCEZ8olZHaQxmCleAaDcNJ6
         URbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgRW+fsmhYb4UfISFvEn01XKdUbEQ61K2vrhbPjSRozqF8ngM7ZOo0fXm3+qu3r6kdj/ldAXw=@lists.infradead.org
X-Gm-Message-State: AFq9FYL0wpvdoMUQ1HTthHLr3xC9+UQDGI2CdUtqhBnJ31X+ROPoXZzs
	r2PAMPXT6Dtyn8auWOvA5p49qtjqtkktbmc8RQiar4MN8uMG8gCRYb7H
X-Gm-Gg: AYBFou3LonRvIgyM15fUIejSvegdleRWouw/+plEATXVdYug/vMm+2GB7MvRGxm3wOy
	Iyfs53bJUARaVm4oWO/uYyBpx1cRmTcGsKnlM41RciHZlV13iEtqT4Mh4kn0GesHI9ymRj5COJb
	iSvaXKapQfUs8bYC14em4mGDwF0QyGbBOuK5EkfDdFac46/ZvPWGVzkQbRe5RLyi9KZd3jqB4O6
	UaOm9d8rmKMdsXEm3sfwMa+MrZXa12Ctnazo/il3RSBySkPMYHP01jtw/LMlAvOCmeGRBWocOb2
	rWH6dwJhw3O4C+ct7t2xCgsYU4BE2QC1QuuzBdu/4JzVkxjfpLO4WJrII3fwd4yKZMpa0xIvDIW
	zhgVFb4u8sk+WLLEQ4StaW8OxsJuF8a0lsCNmYlnzEY5NiiFU4Xt1lDn/JA0yXKVekPcuwLNEtS
	fb1PocLDh3qdUVVldnCGyjWGNF2HzHhZ0lBwLeEE4QK1OTUSQHT3JqhfpxbW9voubznzV4JVLWY
	k3zefOQVo2FYc2RK6CwNbk+ymg=
X-Received: by 2002:a05:6000:25ee:b0:48b:e50:715a with SMTP id ffacd0b85a97d-48dbace01abmr36901888f8f.34.1792009180027;
        Wed, 14 Oct 2026 13:19:40 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df0f8f624sm2708292f8f.5.2026.10.14.13.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:19:39 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: ath12k: board specific SAR table and coex settings on a devicetree platform (WCN7880)
Date: Wed, 14 Oct 2026 23:19:11 +0300
Message-ID: <20261014201912.4487-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_131942_814784_C876ACB2 
X-CRM114-Status: GOOD (  15.44  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi Jeff,

I am porting mainline to the OnePlus Pad 3 (SM8750, WCN7880 hw2.0 over
PCIe, firmware WLAN.GNG.1.0-03342). Wi-Fi works on a local branch, and I
would like to ask how you want two board specific settings to reach the
firmware before I send anything beyond the WCN7880 support itself. Both
are handled by the vendor stack today, and both are properties of the
board, not of the chip.

1. SAR table selection

The board data of this tablet has SAR V2 tables. The stock user space
always selects one of them per chain (index 6 for both chains): the
vendor driver sends WMI_SAR_LIMITS_CMDID with SAR enabled as V2 and the
table index in each row. Without that selection the firmware runs at
the target and regulatory power of the board data, which is above the
SAR level the device was certified with.

On ACPI laptops ath12k takes the BIOS SAR table from the DSM and sends
WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID. A devicetree board has no such source,
and ath12k has no set_sar_specs, unlike ath11k (enabled for the AHB
WCN6750 in 2023). The limits the device was certified with live in the
board data as table indices, not as dBm values that user space could
hand over through NL80211_CMD_SET_SAR_SPECS.

Which of these would you accept?
  a) a devicetree property of the wifi node with the default SAR V2
     table index, in the spirit of qcom,calibration-variant selecting
     the board data;
  b) set_sar_specs in ath12k as in ath11k, with user space providing
     limits per frequency range (the board would then need its limits
     as dBm values from somewhere else);
  c) something else you have in mind.

On my branch the WMI parts (the SAR capability in the service ready
ext event, the SAR V2 limits command, the SAR2 result event) are
generic; only the index comes from a module parameter for now, which I
do not intend to send.

2. WLAN/Bluetooth coexistence settings

The vendor driver sends WMI_COEX_CONFIG_CMDID per station vdev with the
values of the board's WCNSS_qcom_cfg.ini: tx power while BT is active,
antenna isolation, BT RSSI and interference thresholds, TDD mode. With
none of them sent, A2DP audio drops out on this board while Wi-Fi is
busy on 2.4 GHz; with the stock values it does not.

The command itself is generic, but antenna isolation and the power
limits belong to the board. Would devicetree properties of the wifi node
be acceptable here (ath10k has qcom,coexist-support and
qcom,coexist-gpio-pin), with chip defaults in hw_params otherwise, or
do you prefer another source?

3. A scan observation, in case it is known

With no vdev started, a scan that mixes 2.4 GHz or lower 5 GHz channels
(up to 5330 MHz) with upper 5 GHz or 6 GHz channels does not report the
lower 5 GHz BSSes on this firmware, while the same channels scanned on
their own are found every time. A connection manager at boot then sees
only the 2.4 GHz BSS of a dual band access point. Splitting the scan in
the host works around it, but I would rather not send that. Is this a
known firmware issue, or is there a scan parameter the firmware expects
for this case?

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)

