Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D280C0218C
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 12:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oq7ctNv7WRh8aRjMa8ewGwhH8PakEiEHJeSEQxxeP0M=; b=l+TC3ClwmlKHaqCqAuJmN6AyPF
	ETBQSNM2yFryaymzs7X0Saw/nEVppwVkXI2BcUJ58XVg7ZQUUFEOnxjiz+kIWXfqzearEHeVjUviB
	pCBR5TAONc2wFVghZBzK9hUc9D8FOh7/vtIiBt1cFPvWvn9rOXi1i6SvFvK62qe4XMBjkmwcA2x5l
	yNxkU+tI37oU9WnMJaNbIQpMchXJbCMnK6YdiWjmpjGnwgpORZEPD6PWaADFfarMmyGo/BP4GZIkE
	/2ogNDyvhXCE12Go0TlSGj/iQ1X5HlQddT+7o/Dvdo81fdo/l+F3vSGpypvuzTD2FlwIW1ICfde1L
	GRh2Ur1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbffG-0000000GPSt-49yo
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 12:53:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbffD-0000000GPST-3O6F
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 12:53:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436a03197b2so19731885e9.2
        for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 04:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809605; x=1738414405; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oq7ctNv7WRh8aRjMa8ewGwhH8PakEiEHJeSEQxxeP0M=;
        b=biKX3q8aU/c+48xCSI1D7fnCSouCsCYjHOkq+l0wAQjwiMQ/+muNxeWHt8zSOKuqo8
         /dMbsEF2ak0wDqKJBEKFI3k7GsdTRCkl26NFzwBO6VMlZNJ0H8arvPaHEGfxJqX9R8IJ
         SmBBFxB46RiECh5Ki6Gy0y2bBpYvZGxgdh4sObnDMgyAZ9H4Vd2Mpvs3BLIzoHrlEd1K
         dxtoijlce+4yuDc553GFulUcmJhFdJtVzVA8XdgZWbPjhVvIjtC24o0VpmROvZbIGPye
         zWLqfwqQ4qTZdHB4g1jCyV4wknd/WZ1i0Z0OSJnljMQvJHCWR77uj0eAM+NH6VA+Qn3d
         V1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809605; x=1738414405;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oq7ctNv7WRh8aRjMa8ewGwhH8PakEiEHJeSEQxxeP0M=;
        b=mQFVTv2E+m2109z9rXMt2EQ4YnjwCbAI2hD6N1pNBNeOKJH8A3CQ0loHCilEiv2ioT
         MqG/+d0Vz53sUCZUs4myEAMsMXhsIPA1mAFqAaNE6oqw9e2odEem/Dl7HVhPHEZXwIAF
         X2fyee5fPJ6RZZeGvlGyFYf8zqwtdK4/aoaRYdL9O7Q2yEJup3N9r6Xv3sZAQDOJeXeN
         O8ChUqLDpo/7zrfyE0NnvL5eQXt9i5eqZZpizk1gSCDbziaoAS+TPVs1u9DL1/45W3/y
         cHuOCZP+0D1bL/ai1bWzQu8XppgIBAXh3cFP+9oYafk1UwBoyAcryCBo8nOnzPhLk8/8
         Li8g==
X-Forwarded-Encrypted: i=1; AJvYcCXLqnN9D6TDLsLLSbLJtibqYu4tr5gSIU+xpUIhQvIZ32Q51VJM00z8JYJgs4DdGOyoe9ihYvY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6bpaM2ZBdXulIVztT9GRQcHvgcaJeYlYmgKtVHM1kdWVdOmcN
	H3irPv2qou7YoBkge1Tgizg4OpWmgjfgU5qCoX7YeoF0Xirx2yg/
X-Gm-Gg: ASbGnctmnPKHFlPaMwutlgZgOnDfzXIe5/Qq5ZANt3FTS2bILBvyx3ewkmtSROi1Rwe
	F0ZONEBPBgy4gvjMj8BHMFOq5qC3Dh+BDmJrh4Xin5dM1pIzHKvSb8MN4twdeHhX9OVzwl3skmM
	QiYEUE0n9zKfS0PT40mBoEIV8TFAJkYiyAdoffKHXq2t1Z/XGSEXQZoQ7oisHNOFIqeM6Bbf3Rj
	hh7B4hwwY7oV+hE9xfea2gLUgKD2Oy4+AVjxRmiMaGnYEdylRidVuoqSladkoGD7CTHZEWkPbwV
	t3dydC808NfKh9/RnyFKr5c=
X-Google-Smtp-Source: AGHT+IGpZlYjAhnB2sYvAKX+xEq7wEQ/Ia15OynTfoYEjxUZ6U3BSuGxPYdYzjNjz4G7N3JatGX3Dg==
X-Received: by 2002:a05:600c:35cf:b0:436:1be4:c9b4 with SMTP id 5b1f17b1804b1-4389143698amr279621295e9.27.1737809605237;
        Sat, 25 Jan 2025 04:53:25 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1da8d4asm69237805e9.3.2025.01.25.04.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 04:53:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jan 2025 13:53:22 +0100
Message-Id: <D7B63ACJOYD0.1XBZ5VB991KOW@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fbx: fix
 ath12k_hal_tx_cmd_ext_desc_setup() info1 override
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250124113352.93638-1-nico.escande@gmail.com>
 <a979cbc5-5cfe-160d-d5b9-9e5ed7513ed1@quicinc.com>
In-Reply-To: <a979cbc5-5cfe-160d-d5b9-9e5ed7513ed1@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_045327_848002_B293CFD9 
X-CRM114-Status: UNSURE (   8.72  )
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

On Fri Jan 24, 2025 at 4:31 PM CET, Karthikeyan Periyasamy wrote:
> On 1/24/2025 5:03 PM, Nicolas Escande wrote:
>> Since inception there is an obvious typo laying around in
>> ath12k_hal_tx_cmd_ext_desc_setup(). Instead of intitializing + adding
>> flags to tcl_ext_cmd->info1, we initialize + override. This is needed to
>> make broadcast frames work with ethernet encapsulation.
>>=20
>
> SUPPORTS_TX_ENCAP_OFFLOAD not yet advertised by ath12k. How it work with=
=20
> ethernet encapsulation ?

Yes indeed, I made a small patch that adds the right hw features via a modu=
le
param like one of your CLO patches did:

+       if (ath12k_frame_mode =3D=3D ATH12K_HW_TXRX_ETHERNET) {
+               ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
+               ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
+       }
+

But maybe as this feature is not yet enabled upstream I need remove the fix=
es
tag ? After all It seems that in native wifi this bug causes no harm...

