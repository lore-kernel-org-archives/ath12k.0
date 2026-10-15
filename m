Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC05CC6B3A
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVb3fHhqwqqeu00xfzg/DJoG7nkrhX4cn5MUR8Ocoj0=; b=S4bsmghwsWoC1QcknUdxLx/QGl
	6QEEQPvNtgfsnvhGwaxXt5kPrs8PneX66lBjejg7BxTCfYxmXKD6X5KAut0/JixDRzMzh0vsGqCgE
	Yb9Y224fEkz7jlEpLIHXhAQ8NyS06OFfKDjEJVmc2aGauacqx/Kz/3eQLAIaGbruDitcCL0EME6wj
	FVF05tlSjuQ+yuYTptQjEVMONEtZ5MSF+AMmlzFwnjjSj5gOOc2tPb+diSCJYjvlOQf7gObMW/zCd
	D4T/5N+5wilLFr6xnQkp+JTphEHNfy2O1LkwHy00gUMBT4WJaZY6egk++AtsBczpXb69X0rsK3KIW
	cpuJqR3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNuF-00000000duh-2qQX;
	Thu, 15 Oct 2026 16:02:11 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNuB-00000000dsS-17yq
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 16:02:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c34bff61551so757873066b.2
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 09:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792080125; cv=none;
        d=google.com; s=arc-20260327;
        b=bPXzLlHYp4mJy3t4NvAthRkpojOVt1bfMk9zG1Ol7Gex03/MHEzOMseFes7KNTsBMn
         e6ou+HAC+8cmVcP+9Zv7UU0RPHxXBZXzF5FGEwHEGwdNaHdqPUSV82CS0HSZlarnGKXq
         0fI4k/K1EERNIoHIvoallksPBoZTvXF4GhF6LE5pPSdEtuOaQuGzN/W8Y0VDksiZyhJc
         YEy0r9vZ8f76S/aF8Wbod7bmCjl0sy7Bv0MwzI5YxyjygFXN6np1iT4KKmjllBYpeGkQ
         raNlJMLHsGmXntZZordMW1hvs3Xx356vlHb2gVHGfTdO9rmsORuzZE8DuK9xjgNLEeuD
         Arxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EVb3fHhqwqqeu00xfzg/DJoG7nkrhX4cn5MUR8Ocoj0=;
        fh=WL+6QfM/ABIOPapIgG5bRVDqRmsGqFKq8RdgTIhXZ1I=;
        b=GBstgeXaZ+Wrmpk/jsBerWnWRup9nYgULQ/VsK6pvdUlxZ3yXu1nB+J/jWlOMydM4h
         rWiFf/hNJn8aEdf00G4A2Dhxl6zO0KQ3ZxEANtj/CBGEXswUPyy6MfVC6B8jqE5g+AYS
         5Vo3hI8e6Fgaw37eZDWR8bADsaiQaYBHCpdji+Z1z8AcRkoTw2nrBnq2/e6KyaDhAWfK
         BxxL+F7I+dNrzsO78eEp+n0qhlRYKV/Zna9Y9iDqk4zviZEOh79DrtdnMWajCMDKEdyD
         7iIeQwHQakvpDTTBVlc1N3hPgu8F2s44J98e7ULJFPI8de3kBYFyOPuKw2mHNW3OHPSL
         96lA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792080125; x=1792684925; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVb3fHhqwqqeu00xfzg/DJoG7nkrhX4cn5MUR8Ocoj0=;
        b=LWakrOC16NEryqMxTY5ajK+6fUmczGcNmjFKhFGjJHDO4y9mF1VTq8BjwhcYrZ/ICE
         aByMsA2ZqAVhPmKxu/i5MF8/JcdTB+B4Tsw8n1FTcF1zxD4afoyk6GQJQQyABV3Zxyku
         JzK0k3hEqbfxvD2IkkxaAK5TpPfLqIl7gSx3GkEIaMLVc8/6N9hVeGSKsJrGma11luqz
         KjtQ+WlzI4g/cwcjgf+3MxtA+brWFxrUGRz40OtC1Izql/+gawulL/x8ZjMk7YBHF6QV
         LyxOW6LvULdYPOH6IZhZ/+4Nq72jnSF6cCn97Sjbt8+Epb2QmJec/eD427HSq+9QgCkB
         ETbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080125; x=1792684925;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EVb3fHhqwqqeu00xfzg/DJoG7nkrhX4cn5MUR8Ocoj0=;
        b=ROFSZgsfQiEBnDX/Jj6gWNJ4PbD0jYkR2S/WWvOZqP1CxyqOX+YUs5vxhrgCuq4Ycr
         ezO6bdo7cA4E7gCOnVLlno3HJWZHsIR0ok1kLHKjq2/82tNTdPwGHQ3OW34+lneQ5+Xm
         btlfpU9hdx7KLVS/bRZMXaFGuihyyQR9rKFU8R3LeA+t5mY6pdHVgjmIT66OgKH1W8jo
         2SL4k7XbkP7sF2+PAmoW+AptJA5ZWTdqWqdlwycKK+7uwvBBojFTkzDS0n6OPBTdW6kz
         WdNkAFlkWOGYUvURwEPkQNzd6SFv/r71bbtXzn+s9ZXodO4K2ZA7GzPuGGkNHqcFiIPY
         tpoQ==
X-Forwarded-Encrypted: i=1; AKwUvByyEa0vu/azOIkHiWKD8QIYGHvLUxufJkSL1/xxcLqWdMoOYvjof1XhkswXaZ2zLDsIO3kaZcA=@lists.infradead.org
X-Gm-Message-State: AFq9FYIqWvPTvhoEwH2ZtBVmK1y6vnJgCziXRjnBWBBiK9m3mOjh7a8T
	TaOEYXSe4XBwkZ9W+Qe62UDjom7KyzHAuFTvDrobSXFljUPi5BkJSG2/TV0SkocGIif9BVoauB/
	pcoB68U1qWsKJY6mdw22dB07ijAg4/mQ=
X-Gm-Gg: AYBFou1gIEbAdbYKmfNbGlx/T5at0bh6MkPLjyxsbNPINbhLUhGtkrmcGtp8Gsy3rGb
	jLDefKsCoSQR3mo57smuWkj3x6TeE6+I+ttmCIHkv2VWgPScULus9LMJsVy9sUNF4WDLQCyhV+t
	Mj4Tn7XUjbkjAeTzdHF9Y3AFJckvj8kkr3zoT/4IZN98h+wtbKVWACxpNzJhvR4y/LS2fnh5etA
	OOKxGOhXtYZ/E/sjbW5/0LuVu3aD+9hYHrazfnB5OJ8jDUCyPTsuH29jn/Kct6Py3/ZUyPYMaZG
	ZM7mokBC37/BqKqeUQ9TzghFXcx4RrADP/u1XwH8hk6yWkNXNZw2qMTM0584sVmeAeSxi0lmjWS
	rJsK8GgwV/725pWptxLOv2pcfeprURqBNGoY9+Edov5Onuuvr
X-Received: by 2002:a17:906:dc8c:b0:c2d:ba08:9092 with SMTP id
 a640c23a62f3a-c31a9fe730dmr1747152466b.16.1792080124947; Thu, 15 Oct 2026
 09:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAGHkXsZX7Tnze+rqJY=D5Zz2Vo=t2Hee28pDxFpoE+Lno+EcxA@mail.gmail.com>
 <048365a7-0ce0-4f98-98d2-eb040ff87b39@oss.qualcomm.com>
In-Reply-To: <048365a7-0ce0-4f98-98d2-eb040ff87b39@oss.qualcomm.com>
From: Enrico <vovkap97@gmail.com>
Date: Thu, 15 Oct 2026 18:01:50 +0200
X-Gm-Features: AclHuK_WegNOp3BqMOJ-WuU1MlOnrtz9IabRYV30HLJ-TtKNk_4nHVlThqvNgcU
Message-ID: <CAGHkXsbsJV+tCWupwKvdysddFqXmZnsv5PtD99vcAxQkp+VrTw@mail.gmail.com>
Subject: Re: [BUG] ath12k: WCN7850 firmware stops uplink TX on EHT (CMD_REMOVE_AGED_FRAMES)
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_090207_370620_3852404C 
X-CRM114-Status: UNSURE (   3.81  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

> Please open a ticket per:
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

Filed as https://bugzilla.kernel.org/show_bug.cgi?id=222136

Thank you!

