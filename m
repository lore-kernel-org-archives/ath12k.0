Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADDAC5B572
	for <ath12k@archiver.kernel.org>; Mon, 17 Aug 2026 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95yA+WdRlTqFGt2+SNkdJin9HBogSOyIOfFjUaohKa8=; b=CXlCCMVo+TzEm/QrODWyb6M9wC
	LtdNRtt+wdz1CIaGcPue26WzwNXYS1K3qU8Wck4bFhpXTYffnFT40iSSoSX1wCMYDQ4RcW+/az5qT
	yibe5Mn6sD5MvWm/Fxc8UW0XPbgTy+lN1DmAamY587Z/YM+Kx4xF0GPb+KazynR1ez6le+Y42QQa2
	i34sEnrusAhk2tcYiwtTEvXNlTurlf5/SS0cqtxGDKhCQ31LZQdk+1EVdYAYHQqhYURwUgpDu+x2s
	DTrX2w2xcNa7EwrGNDYcupkKD6eSE0xhX39gE13XQuRWnk75wwVMiM7oa8/G7PgsqkR0FZsTGzU+J
	cHg/ptlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvz5T-00000006O6S-1KEV;
	Mon, 17 Aug 2026 15:17:19 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvz5R-00000006O62-1S9y
	for ath12k@lists.infradead.org;
	Mon, 17 Aug 2026 15:17:18 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51c2a818fc4so23451711cf.2
        for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786979836; x=1787584636; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=95yA+WdRlTqFGt2+SNkdJin9HBogSOyIOfFjUaohKa8=;
        b=CYK7moye+GfZQTFhHp14D63im59BXee/mCfGKehTFgZ3yCltOA9budj0BhEIyvQs1G
         VILz0xMwkdcJ4+Q9eQutifvi3SCWQqD7d37BCTFFdsBt1lzDalFTtU0v+Ui07+VNnRtc
         8kjkJXJrW3XOJUARcGqDyIb8jz2FmmLy1wKEkWTf6py4xOu+RfqJKDRfSPtYUCqXrvek
         154Qu/WkuMBMYmYOAH/DGb7CjJsLemXUeXp1k5NT8SWGXi5/1JamdmdmFdmlBC317SUn
         jirmhC4AAc1n1tW2fgWJbpT2p9zJRCjcRzfXjquBdjLX4yB4pvHyc+hULFcNB1tdDY/Y
         thiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979836; x=1787584636;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95yA+WdRlTqFGt2+SNkdJin9HBogSOyIOfFjUaohKa8=;
        b=DCfrBkp2R8pQkW+ql0LQlZ1J+7gs6UNkS55UJTDefcKigyn6T6YlIQdC0fFMdd86wJ
         C4ecMGWs5BJ8IPgn5/6nIvUoJNml0RxqBwvs1T4gftDeh+BaQUde1Yl9gJkpGDK4KOks
         QYQrqhAJ24ZXrR62TQYnJrd6UYAY1Jls0QK2hK14tH08OIrUabLvH88k6R2tIW6vt81V
         u7Hl1uo5XKuDEUaZRbgGDQHARsyldPI0bhbsOHgnxUflaocar3nCn8TIG2K0fJLN7y5v
         RysfvbvznkzOcRp92FIValwScVIAYMM/O50Y0eELcmHpecq6sBeBSe9TiGuCflxxVsF1
         /k7w==
X-Gm-Message-State: AOJu0Yyt9ZkBlg5IdmtxxBesGaZKelQgPQv3ToOzLo+hqSaNvE6JpX+r
	WC0naaJgFBzH5MVktkgtj3WYuIo3s2dDo3z/VqkR4Y+wGYaNSmCEeBTo
X-Gm-Gg: AR+sD13Ze6HR+kPLkUsItR6fu3ILe8hBGgFiZEVicBQIywlm1q+A4QQKVRi3iDlrc0u
	zqvE7Buoa6ReYg5/iP3b+m5gX4aHJ+UwSAtAkN6Pnh5QNz1KZ3iLqV2Aw17Uh8SLZHY5CRZEKsF
	RlkUFa65kqVevZcfBHxFrks2OJG6Bcsilq5oRDoJapI3CE4HcZwsvmLKkg1D2WPGAP6lV1xRRE8
	Xf152IGb6cUnU/fgjzBnqbcOf23zquHLSD/DRVIm7QTbgakmBU+W3QHXEq+fijL/AXyGrg8Qb0K
	ezrl0Pptr/oOe962MozttybdCrHbWawfVGaV0ragfYU9iArCsr7Fz0MekDVSf8ASuiFTfB1BQOe
	loiN7QUjq8LkivlG08zVozicEeNitc6TLdFzrZijYPIH5aGNHjHSDZX61FLhVqOVwC6BBo5qWDg
	WcoqkaoEKGQfJId6VXJrQnd/Lli2AoWJyF69gb+Cb27+BhwWnitnP+bXr93sksdraC6wVGN5WSk
	fIT1jy4wMiGLhfCdGxQEuyFf38OrjAJZFgjQsk=
X-Received: by 2002:a05:622a:c6:b0:51c:167d:b328 with SMTP id d75a77b69052e-52d854fb4bfmr260666571cf.40.1786979835949;
        Mon, 17 Aug 2026 08:17:15 -0700 (PDT)
Received: from ?IPv6:2001:8a0:c4c6:f00:d76f:1095:5248:4cb1? ([2001:8a0:c4c6:f00:d76f:1095:5248:4cb1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db610b491sm16716901cf.8.2026.08.17.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:17:14 -0700 (PDT)
Message-ID: <eee05cd38c0d514b174cee132ddc44f6ca880f23.camel@gmail.com>
Subject: Re: ath12k: recommended regulatory country source for embedded AP
 products?
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, Wen Gong <quic_wgong@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Kalle Valo
 <kvalo@kernel.org>, vdosreis@qti.qualcomm.com, lucia@qti.qualcomm.com, 
 dbenitez@qti.qualcomm.com, jeff.johnson@oss.qualcomm.com, 
 bqiang@qti.qualcomm.com, wgan@qti.qualcomm.com,
 francesco.dolcini@toradex.com
Date: Mon, 17 Aug 2026 16:17:11 +0100
In-Reply-To: <c7609911037798c2026636ddd13208cdf000cc55.camel@gmail.com>
References: <3ac168e7dfe22133daf09adc3f6587098ec85619.camel@gmail.com>
	 <c7609911037798c2026636ddd13208cdf000cc55.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_081717_398799_337FC857 
X-CRM114-Status: GOOD (  23.30  )
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

++ Francesco Dolcini

On Mon, 2026-08-17 at 16:04 +0100, Vitor Soares wrote:
>=20
>=20
> Hello,
>=20
> Adding a few Qualcomm contacts in Cc who may be able to help here, or poi=
nt me
> to the right people.
>=20
>=20
> Thanks,
> Vitor Soares
>=20
> On Wed, 2026-07-29 at 10:29 +0100, Vitor Soares wrote:
> > Hello,
> >=20
> > I'm integrationg the=C2=A0Silex SX-PCEBE module (Qualcomm WCN7850, ath1=
2k) on the
> > ARM-based Toradex Aquila SoM family, using a recent mainline kernel (7.=
2-
> > rc).
> >=20
> > Hardware/firmware: wcn7850 hw2.0 (PCI),
> > WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> > (fw_version 0x1103006c).
> >=20
> > I'm trying to understand the intended way to set the regulatory country=
 for
> > ath12k on embedded products where the country is configured by the
> > integrator
> > of
> > our SoM or at deployment time by the end user.
> >=20
> > My current understanding is that ath12k registers the wiphy as self-man=
aged,
> > but
> > userspace regulatory hints, e.g. "iw reg", are ignored in
> > ath12k_reg_notifier()
> > unless CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS=3Dy, which in turn depends=
 on
> > CONFIG_CFG80211_CERTIFICATION_ONUS.
> >=20
> > The SMBIOS coounty-code path, looks intended for fixed regional SKUs,
> > However,
> > it is not available on our ARM platform.
> >=20
> > So, I have 2 related questions:
> >=20
> > 1 - Is the expected ath12k model for this type of product to enable=20
> > ATH_REG_DYNAMIC_USER_REG_HINTS and use userspace regulatory hints befor=
e
> > starting hostapd, with the regulatory responsibility on the
> > product/integrator?
> >=20
> >=20
> > Or is there another mechanism you would recomment for this use case?
> >=20
> > 2 - Since ath12k is a self-managed regulatory device and the firmware o=
wns
> > and
> > enforces the regulatory database, is the CFG80211_CERTIFICATION_ONUS ga=
te
> > intended to apply to this case as well?
> >=20
> > In other words, should a userspace-selected country for a self-managed
> > ath12k
> > device be treated the same as dynamic user regulatory hints for non-sel=
f-
> > managed
> > devices, or is this dependency inherited from the common ath regulatory
> > model?
> >=20
> > Without a country, the ath12k falls back to world "00", where 5 GHz AP
> > operation
> > is blocked by NO_IR.
> >=20
> > Thanks,
> > Vitor Soares
> >=20
>=20


