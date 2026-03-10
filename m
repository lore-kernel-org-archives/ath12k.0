Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06DBFCC9A6
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 00:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=; b=yfs9TZpKsYaiUg1YJnBNawvhqC
	ekGvh9ASpsi1N9zTlVx7LJ0RG8+Shv1ar2+/HOO8Y7wekhlXuRJyyMOiSr+14WOQ/3ovZIztjZL+0
	M6NZijQu5eL+60KniP3ntCo21c3zYjOU6bHGSvX3i+dMDKnoZ5ySh1ckPSIJiid3FPcPbwPLoeVCj
	+ClrrTBcQTbWqtzE8ZNjyON+v+kJbjq4gVjQPXToRlgnAzxmftN/VpbJF/rNSimOEcAJGfNUQNIGH
	OOl0ALihDEmXrivr1xgR+oyeq/xRXTeOXrw0ws5c446dSmb+IP+c6j9xn622eLM28VBhk/qkf1NyY
	FxnvCHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcb-00000008NXG-1cYZ;
	Tue, 10 Mar 2026 00:06:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcZ-00000008NW3-3cku
	for ath12k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=; b=RtUUuIEDHaWwzi4fKvcpjugkIt
	GbapUvaYppBVFT58P9LberdtVbZX8hUulKYsfWTaAyJUGLywdnGsDGjHet9HXILfLQ5P8RcPBM0yQ
	tx5+RvkxL1z9jMP/oeFtXzLsMT/fXnlsotgSoSQ6aL2BdIdRzOQsE7aFJiyEGlUciTpbbjzSVkwoN
	e732VY4GONimKmz05Nrx6NvQBQizrN0GN8hZDLqMvvwjArzslzNdCbQe3jshrWHKYFpZHzZ0pHIG6
	ZBMvee+nyX/5A0T9LWfoazBO7AQrxUxsL8lnscRw/1KqMDBbA9dUi6lUtpoiMnYoGsCVHAd0WG4LY
	wOHrVJng==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcS-0000000DNfH-06gO
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 00:06:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBsfE1203578
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hhzas3m6jtpCWQCVIcrAsr4W
	EI6JkmKF0k2Y62ZMW8M=; b=RH3i+5HmDrcWtIsbYsGLYPAucQJ49p5jSFCP1XK8
	cmD1TTszcORCF20BgNAuXaMv/jJiLRErS8OSN8QmqlCTHyPy1z+QkEdtxohyjYG7
	A2mADZnPK9mA9JpXvpYpZGSIN7dK+BD6vZgH+2IvNkfpcXulgdym5sqCTauzjtkf
	vtuiyUTc65s3tMmjbV0vaKA2UBoopnEDP+Wh4kABNLM7l2sm0CNYv97yvtbjRe+8
	S+oMT8HwInm2qtDIf1ZRhXBmNqquWgIRW4C+P3hXW2N0zjD2euQ9JQXbhB2aEC63
	TEvjc5oqXJ7b/UHtcEB1uZLhcWij+XqY/Bv4WDu7ADTmvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329skv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7f6ac239so1270064285a.2
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101197; x=1773705997; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=XyDmTpyAVjfPz35bZL5Nqrddy8FMQOybneqPqjKtlVKuxTwhmrH1YYExLSNzp9aejK
         zZNBxfMA5ZrMYrV4IMFewpu/HqQHRfIj97/qh8Eh0XiejqYtagcrYj9Nnnnpf0Gp2KFg
         Jh5I5FJampPMPhZOMIsh3FqFBsKdNi2ISmMGk6u6H8xiVEGrUntybIT79j8rszoVnZ/p
         yXEBpWNT0u2pFkbrOA+rg/fT/spjDXAS54ADc7Wjr7HUPoGx8sRn/wSRepbjq7QTfH+7
         2jYt1qD/H48hHiCb5+jBKxV0R34hiCkhHxLx/+jqx0j+ErlMngFSpB3pLGKNuUg81yju
         0lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101197; x=1773705997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=hnAM1wjJ2N0CQGe4sK0LRJRh1O8jq8xrU/2UanhSbqr9jjvfzpiYxib8ZDEA1gZYTk
         NoqtTemOMH2LaC46LBBJOvrAFuDjBBuuGrJC4WqjqVmNI1b6H3dwfalJwzgr+7LSykbs
         oBCqANilbIhkwsZK77AIP/0aoNBqVvTPlJ5NWXHehEek6MpI0XSUpYQofggJg3qnkH2a
         OFOqC/93LQRHOC72uoRlYNBOdV4ElwEHbOvhhtBvtG6DFVzZpZZ/Evter2hhyH08p5vK
         x7MX9Ba+iB0F+GjfKawjo+l9SoTkOEnK6Gx+6wNzXPFk3b6rYYfePvIax8Qpuci5OyxY
         sOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvJI68G2ENxrM+nPD90w7X+updiT3XU6GcIiq2ttS1/eHQT9FK6CM6aNVF8S+O0AL5QdjYW28=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVROR63akuZ0iO0ScSZZU0pkvJsMaezEe6xk0D5hjc+tpl+bam
	bSY96TzoXH1tt7z/MMxDkiwc93KZUnHYop2YIXcIahhPYjihbFZiPwmKomlRTFLOerLghU3DjGC
	Mn1gYZhNfZliz05U8Qlywm+4viBWn0JlPbLzNbkceQk4F91ixn+MaJVmqdke7iwq5
X-Gm-Gg: ATEYQzxacuEkire7VZG7XRNRlrINxmad89+35Fh9uHyzFvnlM1yw9e3b1iJZyiH8ReE
	hnUVBdp96jKwHOQw6v0d2T8YaBw+P1bq+21d8RJafU0h3uV9r6DNkuM4/2FGDCpW8rO1Nk1hpQF
	rfB0dNXcG8vvZJDznYj7yPQkEyBcNNBnhlogFSkeFspHGirUTn9AeNb3Tom1fYiyqal3TjUPQNM
	37rIrZNLM0tM4peFTjIBPeh0duzavLLXaU9DBOSP13QHQ85BBt/B4cyM8gFVGQZ4zJmzsiOXksn
	w8Zf5YNYnYjbWU8mwuCeIU847mJJqXPNTYQaMjTzP9LvU8A83rZDD839lH2SILgQu9LfqrKBH9/
	JzCgkl/G+i9E1J/lp2R9Zoi7Df/J7bRuViYQvZTSBxqFGz37BLy+3jU/JOSE0VNbB6mQqCFYRm2
	0RDqeDH6ctP3LUqcHxfXJk3CAFJpCZE+9n0pQ=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491596985a.78.1773101196846;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491592585a.78.1773101196256;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d269sm2464700e87.84.2026.03.09.17.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 5/8] slimbus: qcom-ngd-ctrl: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6dvg5nev7sbqyfhmzgw3oln7hb4b4jlw2yhrskrcibdscoziox@hir4jpjcrzey>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX/Lu0Eq/PfL2q
 w0RCNdFNTmG4pb6ICf5vdCI+XOK6ds5DPnRG2YoqHCsqm70bN03EjsrsGW4Qpx3M3dV7fhIxP84
 lWqaBKvJHjgsAtn0amj/p9Khc06CBqZAbYIL4R0mTrtRAew+x7ChKnk5Y0cyEyHWL2TJivEkfbd
 F8RlBrtYzLmEWp94OTDTScW+vLj1C5CdOYuKZN0feOW1qDbKci6VB9SMHA8bcaNmHbXT8pRi8n8
 sI/McBjbTrmSYtEIcCSd2lMnTcWfkP8b+rRQVq/b8bubbVWm9bISMqPldiWRmGkAqsVVv73rpYw
 wEizjligXgewfdTFTR/hj3uaryoraZKy9Rjy4VZdZflPYu6PkVjtoYE98eCtOTfz71IogeAGQrI
 742mZM6SNaDEV4Av7+r5cUZFCDvBUpP2nGXTysH26ApNAtR1tdj261VOm/BNnbcKa+41qoC/0Eh
 qt2tnr6dCMvvXsdOhBA==
X-Proofpoint-ORIG-GUID: ZjUl4CZ3mW-OFT-NAKLQECIUJMfgzNqp
X-Proofpoint-GUID: ZjUl4CZ3mW-OFT-NAKLQECIUJMfgzNqp
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af608d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ho3SWJPnPTLIVTUpvTwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000642_414606_D4B7A682 
X-CRM114-Status: GOOD (  14.95  )
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

On Tue, Mar 10, 2026 at 12:03:34AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

