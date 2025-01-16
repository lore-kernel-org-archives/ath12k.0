Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6C3C02180
	for <ath12k@archiver.kernel.org>; Thu, 16 Jan 2025 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvGwGbLOboTQnmoegkqNqUjKynNMZPV9YcHg47pSi1s=; b=tQ6n4N5EQ51pSQYSRQZ495hwzm
	w4usF7zC17vJfsnKMz0AYBEOos0vPZNNUUKghawHHKmPX2pgshhW/TP7J9qJr0awa1dd7XS/tf6KZ
	hZKo/erbK7ojcJ3cg73SLWZisLOe5J8R+WXI3AIXCV08yQbFXLfPYxTQIBhmdzCLB18pUrlpLTKHH
	5tzuXchas+P0MIsGsWdkWtQ0x9qEDZjpAhFy2oyjteyIIOuoO+qnKj9gl5cKN0duCqLl1OOJ8NltP
	KOO72n1YoqvMfA7MD6KBBZwdJiVKMnElcNGdie4EAljcIR1oTYPlmL4qLbgKJwo0TJ9h+CsCd1anY
	IpVVGXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQHX-0000000F35t-2Unz
	for ath12k@archiver.kernel.org;
	Thu, 16 Jan 2025 13:51:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQHV-0000000F33O-0qyF
	for ath12k@lists.infradead.org;
	Thu, 16 Jan 2025 13:51:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862d6d5765so576034f8f.3
        for <ath12k@lists.infradead.org>; Thu, 16 Jan 2025 05:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737035489; x=1737640289; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvGwGbLOboTQnmoegkqNqUjKynNMZPV9YcHg47pSi1s=;
        b=YS3yBx+f3tj/VurEymSxL2HL2l/RxqZ1T4pBr3SbIu8QtatRil+CotfDeJXQtj43bK
         sr7Wz1Z9ZFvITZibO1tPJw5QPdReYNiGA8x+fCbdxpm82JhnBe+52OrXcYJ9BN/8myCI
         sM/fFMCiUgJj290AmSNYYI/0nWhodRFeZZK2FHpViJ2A96K7qHEV3v2zzw1F9T9cuuPB
         h/yylnnhgrouFX/VHhCUwRWWiBLZoE8lXeuC27p/picXiAm4lm5w7SOPEJXwd7AEdxXo
         Hgd1LhQfaZMjl44lCDmEAxh4j62yez0c0tgaOQouxbuFWtAVT+OJr9/TuMujNUNdNa8A
         vWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035489; x=1737640289;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KvGwGbLOboTQnmoegkqNqUjKynNMZPV9YcHg47pSi1s=;
        b=V9bBJHHGRKnUsVNDeOpBma2hEFS78/8S4Do4uTIav+xTE3Kp0d5kaVI7ORbeZsRd7F
         QvWullDpAvduYrsQJXL32lskli+rxCTbbAwZymyetIeP8ZyHe2XpYh28a+a6Hk5bpbRW
         HdSOODQwICf9PDiKtm4D0AOb+nD6KZRUFuljGrojYUjXyum3xXNN8TYAxgphBy7b4DCd
         vFo1Edkey5sfbd9FGjrqQauPM7Ouo3nlO0HUXSEb9tnQTrhB+DwWYsXSv0jWbQH28Nkj
         15WGmk4/tzEpZuW1Cl+urjJsHDEM6+yhFcyAfY8Lf83GqUrlj5pdyyieDzYI4mMMoRML
         Io3g==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8mKjnad/4mYeZSxVo4t7nAcGLGsYjIO25CDYbAW5cjvD35CRQ+mgG5XRlCDGC/gA7jTczPc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4z8L5JZs6gLu8HQJJIWNEprpAEGcm2icMyFwxK7Cko5ImtDZp
	h9z7nI14mCNQghYpSwNfuYiasJ2e01HUS5Ex6Mp+j/u55GHaNo4d
X-Gm-Gg: ASbGncunshcQxGeXWS55Aq319mX6KVZ7+SFK7qumEzytGkQahJtRzV4fqXCB35JlXHS
	mebWlL6gxWpsxL2hQMb7emW0vluR+Kqim7Nr6BkOJDqF8kHkn7Ss0wZaTS5lVmUvXYDWkoeAMzy
	leoHXFmgMXm1m7GVZ61cD/S0AZSp0VOubOH5zEjJpl2tE3x2sNksq4Psxur0DQrb5dSAzGFBLGc
	ztbY0/q9hYowMOjwWsAP4ERpbbZzPVrJDRPa2LJJDmBmQL/t5QbbINWK2wg3hQdIHX+YlzXW6c=
X-Google-Smtp-Source: AGHT+IE/MbXNRZnW0uYuX0hY5+W4YuEcxxEbHhzAQ+N2/2rO7RBd72sJSqF2b+UdU2jLH45twuYLIg==
X-Received: by 2002:a05:6000:144b:b0:385:f13c:570f with SMTP id ffacd0b85a97d-38a872ecc38mr32056664f8f.33.1737035489262;
        Thu, 16 Jan 2025 05:51:29 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38325esm20417723f8f.27.2025.01.16.05.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 05:51:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jan 2025 14:51:28 +0100
Message-Id: <D73JOV2O2F8N.1C65FLDKDSL2X@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/7] wifi: ath12k: Add monitor interface support on
 QCN9274
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Karthikeyan Periyasamy"
 <quic_periyasa@quicinc.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
 <D72U91ZG2PNM.2IXUT304LMEC0@gmail.com>
 <247ad29a-8c54-4046-8e75-8435c2addf75@oss.qualcomm.com>
In-Reply-To: <247ad29a-8c54-4046-8e75-8435c2addf75@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_055133_241947_75318F55 
X-CRM114-Status: GOOD (  10.40  )
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

On Wed Jan 15, 2025 at 8:56 PM CET, Jeff Johnson wrote:
> On 1/15/2025 9:55 AM, Nicolas Escande wrote:
> > This is on split-phy QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_S=
ILICONZ-1
>
> I don't know if it will help, but I just pushed out
>
> new firmware WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1:
> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/commit/a289=
ab4de56345be86d2c89c81aa12577c2c5a30
>
> new board file:
> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/commit/bd2c=
a865d78f3d7d899e06cef57e5bbb9da60bf7

Thanks for the tip, I just tried it but alas it doesn't change a thing.
RSSI (and maybe rx/tx bitrates not so sure) is still broken for all connect=
ed
STA after a monitor device goes up & down.=20

