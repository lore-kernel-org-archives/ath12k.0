Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3D1C48BC3
	for <ath12k@archiver.kernel.org>; Tue, 20 Feb 2024 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-Id:
	Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VE1b7+Zs1sAYzLfGxr5znkkGcQFqRIY7wI1kANXm/Uw=; b=QGVQzOcuPzVD3qCjGuDcPrRQN6
	y0buNurJo/Kz/U+LV2rxIxVytvJrwb4LnHcZrFfUprfYkt1dR/u3fjwYWpg6NZpSkC7pwWILweWcw
	PWvevhHkg4kAKxGEnWpWMsC3nHDhb2xbmSXZq8PFEgAb1k/mS5a15MYfyyrTAlNcH/gD7WyjfEubq
	Wd9qgmTL0axx6eNRrVprR7yckdBUzu/8v6TCm3xtGaWFPLIF0pXB+0j7WO8uyEe7JLBYkwje1rUPm
	oID0qXIIUVGiAIv6h13ZSP8011FUVWp61fbbajyCLQUP90UXSlaTltaWunPPq7Pa8RH3XG8evPfbO
	7OuTSyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTej-0000000FaFy-0Pro
	for ath12k@archiver.kernel.org;
	Tue, 20 Feb 2024 17:11:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTef-0000000FaEd-12n9;
	Tue, 20 Feb 2024 17:11:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-41272d42207so1479955e9.2;
        Tue, 20 Feb 2024 09:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708449098; x=1709053898; darn=lists.infradead.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VE1b7+Zs1sAYzLfGxr5znkkGcQFqRIY7wI1kANXm/Uw=;
        b=jCEU4slOQdpSAGbW3PNav0Xu8M6RfMo1uuoT1f8XwYKNMDQeKXCSLo7+4DODQ42hQb
         IpqkW2kfW9ScUw9607sQTjlWNVZUB891B+7sDtz80MDnAjtJiNN7NSLvlSIlpp0Qgetd
         TADofxUNYzXtEDaSp5wJddsFFm8fgQ3IszlJQm3mYn7sWYTD6VO2Oyc4TmcD7N6gX8fa
         KQRUuEcBvwKHAuT+NGir0HOCLCfr38ffEm55bB10+W+cxR7WXcEqYeY+WflLzi7Nufdo
         rOCEQ2C+dJra1UNAr5qF+A6VduFNYzjUKaj0vT5fGW3Areh5KvTooFqwpHiZi99d7ckO
         zASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708449098; x=1709053898;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VE1b7+Zs1sAYzLfGxr5znkkGcQFqRIY7wI1kANXm/Uw=;
        b=X+ajDRQvJgAUUQZTP8LRNHNMuEW7FdB5xWqcmP1vyBgEyuc5xgZLzooK8+AJSlj3dG
         zS+U6FPYmIr5mljqSMnQLu9agiqVzTVriOlUoZt0HFTlP45/nZyOirycO3zXUB80+FN9
         WfGb4J47R33yxhAMflHJyhJGY4it57fE6kJ4PgeRfvt4dHYL0S2uo5D8kxzzrjpFLBbV
         BkRd066aNtQVk3Fj9OydjEQPCxzVInuw/L3jZXabSuDE4XQOhRwTFqSGwyVS4fvPdG44
         ipyZBm1QIwUN7ZoZ4Ue0ro8lP8LY75gpSOeW7tKAuS4LpRH75mV0olj9UcnbbsQ40TCN
         svyA==
X-Forwarded-Encrypted: i=1; AJvYcCWKHtrDj/Z+xNaeKxG8VHKwG6l7gtDScOQL0ONYYYSPwhGMUiL2qDjSo7/3Rc9O9EVmTFSfX7j2F/blxl5uN9MxJcUBmZJ0/4WlCg==
X-Gm-Message-State: AOJu0Yxg17GQqx9vHS6416+C88DD2Xo6EpyE1o7crFTvtiTrGeG2qzap
	+Pa/wR/8XqMKwkdarJZyuiGK/GvbCuaEQ8u9P2U3QU9cBcYaoYcTWyPC/HJ4
X-Google-Smtp-Source: AGHT+IGELZLv6VyK0+cuniAr5wftu3t4c8qApMtycEcTK4QnkiGkja/d6yCvpkEkOF8hXELu+eTCSQ==
X-Received: by 2002:a05:600c:68d0:b0:411:3673:1c6d with SMTP id jd16-20020a05600c68d000b0041136731c6dmr13346859wmb.37.1708449097893;
        Tue, 20 Feb 2024 09:11:37 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id k10-20020a7bc40a000000b004101f27737asm15116765wmi.29.2024.02.20.09.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 09:11:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Feb 2024 18:11:37 +0100
Message-Id: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
Subject: ath12k & ath11k beacon miss detection
From: "Nicolas Escande" <nico.escande@gmail.com>
To: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_091141_322050_2A319C59 
X-CRM114-Status: GOOD (  13.29  )
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

Hi there,

I found that when using QCN9274 iun station mode, we never get disconnected=
 from
the AP even if it stops beaconning. Using iw I can see the "inactive time"
increasing without supplicant ever getting a beacon miss event.

From what I gathered, given we set the flag CONNECTION_MONITOR using
ieee80211_hw_set in __ath12k_mac_register (mac.c) we should detect the
connection loss and call ieee80211_connection_loss() at some point. Right n=
ow,
there is no such mecanism in ath12k.

So looking at ath11k code I found out that in that driver we have a specifi=
c
WMI event "WMI_ROAM_EVENTID" that can report a WMI_ROAM_REASON_BEACON_MISS =
that
in turn ends up calling ieee80211_beacon_loss after some time.

But trying ath11k & qcn9074 in station mode yielded the same result, we nev=
er
get the roam event and never get disconnected either.

So going back to ath10k this time, the code isn't exactly the same but even=
 then
we had the same wmi event, with the same WMI_ROAM_REASON_BEACON_MISS and we=
'd
call ath10k_mac_handle_beacon_miss which in turn ends up calling
ieee80211_beacon_loss via a work item.

And using ath10k on qca9888 works well for me.

So I have a few questions:
  - is this supposed to work on ath11k ? Does it not work for me specifical=
ly
    because of my chipset ? Or are we missing some wmi config ?
  - as the code to handle the roam event is missing/commented out in ath12k=
 will
    it be a different mecanism to detect connection loss ? Or it'll be the =
same
    and you guys just did not have time yet to tackle this ?

I'm happy to add the missing code to fix that use case in both drivers but =
I'll
need some insight from you ath folks on this.

Thanks =20

