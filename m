Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5445FCC9A4
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 00:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=; b=UKVonWN8HfWrBwtKqpd1xHt68B
	TdDoGWFX1emlF3JT55mczd2aOAr3g3lcTXJT4yn1+AKSWqBUR74G9DLRvEOjsl/irpqsWAZkUcgPK
	vXwITjyDu7+UKWdV9+TrYM5BdRtBFprOalLR/jZj70EED0XVjlo/oyTxx5GBhFVyPSlxOF4IAg14l
	fR9LekhoefMIjbxJeMuNN9MzwK7XC7+7iaOTJYXqCJ0g4HGLnMVJKkBgqiECwHXXHdQTyxEFhFuvU
	8LAowY+lnbp2yaRgnD9o9fq09JxDN5/JE8K0RGfWd3KoGIYjKOQIL2iKMnlJpz1/3GncvXoc5pBVK
	vFgox1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkab-00000008MjX-2n8T;
	Tue, 10 Mar 2026 00:04:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkaa-00000008Mim-02uD
	for ath12k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=; b=gOk2bOQ2X+bSinhpeB8yWgn0fY
	PhwpGL2mClh6/fooHSfuGWdaNtwUCTc+0RKGRsBE2o9b2D4zyExI59N0nZ0GGWeUW7K8yfiTROhqK
	08lszR7gzHtDO87xReRZsOus1vsDLUDTWUqdRqL3EEh9Lo0bH8YZ8eY7y49Lr7dlVONaqvWs+b229
	1EHGSMBMMRyzsn4xUvSM9PFTzq0fUJCJD2VfO9zje8eYX3Zp0grWSZdourdiJeshygu9R+OByrbN2
	pK/lm8KfwqMxporYZj3ycrvQNjX0mxP2S15+c4n65OESAAGmhb6IFZlhhhn/+QzQ0nrNhPh0g8NAj
	3divHUCw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkaW-00000006nno-32Yx
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 00:04:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCFpd1212200
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FiLdFIOl9PlXIMdxcVYmcXmw
	vstc2sRWR+kyhh3rVZM=; b=QfWNIKkC9L6ATOW8Ig/yhvIj62nRnrFOVe6u0i4i
	4SZ32G4q13/XjC6wjoBiX8F1pTq3XNepVaYX0T+oyA2Q9Vm3uK67nIaUFji9Pyf+
	ipBJ4RGGeoO5nDlAEtl1fSE8dMVjD79050LVrVqXE/Wa2IY3y6Bh1B+ZCb33sO3Y
	8XKi0FbmrtdoLFWScHZ6pvb0EVSLgjVdOh2eWTsoDOnWCS26vX8XHk0bTQGDg4l1
	Jjxjac5njC0WUG+OdkzWWBJZN/M7cvotNl1JQ1hBhVteDkljpcTmOXMzFSmrOMNJ
	KZhxmLXuEJU3I/67AV33kt7aK5/Xuy3rGFoZvqswBhG4NQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj4jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so1070733585a.1
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 17:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101078; x=1773705878; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=;
        b=UMmNZlkSNY2u7vL6F4UHFQ5B/m27CzY6T8+TPLy6BW48q+SYLOyuX4ceaPfp7wUP8i
         90l6JpkvMuwdsG5YiLEdRIfIJZ39kuEpMqHPvewYBgCorHB8pe24csTnZjIw6JQxXKgG
         ExuavGvJ0fG9vMSkN/6alAEBmAP9TBiM93/RQPm6Ld0EdbLXzyx1H14sVY7DmlByV4kI
         WL66p4XT1cTD11GElsdS80g4pZ0Wa12AP3K2DEg4pM7c0LY7dQEGxyjt8/4b1aOwe5xN
         hwn19Xv9UJA2DMJnYZJOUWBpALS9y++WlE3ss5pfEYZTNMkAE6LJDKRUd+XxWXgIDOGO
         GZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101078; x=1773705878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=;
        b=dmGO7RIgzOj29BdDPuV7MUETZkH0ax9dSWTvnIzpfmA57YcIzBCiVSB5fmEY0M//rp
         VsiG71GTqo8SQEKwcu8zkwf0ZD0Xot4qMqmhJzby81SL+UQIbbDTVvh1h8pIN2CBlOrj
         nJ6u4Egq6k5hIkDxWU0b/8ety0ckEamIFxX1cd+2e9PVuiX2Xi5cOYyCcNP8qhxkOp1P
         pZXrF1ZLENgX2PLz6KDm5IXPL3melhbyTD4AR6cKKyzeBxUN7w1Zp40tgbsuC3HrNihy
         Ojdw58Oi/uer/cbdbl3866ijBLKFgqDUhBc1KP504lbIevZjulwCi1/qG8WYmtUB69Yx
         3m/w==
X-Forwarded-Encrypted: i=1; AJvYcCWUJbYO9/5iNnanY31z7VuEMey1fOSQVSyzDatedkXvuplqmwgeBo4I/7w8hqm2pFjWl9/eSOk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDtilk57q0BhsNhqkepD74IGgl+kVee6RVkUXEAh4Sg95/M4w8
	YIKi9zY9t8ggWLFGNm2XgB9HLgk/uguea46uXO5hfptiSJI+A9Iyxjsg3BrzMSGjHqKygWSk3h0
	nQaVmC1i/8COSGANuyYjV0H5TqXvlPs4YJQkO1qjI22AOT+nWsaIjIeQvMJ+6LiTz
X-Gm-Gg: ATEYQzwHD53thK/qLtYwXW/v/qp6ltB4sA1cAG3e9Ijgj5JEwjPlBZZp/+Im+V9KNBy
	eYBK9a6eZ0iwUnMWBWAIMpnlHhYYey6NsMzqffpsZpsZD/DoF2DeNIUJMe9kR2fRVZBuImJtvsl
	XJnKj1HVtsI00ZY2xBrcz/DVBEYGzQRNgjqDIThTrg179VtGs8CVlqw0W4hV+E9D01g5jKDXp16
	j+tbcVE9kI+TCCiAHrDyIXoNF/Bw+fr4FiDj9nnnEXVFc1hOVLOgPMnhLYFqAkUA3YJB2DyMgkB
	8NWkxaYB/yLOu8e8KudxEUadtbEhUj8ZEY+JJQBWuK8zo9gzOuat3ybTc+AXKlrJc+8TqlqqwkQ
	yeZtF8Yzrqu0T1is4t6zJE5CvHr0n85gZgqYfdwPIZHpt+7vr1/ZyiIX78DE9xCE1Lp+qI8w3ec
	c9QpYQGqsTa4kke5qqyTIO20owanv3ixPiCIg=
X-Received: by 2002:a05:620a:4055:b0:8cd:8938:eff4 with SMTP id af79cd13be357-8cd8938f34amr639762185a.16.1773101077977;
        Mon, 09 Mar 2026 17:04:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4055:b0:8cd:8938:eff4 with SMTP id af79cd13be357-8cd8938f34amr639757885a.16.1773101077459;
        Mon, 09 Mar 2026 17:04:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1139sm2074911fa.5.2026.03.09.17.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:04:36 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:04:33 +0200
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
Subject: Re: [PATCH v1 2/8] net: ipa: Use the unified QMI service ID instead
 of defining it locally
Message-ID: <4py26yy2xkroj26amwxu6q3ynlvla5fmoyju7xu57ncgo7zswb@dvujowt2rxmm>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af6016 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=R5u7ATk22_IFkQxjSk0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Iq4FraGlZMKVJ2eaT9dVpCp1fRFsKMOt
X-Proofpoint-GUID: Iq4FraGlZMKVJ2eaT9dVpCp1fRFsKMOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX9pDQsvAIVNJ7
 Jtm13/5qpU9vgWXDoYvx01XDtPuoy1/c7o0AQAnkpzbGKQhNvhnY/0eRf8234DHNC19nWjfnpcf
 NWLAb35gFpGe6zy7J/8i2sqQ1w+uzKjMBpjekvpyMNUeJ0b1oBUrraw51F0xe9KSz6j6BgFsgPE
 psvD2SS33ArNvqUkwQl7sojsS/NnWXl0j5ZU9cWoupVhWTMUi9D8eb+RbsbUmGjwqzIHCn0/8DI
 N9q8+GdjpupvGRVrPbf/2dkPhE8wGCeJxGmzxW3DVJeXyz7ulZdmF09d70mxkGFw/UC2lz+Hahf
 1d1QFO7EMwMBLZxKHLb3dXbsEKc2SRd/YsPmKPO/y+LeyR+d0P1QqYKMpklhvkBXnVGnN7meuzn
 lejb1QcIugBiryP7T3DHR1Fx6e0hcut7roMtrUJr4P29V24vL4/V0ix7qANPTs/M6ovXGZwqyai
 EtDjTde7ClSzJK10k+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000441_109200_04DCEDC2 
X-CRM114-Status: GOOD (  13.45  )
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

On Tue, Mar 10, 2026 at 12:03:31AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/net/ipa/ipa_qmi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

