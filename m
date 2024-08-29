Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5E7C7EE30
	for <ath12k@archiver.kernel.org>; Thu, 29 Aug 2024 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uukU0bNksXYozDXTDSnIzaMz330oN6FYcdKxZQowx7k=; b=PbUpPuseGgAY/bVqePHWfOJsdK
	eLcHImtigsIs5bq84k/1NLyuGaEOMI+D7ojkl7+9DYqg61X2B/TCoUijRainUrUffWyF1idxD31Wn
	O2WCtfHjZez2Q1rXB8vw+dZobXwe+jrC77z5uo0OnKUlO47pB9JJ3jCTY6V6IUZ2INMsbMc+CHT3V
	Z1TSQ2WdfamxeonP8pxhSZn/jrGMIt6XxEE2sbv5sE6rxZkgWla3q9waJrnwJq9WlsXQJAPtSd8ix
	lL6MtntKLfgEkOySPFuC17OzxG3OmDu6Eks2sxjyImREChl8rXMINPomL3NyJ0AU0RC8c2HMHdX+0
	/MEEeLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjZPu-00000000ulI-0hRy
	for ath12k@archiver.kernel.org;
	Thu, 29 Aug 2024 07:18:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjZPr-00000000uki-3EIY
	for ath12k@lists.infradead.org;
	Thu, 29 Aug 2024 07:18:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37193ef72a4so223016f8f.1
        for <ath12k@lists.infradead.org>; Thu, 29 Aug 2024 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724915878; x=1725520678; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uukU0bNksXYozDXTDSnIzaMz330oN6FYcdKxZQowx7k=;
        b=G4rXqGFfQBaJOySHLJzWx0foDwqxDMcoSA1BOZU9PA8YdrbhAXC1ivrlSs6WzRa0wc
         GU9EKKPxRBDzYEUf6ZGosuEKrSt6MDhlUHJIiAD4/bkDMsXPWyTGS/Tq3mTN7HP04SRW
         iZCeRNeOuvnf8DhjvoQUWCgi52mkfdJNT8RXOYcUxE9QCt6y9JOMJJREVMe2niEZWTU5
         MYV0eKFunjGPAPDwknSlPjJJTfSU6Vj29BKQV2DYRcSQ7SoZzQD2JnJKHoX/3fluUAXG
         +lBT2yRA4H1xe38f83j1NUP0ZhQY7WAnjYPzOAkt/0yZ8CNJ4ddSO778aNYV0zOLdsL8
         2Ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915878; x=1725520678;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uukU0bNksXYozDXTDSnIzaMz330oN6FYcdKxZQowx7k=;
        b=rTu/AGt2EYPB6ea/b5xUvukKr7sbABZOopkRXuvvK5OmxtJcVPKpsM1+rlkdp0swwN
         MzSaJPJu3TEed7ZCLalWddd6yiaxqHNifHkm45F3506phpo+QRgIJUBNyVSju4UVS4TT
         sDW7AXYa/3Mrgf9YwvXAvoVImOgLE2IZ9HcbFtzVYJrk2+mhS1MNcsy1Nc7EvROlcnYt
         GzIo0mYr51Kmtoc9r7opmktT7t0qdP5K5gTIvstre3RCNwmOU7Sb8bUCG+ZAo427HtPD
         2MYCJpjCpI8QBhOBMPk9LHNnNwDp+80Q5YpaK6hCuj1zYSvyTAUNb7UAb/5wJDom/fDV
         aXjw==
X-Forwarded-Encrypted: i=1; AJvYcCUS0DRjNW+JC51NAm4I69duGTG9ItWjDqP41OKMtf32E1aRDJhUVUObDEup/zQ26rD3t0SO3Yw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+2GG9HwBkUPnPUR3ZRc2DqiVc8C066oISTAioJpLoxbxtvwVG
	ZZX13jC08KquH5CcUGsxsYWuAUl4522eh17lISryLubXZBktFPyRbEjvWA==
X-Google-Smtp-Source: AGHT+IFHZ82jou3fdw3aQRnEprokA1lBXxnUAbuSSW3E2qg1JtRY4vdJxiC+T+3TQLDKnlvgcC+Vfw==
X-Received: by 2002:a05:6000:11c9:b0:373:53a:8966 with SMTP id ffacd0b85a97d-3749b585654mr1404494f8f.54.1724915877761;
        Thu, 29 Aug 2024 00:17:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:0:2100:21ef:6d50:511c:bd79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef7e940sm650747f8f.66.2024.08.29.00.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 00:17:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Aug 2024 09:17:56 +0200
Message-Id: <D3S7NA6WFNVL.1ZZWXBAH66467@gmail.com>
Cc: <repk@triplefau.lt>, <ath12k@lists.infradead.org>
Subject: Re: Wrong place for rxbaddr/txbaddr to be in struct ath12k_spt_info
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <D3RLNOZ847AF.2I0ITYUMJNK52@gmail.com>
 <ce8201cc-f01f-77e1-f5eb-ab0d6e0bd36a@quicinc.com>
 <D3RUKAFELUWP.XTR6V4GB7JXS@gmail.com>
 <f5bf9d37-6420-392b-e318-7e7656ca57f3@quicinc.com>
In-Reply-To: <f5bf9d37-6420-392b-e318-7e7656ca57f3@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_001759_828199_B6DC3751 
X-CRM114-Status: UNSURE (   5.63  )
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

On Thu Aug 29, 2024 at 2:21 AM CEST, Karthikeyan Periyasamy wrote:
>
[...]
>
> Agree your point, can move rxbaddr[], txbaddr[] out of the spt_info.

Thanks, I'll send a patch for this then.

