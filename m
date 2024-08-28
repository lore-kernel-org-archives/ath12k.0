Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FBEC7113C
	for <ath12k@archiver.kernel.org>; Wed, 28 Aug 2024 21:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7R9xjzPejSV+LtR0Rj2VdITegcE4Mh1cPKtWgk7Btc=; b=StBu6YcC7vOMggPTqy/g045vHb
	OdfI2XUn1mBPU7KhbMYG6lRekcEp/zkDCvp67eTtYvR+lqEUJkq/6F5UkvhMw3oBo4U7myweFawIO
	cfu2WM17wk7/FmVruzez0iiSt2DxdH2apkhhpWMT7WW+a6RYmEwtVwXSzbqf71h8J4YNa8f5LDaFt
	zn7Nd0eQyxIRGtVvyK04aO6SA5HxaPevqhsRvgAp4D/ZyUtf572xYxgZehc+psXM+buF7m/GU7yN5
	I7dlss3a+2JWjyzD5ltBDooqMIRGmXEWYauqoFdhqfIlUteE5QoclkQ80kx5tnoVJOuoP8v0cjviU
	QE2QZLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjPoc-0000000GzqW-2WBk
	for ath12k@archiver.kernel.org;
	Wed, 28 Aug 2024 21:02:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjPoZ-0000000Gzpo-1erv
	for ath12k@lists.infradead.org;
	Wed, 28 Aug 2024 21:02:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-371941bbfb0so4266001f8f.0
        for <ath12k@lists.infradead.org>; Wed, 28 Aug 2024 14:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724878969; x=1725483769; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7R9xjzPejSV+LtR0Rj2VdITegcE4Mh1cPKtWgk7Btc=;
        b=SwHsPOIyvkwtOAk+PvF09XYCWRzFHTKyc2zzLEFcnnoY0mtJMGGEA8f7MGYFNSawLv
         qgVghohsUD5bOAzoLjOEBkuxvsYD/bRWDIt1jZrfmtp5vX3P1gw0ZxgG7R7rlg5k0UJY
         4nZUdVtWf+Vmc12jCE/9mIhewuYewRS7tLqKLOWNIWrp9ya4+p/8/3AnT1V+b+bAuN93
         L1hjKiuKBi6RPYTqmgbSFVOirWZ9g6j13TSk9yqSSuzA9G6eoLbiGVHtIZNKTeAXTLrk
         P7jfbwiFVMz+BEJc+IT2nrmvQP25Yk++kXZqajx7RGLVTPhEcgUxueTwT0noyE33T0I3
         AAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724878969; x=1725483769;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/7R9xjzPejSV+LtR0Rj2VdITegcE4Mh1cPKtWgk7Btc=;
        b=YRtZlp/MjZOG+JHOwuz5v8Yg40sqWQoYvIoPqzTHulPL7ZFupOHf3sshRLt0x+JtAc
         zm4kQccS+Mt5j2lejdx6F5Olf34KWrSTdg6/G2fToJmTCK9+Qp+yMug1hiYWbBJcmpQs
         21kEBsU+5J2bKbDAJTLwZuys6pUIPbwkoqoEDfoJHYs/IqXcFeYrsUYnrQUnzCXVUsnU
         Hc9mLiTm57uB0qT020IrIufPqF+nWYq7C4xHZA7r7nleUlN87A6S8xzMl8d4VjQJ5Wih
         iIWWBD0s/yo2XCrkzRYJMyRyoFZeluIw2GUG1z648t6+4a3BsfjBh+mqy6KjkQBTn+KQ
         zZMA==
X-Forwarded-Encrypted: i=1; AJvYcCVmJZXwgvmJvqo3abfmmnZlVIYZeaNvuXA8Zk7WNt1c0CJAnqk1yzBToUK9oUpCf8kwqQhAALA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxiNCmeSNYHztcysZ4am8k1c2eErLw7XIIgnn4BhVF6SIoXfu6
	OGxeQ6NcR0xZPfOFBwbW0Pb/WY+oJQ846f8XUsQH0BpR7mXBaAem
X-Google-Smtp-Source: AGHT+IGs60crRsv2m/XRNoR+uhvl+RZ8IK3KU0XYeQbnl6nbac8GMoD2NnXL3Vq0HQWHz/OmfZY1HA==
X-Received: by 2002:a5d:47a9:0:b0:368:3038:8290 with SMTP id ffacd0b85a97d-3749b589645mr621497f8f.39.1724878968920;
        Wed, 28 Aug 2024 14:02:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:0:2100:21ef:6d50:511c:bd79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749b360e48sm592901f8f.106.2024.08.28.14.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 14:02:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Aug 2024 23:02:47 +0200
Message-Id: <D3RUKAFELUWP.XTR6V4GB7JXS@gmail.com>
To: "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>
Cc: <repk@triplefau.lt>, <ath12k@lists.infradead.org>
Subject: Re: Wrong place for rxbaddr/txbaddr to be in struct ath12k_spt_info
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <D3RLNOZ847AF.2I0ITYUMJNK52@gmail.com>
 <ce8201cc-f01f-77e1-f5eb-ab0d6e0bd36a@quicinc.com>
In-Reply-To: <ce8201cc-f01f-77e1-f5eb-ab0d6e0bd36a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_140251_459117_30C3659B 
X-CRM114-Status: GOOD (  19.59  )
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

On Wed Aug 28, 2024 at 6:58 PM CEST, Karthikeyan Periyasamy wrote:
>
>
> On 8/28/2024 7:34 PM, Nicolas Escande wrote:
> > Hi there,
> >=20
> > Looking into a problem we have on an ath12k platform at work with a col=
league,
> > I stumbled upon something that seems weird.
> >=20
> > The interresting parts of dh.h:
> >=20
> > struct ath12k_spt_info {
> > 	dma_addr_t paddr;
> > 	u64 *vaddr;
> > 	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
> > 	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
> > };
> >=20
> > ...
> >=20
> > struct ath12k_dp {
> > 	struct ath12k_base *ab;
> > 	...
> > 	struct ath12k_spt_info *spt_info;
> > 	u32 num_spt_pages;
> > 	u32 rx_ppt_base;
> > 	...
> > };
> >=20
> > In dp.c we have ath12k_dp_cc_desc_init that allocs arrays of ath12k_rx_=
desc_info
> > stores the addresses of the individual desc in each of the spt entries =
using
> > ath12k_dp_cc_get_desc_addr_ptr(), but we also save the address of the w=
hole
> > array for later cleanup by dp->spt_info->rxbaddr[i] =3D &rx_descs[0];
> >=20
> > Surely this is wrong, with the current code we always use the first ele=
ment of
> > dp->spt_info to store all the descriptors arrays. And the same goes for=
 txbaddr.
> > I mean it works, but we loose memory for no purpose & make this part of=
 the
> > driver harder to understand.
> >=20
> > It should be something like:
> >=20
...

> >=20
> > Right ?
> >=20
>
> Yes, we always use the first element of dp->spt_info to store all the=20
> descriptors arrays.

Well that was not what I expected. So please enlighten me, what's the ratio=
nale
behind deliberately wasting around ATH12K_NUM_SPT_PAGES * sizeof(uintptr_t)=
 *
(ATH12K_NUM_RX_SPT_PAGES + ATH12K_NUM_TX_SPT_PAGES) of memory ? I'm quite
puzzled by this decision... I feel it really doesn't help understanding thi=
s
already complicated enough piece of code.

