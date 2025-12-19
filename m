Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E529D7495D
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 07:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZlzaaEJ6wxrrcHssXM1jJEht5vIfXbpqNRS80n6cZ8=; b=xOQCpeDqrSFMdh6Vy4ebE2Vn7y
	xmfqX0XneE7QwXo+y0RjsMKmJ+Hd/j+PfgkUxr402408dwByFkhZQazr2eCNWrpS6MYzvxR2wp1qe
	Japoqqf1LWuSB3Xr8KjfRqe71PpKnLjZF1gFRlMfU1z4Zo5BjoMyoU85LmdJoI0CaE0F8tiaroWY0
	0HIMIjS4Cd2c/g2CHylRKf9REt8BgoR+CRx4cXjlTNKlqurDz77BQWfNN60l3YOaLlxr++5v20OZo
	cZEbyGWpfz0Cp7sVecxsqdIYiMszuyBc/X9rylxFslzvbQUabExOIfU38uv5Z+7wP4nqKIwfeEklw
	5MQ0YaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVFP-00000009mZk-0hfg;
	Fri, 19 Dec 2025 07:49:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVFM-00000009mZM-2OGA
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 07:49:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4d7jk1772623
	for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 07:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZlzaaEJ6wxrrcHssXM1jJEht5vIfXbpqNRS80n6cZ8=; b=jZxJbtS1W6GgHqih
	mSQIj+D1ySnkzbLM9dida1U9KcUTKSx7SCo3yNCosar9C5FdSiSlcGLC001spZHQ
	rZK+aFA9mgjPeGU4XSe+caMW4MGosjZjDHKNnpM/1L/mDnc45vwlQ31iO1P/VN8x
	0qN1eUDM5kCCxh76fBV1/pigynGoeSm0KOcdknRO/5lCE3LTWSfEOU9nNOMgNDjL
	sQOlG3eG9lOyT01j2BVLjSDJkEFaxEtLieb1Bh0NNM20yFsAdVNnO2v2YtecgMzU
	6lYXXzw8LFLtjWFGZuPO83cJwyrcAPwevp/vTFg/7YgzBmU1953+rg7CFiWnWk3x
	kz2cZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bhs1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 07:49:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso33950141cf.3
        for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 23:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130595; x=1766735395; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZlzaaEJ6wxrrcHssXM1jJEht5vIfXbpqNRS80n6cZ8=;
        b=aKT3Jz3y8oxJ8Lp214uwDCOaquxsFSmINpWQVs3dT6jtoCRH6eGvyUNyeCzGsuQrYb
         QK6hVq6s1U2sAQ9s3nj4RdAQSFfdhjM/ReMucGHUtu1R1YoWKiEY89WSd0VFpzXhIwSI
         q+f8aZKFhZ3kWFV5iSzup+Z88iUYt25U/IJIShfUv0DVN5HMC8hxg9Teh4YIvM0K35uh
         wowArxX4j0mA9XBAYggV8Tu+OtknsKPhuOYA7yQv+LKjz/UEzTzaumioEjklXlOcrUGz
         3ZJBL392k3Gq6cZFIU/wJIL3/50eXO/w7fNHRI/ojaG5u319RoL/JtSeuNNyq0lrAlzK
         MzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130595; x=1766735395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZlzaaEJ6wxrrcHssXM1jJEht5vIfXbpqNRS80n6cZ8=;
        b=EivLg/pw5zCbU8gAAI9RUNW/1dlRgClFhQCS23Lybpr+cnsKLrhF9LqWbXj3G0UhW0
         mwqDTncewsRa+yxafWbs7FQWjfHF/wR85sfrK44oVnWeL1C01HhN58ZRdKOsUI4/Sr3n
         4i0lc6rUUhuf8hlPIaxdGbbUEzAvfDGBxWDsztmmc9nw6tBjAE2Nt/7qvB1qrSR1IamK
         5QBul1+rDXibprWx1J69IrRjb62/1GSTTe58tZ1vo0FC38eMRJNhHHxRnFcb2tyJSNOb
         Knz4y9xCzFwowDg70rmc0qVm8E9Rhm7Dv7Pzhn8u671BXJZKmKQCcWgxgdGIB0OJ7zLu
         Gm3w==
X-Forwarded-Encrypted: i=1; AJvYcCX109XuywehTnl6Vl5m3WNRoWARbC8zE14WyxtTEjrM1H+Zs21o1imnldrLDRJPSU9b2UJPCNs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxA1uZa5Fx3yy1SR3VA0AuSEepjfiyN230hWfiVDTZCSnjaQiO+
	rV2DyKD6e5cNF42EDgTzEoB6UzHqS91JVtWt8q8Y/LMlAkpT7vbjFd9qwxvHfHWwaG9+QVrt9m6
	LsDdYY9ABpGIEDM1AfVNK5s8iFky2T/D7iykVhqzQ/rTyIpUjnZHKVh9izX+bE0F7
X-Gm-Gg: AY/fxX7nntWOAwtt3Ht6l8fPoLbp9Ko/FaP+Yb2zYFP10OHSuJRddzWsfEGPHSzpmiq
	TDxxrOzjl0tObLnI8byKbqWI3NzwROtAjlF/+Isd/2XLemwVpIkIY/VS1HkYZECe9Gx3PEb9PR4
	GzOk/j2wY+oiR9Dja/AglmdTa0o7dAmv87q3ULVk1zWkANbzv2KxsYME5SpzCqfMGKqcSsvg/mo
	8pBs4UE8yc6mHbZatkyjFda22/OqjHfWkUyrolNbPV49b2b9TrZLg7Czo+r61QwB2vurflq1wYO
	SvyHNRMrxZz3+z2UStcgA3t+wD2u2rXyyTUco7zUtXW5AO8dkKN7hosIHediHHQrKdnJ9Mcy7my
	WfRWgymxEC+sbMq0WCV/llAt9+RX0b5PYgQ6j70mRFKqJD2NdbyEClqmGUqeK+MCv34GQ4XjOwF
	DuJ+oB+ehu8fpkIuL00G5QNU4=
X-Received: by 2002:a05:622a:1f15:b0:4ee:87a:4d10 with SMTP id d75a77b69052e-4f4abdb63a4mr23026431cf.78.1766130594718;
        Thu, 18 Dec 2025 23:49:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0rwAFeOYFYWNd8aqh9qwfojG37bl+Qt7bAMn6Hl/AMKiwrZmA4fsYM77wdMC6YdUhqmP2Xg==
X-Received: by 2002:a05:622a:1f15:b0:4ee:87a:4d10 with SMTP id d75a77b69052e-4f4abdb63a4mr23026211cf.78.1766130594219;
        Thu, 18 Dec 2025 23:49:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ea6sm487096e87.5.2025.12.18.23.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:49:53 -0800 (PST)
Date: Fri, 19 Dec 2025 09:49:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jerome.debretagne@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
Subject: Re: [PATCH v4 4/6] platform/surface: aggregator_registry: Add
 Surface Pro 11 (QCOM)
Message-ID: <njdekii3plrcrbno743lpspc7vxozbfkf2s4vdft5huoo6iyan@usu5pn4527kx>
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-4-7bcf83c1504a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-surface-sp11-for-next-v4-4-7bcf83c1504a@gmail.com>
X-Proofpoint-GUID: -V5vlcJ4PHhUWHzo1FwBeNnZG9FWLNvM
X-Proofpoint-ORIG-GUID: -V5vlcJ4PHhUWHzo1FwBeNnZG9FWLNvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MyBTYWx0ZWRfXyi0Whk00b79m
 fDoFrq3JECF+9B/xD7qzuZP1VWgNqUzAwplcC1EC7P/nX8MRYJOWKj7gn3da1DpptvNIp+MlVON
 vp4y41XrSRuzoFH4NLe/B10vwP2OPQpMjZJaH8UjiB7ClEq5mbml3uDzsy6m325UJlvN45ojqT/
 DftmIvQyHUyV6LeBKs2IN7lbcg61fz1nTGm9RkYzlx3tZ1ALWfmMLMNdZn7sbT7WpAy0llxaIep
 C5E28yWMCnz6KcRkDFUHYknP2h9PDrWfbZbN5mTBg1SX4U3G9KGHAd/kcJrkN3MNXjfpLiojwcj
 JwlWPpPWkat2YQVtuNevRs3Y6Lsmzn7EYJsNu8JQG8ud3cPmq0ncXKA/Nkdb1++JPRsf1cDgJ1M
 KQtGnJXyBiOUH+FoGi/YqBVgGIsqbvgmKHL4Nhjkjq1YjuvELX4Cy/Yi/mmOf0Qr3XyQvi342/L
 w8SaB+VnI7fnSyLJioA==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=694503a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3uxqv5YaM5NtnTnEUcoA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_234956_636587_D837660F 
X-CRM114-Status: GOOD (  11.97  )
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

On Thu, Dec 18, 2025 at 11:22:10PM +0100, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> This enables support for the Qualcomm-based Surface Pro 11.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

