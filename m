Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26286C43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 21:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5xNoEqWPKSku3siZxSBMOiC0vCdU7+eyeCETDkmLM8=; b=jwlyXZWRU9BBCR9TMSzkBd7hTb
	h8IK9h/HcvVcPyxpayXqF2fbP4juIOoxMnQ/H3IbYOkj8LNV+Eh1nxSJe0ZuaruPeNmhWXYHFem+Q
	bFdzAAerRGU8mJPwXeBx6enFBuubudbUGBOsXoP4iWLjE3nmMFkffzBm8RuGrVRpWk8azplRz+UR9
	O2XaIHzFGCScFfkZ2fniV1DMQvTz3/UWiHnXky6WZQJAAGo8cLXPIsi9H0uo2iOolJizshZEN4WAd
	Bd4vMy/OzZROM0ly1xTn/zlOhnclnb2NpMNPh68fPEfAo1e7veRKTCM5LgM7yZ1UIyOti1v0EQlBf
	cxAP4+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOk4-00000005VQn-4ABP;
	Thu, 02 Jul 2026 21:14:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOk2-00000005VQA-2Hom
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 21:14:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b1710405so12416545e9.2
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783026876; x=1783631676; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5xNoEqWPKSku3siZxSBMOiC0vCdU7+eyeCETDkmLM8=;
        b=EMiUeeFK2P8gMdEUVMhoWaPU3RALxgBu+evJKYT1hc62rG5aJgn24/LSAnjEJjH4oN
         wRXsyNytYmHusTI5096dVwFm6wymOd9/GRODEj3VHFgN1H446rUH8H30XvzKJWUdS8Un
         bMKTXWtHfR2XbSYQQZaUUHgALWsBWuoCpVs5CYEIsDyqfJ4W10dvATCme4txDI/dDQ9W
         L0pyeWXpqwrPfymTAFiNPjsvAEmumzKIMJtUhsuQBNytqyzjtYCkGel4r0y9pyOO+bZ5
         1bMDYhNpbNf4tfuZS3V407SqVSnwGtAjWsU/nbYb21tQ2PHUrStDmHMvOq1nnrYfrN6B
         KaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783026876; x=1783631676;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5xNoEqWPKSku3siZxSBMOiC0vCdU7+eyeCETDkmLM8=;
        b=bcM1iumzUzU70qp/8SK9i5cJeNoTnsAQtdRBvvOq+c861lZvuMae7eaVJKYgWwYT93
         ecjWxw9m9zoE70KJ4nobVD9fQON0zoCczR64OjpZHF8cNZCCLvazq/4JcQbsU3aQ/QRt
         C71ZpvSWcPsO0XHChBxPDcM4bgK+SVb6sX4lKxKAYahrLk4uF521zf8tyD07q8bUKHSl
         xHUJSpA9kfW2MQUKEYor912dQA4xXcuIO+oIy0DMrtUkf0ElLR2PyOxknnLU0qYeqXxh
         i83gyz1FQ0KTFsuM8xFSbTXD7RQu/gO33qA4nqHMw02rnPaLCOvdG7zHHGUTRJb9Umbt
         nT7g==
X-Forwarded-Encrypted: i=1; AFNElJ9lI4Nw1pP/FlzCR4VizFlApzEjpb5AgV0znKdMPo3eY8afIJxJch3HJAZ4xvv3jCgoyW3d5nY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMv2YYLjWS0IP+RHiiWhEjJRr6WX1M/S4V7Awv15dXatt9ELks
	FUko9dNjNCZYdqwGAhQ0x6W9DD8on/AmOhbrRE4f/BFRoE+ob0Ey/1qK
X-Gm-Gg: AfdE7cnV7jK2XqgcRJuMi5eOfsEQ6FBnwSkgMyJGibOdTtwnGvwMFuV49yFeHSzUPxi
	sSuDVpbu8UKcgw1RekPZp+lcHQ1N6z+bH116nUW3MwL9A8m7wp6/qWfFeYmkVtkMm+NIjDYt3iO
	Ta7glQ90SczKvvViZcUlUmVM8UkNyzv6Xd5CDhhHSErQADY0p8QCGyZc1zel02160w4L/HSQe04
	KjdiqmVfOfamBZeKbCNmGrM+twJrWBYy8WrznZintdKSDla0gJHqftFi1VHxoqhibjVP1rlI2vU
	PacnB4pYf+sevagaEqNKwGR5rjIfl8usNQ/ownFeWKk+Vk7V9pj0vbAhGW3XqM99ne/93ToDmzP
	dPlfh66ZP7bA6wdRouQEFyA6MXNrz6aCUtZUROX0qpdNkM+tyqSUGPZlNbbB2PZQ6oOjbh8WUNs
	ZuFv+vWS0m/T9kH8gW3ULnEk7iG5Ec43A=
X-Received: by 2002:a05:600c:1550:b0:493:c389:d434 with SMTP id 5b1f17b1804b1-493c389d4c0mr100403525e9.15.1783026875554;
        Thu, 02 Jul 2026 14:14:35 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63b6f1bsm69320955e9.10.2026.07.02.14.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 14:14:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 23:14:34 +0200
Message-Id: <DJOE9Y6P3ZOV.371FAU647MOYR@gmail.com>
Cc: "Pradeep Kumar Chitrapu" <quic_pradeepc@quicinc.com>, "P Praneesh"
 <quic_ppranees@quicinc.com>, "Sriram R" <quic_srirrama@quicinc.com>,
 <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel@collabora.com>, "Rameshkumar
 Sundaram" <rameshkumar.sundaram@oss.qualcomm.com>, "Rameshkumar Sundaram"
 <quic_ramess@quicinc.com>, "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2] wifi: ath12k: fix survey indexing across bands
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Matthew Leach" <matthew.leach@collabora.com>, "Jeff Johnson"
 <jjohnson@kernel.org>, "Vasanthakumar Thiagarajan"
 <quic_vthiagar@quicinc.com>, "Baochen Qiang" <quic_bqiang@quicinc.com>,
 "Ramya Gnanasekar" <quic_rgnanase@quicinc.com>, "Karthikeyan Periyasamy"
 <quic_periyasa@quicinc.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260702-ath12-survey-band-fix-v2-1-75b5bdf72a08@collabora.com>
In-Reply-To: <20260702-ath12-survey-band-fix-v2-1-75b5bdf72a08@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_141438_608702_E472E4B8 
X-CRM114-Status: GOOD (  14.82  )
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

On Thu Jul 2, 2026 at 12:50 PM CEST, Matthew Leach wrote:
> When running 'iw dev wlan0 survey dump' the values for the channel busy
> time have the same sequence across bands. This is caused by indexing
> into the ath12k survey array using a band-local index rather than the
> global index passed by mac80211. This results in surveys for 5 GHz and 6
> GHz channels returning values from 2.4 GHz slots, making the survey
> unusable on those bands. Further, there are redundant survey slots for
> multi-radio/single-phy instances.
>
> Fix by moving the survey data into ath12k_hw so multiple radios under a
> single wiphy share one table, and index into it using the global
> mac80211 index. A new spinlock in ath12k_hw serialises access to the
> survey array, which is now shared across all radios under a single hw.
>
> Band busy-times Before this fix:
>
> 2.4 GHz: 9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
> 5 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
> 6 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
>
> After this fix, times are independent:
>
> 2.4 GHz: 23, 5,  5,  12, 2,   12,  26,  5,   3,  1,  27
> 5 GHz:   30, 40, 29, 27, 118, 118, 112, 120, 11, 11, 11
> 6 GHz:   1,  0,  0,  0,  0,   0,   0,   0,   0,  0,  1
>
> Tested-on: wcn7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_=
SILICONZ-1
>

Hello,

I see that this is supposed to work on single phy device, but could someone
do a proper test to ensure that it will work on QCN9274 split phy ?

I know this is a big ask, and usually I would do it, but I do not have a se=
tup
with a new enough kernel running to test this right now.

Thanks

> Fixes: 4f242b1d6996 ("wifi: ath12k: support get_survey mac op for single =
wiphy")
> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>

