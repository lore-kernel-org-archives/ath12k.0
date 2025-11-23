Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C2CCFD2F6
	for <ath12k@archiver.kernel.org>; Sun, 23 Nov 2025 22:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TDbtIkIFEEONvTehrmAhkI6gQakZJSj185rwv07CnY=; b=x1kSv5YV2CL28xub9wpqyKe4xw
	2uO7HbQQApBqgKUuoutNMaR/XZtjSzZzWNIYI4fLl512GQf/TYgwqyv74VPofzUWkomqnjW3kSEh6
	czdBum2qZQkBhDQtAoJkL8KCMg3szTjXId+elbS++SH722skCRQM+cgiYKEvL+dBghZ8uakzziMdX
	IYiFsBlNeqwdqRDdXw1PZ3tzVRyL8FA5bLdsAUBW2CgdmSpeIgpcLuVRotLx8LN5bZ632TNgKw54r
	97C1oVksHdYgW8iRFjYITboz8RTGZe7d6XHZx/DMR1+68Lt0i3CPY1ZTC2gmZsC0pLkBW6CnpNrTG
	gSacgHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIpE-0000000AkRJ-0vpc;
	Sun, 23 Nov 2025 22:44:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIpC-0000000AkR1-10hQ
	for ath12k@lists.infradead.org;
	Sun, 23 Nov 2025 22:44:55 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so640954366b.3
        for <ath12k@lists.infradead.org>; Sun, 23 Nov 2025 14:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763937892; x=1764542692; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TDbtIkIFEEONvTehrmAhkI6gQakZJSj185rwv07CnY=;
        b=b/B+EpCmDB2g2JWxktx6ZwnGftc9OaYLMlfxbUL99+/u+DAzgPCQ0i5u97EWzDDTyf
         ycA3Q/ywtsVe6/RUKU+G4AlA8WuU2hgYbLAJqUC4XX8ZBPftWk9U9rWcIzNij3TgAf3m
         0UG/KKbtVaD2KQLsf9xkHx72XDe0wuKPx81yVD/kBjtNnaKIT5bH9h7XFCzbGo+Wx6+3
         soPvq3yB23cWvVr/GDW4BZEtDBcDefta8hXFDUOvGKKmlxVj5+SwRa5u+C/IPnV9BFWr
         HdzG8Ek9J4KSogoNGQJ2l4nw531/7NspawaJvgfN63kZXEpQHL0c6c+2iMofgl3UBm6W
         t0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763937892; x=1764542692;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TDbtIkIFEEONvTehrmAhkI6gQakZJSj185rwv07CnY=;
        b=PqVfwDmCKSy/RcxfxWqKUro1N6WF0s5HcepfmswoL/bRwiPCozua+ovZAEpnjpwImf
         5oOSHj2+MXOFsAIJmxQqUiZUuB+nRXcmYtOgAOykWv6gD42mU2rlhtZ0hI4pcf/y4Vyt
         ignVSAopBtr+GcCeVKC1eVZlbXlcKR7O5NYIiour1TvjpNF0owDLhbDhJGISEEIQeHWi
         brQlZ6yPOElpPJgUEPRt1Km9912suf2EVgdjtmH1BgcLSWkUoQTRunpmT0O97zORnDIT
         JgkxdXEMKmdt43NlxK/NwogtIlkonNBTq2iu9TfGf1I1nkSyjxehyqRrPXwCJfsfUqo3
         0vvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEeWTSDWGEy95jYCITFq3Yp00wVwLj9f+/adDtgIRgzpScBiPzVqLEH0/o1orRQN0AUJ5Urw8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxPRLGI95Kd/A30wGk4ZAKaeI89gg9oEC8o6lsv4mqVCJosUOQ
	hnT/+6Iz7pRk/IruBMH8De8YpJTdiL6Q4khTAm7nA0Nw+VUUU8UKI23JzmRd6R2D+UYkfQPMqgU
	MvFAG/Y25Phw8D0xwDgGQS/n1V/pvK38=
X-Gm-Gg: ASbGncsRrWwzUTCRJ1k4wc1UJgPKlUI27Wc965oovYhZZDKZzqIFpwoUfnd3N2k6rCf
	38bIF4Ips+3nAPKAy9gg02wP6shvBys/3TAy1kJXt+S+mMcpEWpmYhLp0iZOg7bt8Mi99IIap7v
	/Rok6F5qhh/hG4GprrV/VyuYJotnuJ9fLqI6KFZYXq9SN9TgxNsX1sh3jnYiA/h5BlTMPcJiH8P
	u61q3Lhpb1cAecsiT1uJk3wqcFQRSUgKphyZxxXdF9zRxjebUd1RILVZrtF/vXmKFWBMdZjp5oy
	RpX5QlQ=
X-Google-Smtp-Source: AGHT+IE5s9btl8KFE8c+4keBiMFcig0gza3XlXpRVblfyh0XHjakH8+GQ602BP6yJZz0KAhISv7ng5mutmZda6/w1Ts=
X-Received: by 2002:a17:907:1c04:b0:b71:8448:a8dd with SMTP id
 a640c23a62f3a-b7671703d89mr1045888566b.31.1763937891690; Sun, 23 Nov 2025
 14:44:51 -0800 (PST)
MIME-Version: 1.0
References: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
 <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com> <fd3bd8b1-4108-445a-b65f-4769d73e6e63@arm.com>
 <4a13d862-1bbb-4a98-bc1d-219bf78f7c0d@amd.com> <CAPDiVH-kVCUY8DKexT9OqAZsvkZ5_CGo8d8nENYA-kD=s_x8wA@mail.gmail.com>
 <e008afed-819d-43eb-8895-2c7aaf24ec13@oss.qualcomm.com> <CAPDiVH-xPDmx-KQx7YJY=7+kwJNbGY-rEu-w+cz18p=kjnKFsw@mail.gmail.com>
 <979be2a9-9d0b-4382-8519-2f6fbcac5375@oss.qualcomm.com> <CAPDiVH9Fi3Rw4K4npHMAEcOPMj=iFMEJOyhn5cRaq3+9kBYNZA@mail.gmail.com>
 <CAPDiVH_-=DzPjyjDo34-0HG20feiGfrM4eOpkPt6bavrw2qWaA@mail.gmail.com>
In-Reply-To: <CAPDiVH_-=DzPjyjDo34-0HG20feiGfrM4eOpkPt6bavrw2qWaA@mail.gmail.com>
From: Matt Mower <mowerm@gmail.com>
Date: Sun, 23 Nov 2025 14:44:40 -0800
X-Gm-Features: AWmQ_bmVktkGYS0kZqT-zWoG9xcEYYl6ViCTjWaL2T9RdixreA7prDngkp_xLVY
Message-ID: <CAPDiVH-S404i1O7J4EUTohx27Mbo4EaKeHK6tgXs2+1_HxmVtQ@mail.gmail.com>
Subject: Re: ath12k_pci errors and loss of connectivity in 6.12.y branch
To: 1107521-done@bugs.debian.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_144454_307278_C782B0C0 
X-CRM114-Status: UNSURE (   2.72  )
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

Closing Debian bug report 1107521. I no longer experience these
crashes or loss of network connectivity with the following package
versions in Debian 13:
- firmware-atheros 20250808-1
- linux-image-6.12.48+deb13-amd64 6.12.48-1
- linux-image-6.12.57+deb13-amd64 6.12.57-1

