Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F41C44500
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 07:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkfKJwLnKe7l6BvxWFlusvv1HVqjZu8lHqA9bY//AHo=; b=X0dI5t8th7VPvDT0jCe4GrbdZj
	idiEQf+wrlPnr9zZOFB7XiSSL6Amr0jce1q2e9YOoB+2a+0p+IgVPydEnaeN6iSeY17oyLNdX/eH5
	+DaFJzmfQ8+iFItpaw29dx0pLUR/XhP2mYy+Uas+YXNd2HrUaPSAUs5a8LfzgJd06DdwcqQosdF6A
	sBFPPuovA5OAyZCDgwUMLZaKaFeiPy4Ghh9Cvk7c27AMjNH1gCrAXla3ji+cz5CxhMj0hBEMmz2iA
	RKTmmlike/9LkwniGXSa05ZXgJJ4yic5iubhUbmeo2RZ57w1z5FcDJmD7gGJN+0f3EDJ3eDBuyjmE
	jJuayPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXw1-00000006Eh7-0ilY;
	Fri, 03 Jul 2026 07:03:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXvv-00000006EfA-2uau
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 07:03:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rbrb3129030
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 07:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wkfKJwLnKe7l6BvxWFlusvv1HVqjZu8lHqA9bY//AHo=; b=WWd0i0kcRIEyUsuH
	fPgilMcZpwwOfIGNiDt87MQFpBKCEpo/lImkJM4J6gZPt0GlxSrVCrF7FkWnW9Pa
	Wt1FYhYNi2UklCr/Y8DFS6gXyG0tvKes9JX3ATrjOpsD+81N7YiRey8HokFutCfG
	yVMkaw3qgdx0KSS2sIZzyFHmD7TqPYhS1WNUpn5QOlEAu9GO5lj1AgrqL0KXOhRe
	r2y6YBnLKivfsb3D6qFac3xvH882B0oAyVmJDEueMWS5fyGOWl4XQ5xpaPlsRuBo
	jdhOm20hv4YUm2wLOYXbhWd4r3mzjSpOdgLBaBlYEcYaHXW/QewYS0yZBiry19RS
	6/8KHQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc4b95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 07:03:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so488333a12.0
        for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 00:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062210; x=1783667010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkfKJwLnKe7l6BvxWFlusvv1HVqjZu8lHqA9bY//AHo=;
        b=Bx17VuUegKZoF8tAea6TubzTf/kYScSRpwZrjLv0mV+iDy14h5cqUhgh0XXoaUC6vc
         rR6G7fWKOLNgig/AUS8l1uPCmqyNk5HT+u0lXdexn1G/pvJSGKFKu1zTeR58r9W+HK3p
         bqLwzZVBecz7mTKFij8o+KAeEl0A668cXWpq5zGYdVdNU+UCoPqji6V+u/D8UtlhLZX7
         Q6SeS568H1IxPZesUXgAgqdtsbzQ7d+nvUTCBYvNz8dbj/gQcoEUqQFT0jsy9ruL9Jbk
         JReSegj+TFb4D54q49dFhh6afJbE4O/0Qt3gBq0Aakp7NUZ0cHCiJIekvZm+U/QEsIBk
         5dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062210; x=1783667010;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkfKJwLnKe7l6BvxWFlusvv1HVqjZu8lHqA9bY//AHo=;
        b=JkvKEdFcxIchsTmHTX3xQcNpGG4rfdyH1tiJx9vROLAhay0QgnrfiorXf8U04sA0zv
         OKJlrLf1G9Q+8jAuC22aSpSiyEEFj3hV6GHmYsCjr6HzGFGTCoxT9Iod43dv05wRQQF4
         LInAzomOJ3Zv7vgg0gLOrYeZPRMymRUXmsySRD6yvcaoRHkc/rLZhB7StdFIF1L5pofH
         b74ExVpQGGzmd412xVEMtdC+R9bF15GwNnGRAJL0vR+r68tIRBM6tYKSvBE+ieGUI1Vr
         tvC6wZLZwBKUEzsKvQDm74IpBzlqzX3QpsHiuEw9ol8+BMw7+mm8ZjmjjaFdT6BPfyNu
         mnog==
X-Forwarded-Encrypted: i=1; AFNElJ8OMoFb0KY+kFQUs7h7kBmygTsvYDdpTwGiDhgbvj+LRNnkqEUgqG3+scbF9ORGbA8OUxRYpNQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUCoFAaSyUEUwKlXuWnq8hThZfc1r/+kAkfFcujU2g0reKIOvN
	PyksLVfmFTN3bLSuMaoLjdMo8/5fFaC3Ea3YPe7qkATsSq162DF1bST+Ob3aouONs8nF1g+thiB
	5ALIfChq+0DJ5GCcjxnsyQzsWj5nT79HudjX+d+C8WNT4IPFrJPD2mQmm5x0u7VNn
X-Gm-Gg: AfdE7cmVcBFC2v9ySv+atKrehi9n+HGGoPHPOQqHw54AgHvozrYjS2pQaEg2p4KWet5
	AK/rvecQhu4ocZo49xYwr9e85KMiAvTuH4Lu0mbvtF4lNTLSSQLWDMWyjhBSJNZrQqdalN5WVZt
	I1FFw4+23bRrJNWOSRTtAjn1swCfJ2JdUgky/d+4fjPfiQ0pq+zakDLMr3t0vSsj5TvVYbSAuj7
	YYiUGId2fLsyX002RPWwurVioKRWgHHLs32gi0Lbs3g4944zpjVbbJt4M+Uw9ZZA8BKrlrHuHjd
	TwK7xJPtowAmuM5y5seUtiWA7OKXJgh5YrNJOxhaUw7RPTJwn6TJyZ/kBnrUv19kI/UyW5Ofoht
	cBzDUgZdwpPiI93IWkfMdQJpfjCkKs66qVa3v+Ttw52l0dGEcQ8wFuIj5U5/Tiv3+/Jo080eVai
	fKuUe0E5GM
X-Received: by 2002:a05:6a21:4688:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3bfed2721b3mr12363084637.19.1783062210543;
        Fri, 03 Jul 2026 00:03:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4688:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3bfed2721b3mr12363045637.19.1783062210031;
        Fri, 03 Jul 2026 00:03:30 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm2384087a12.6.2026.07.03.00.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:03:29 -0700 (PDT)
Message-ID: <454222c5-53e1-4be7-b925-8a9c2bd04fb3@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:03:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Flush the posted write after writing to
 PCIE_SOC_GLOBAL_RESET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623141649.41087-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8POp5BByaAmRhpUZqS4e5jQ1Y2kDXFQv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfX3yRpLPqie54D
 yjqi3s+R+KTo8sKTfBlGBu9ZX+RMiLp/DF+fKlZbuhdoimeXU6rnpoMNm8WEMr0XB3UhIJGGrvs
 o6Vb6xb8JDN2mUM2dqmpFeaZbwQNDorEBQFL41I61FjyLzAf0G5hCkI1Iw5ALVWwk83Kq/vRWlh
 2lYDB2S8sqqNgl2MPAiBZWsZXowdOEqsUh8qN77Vr+dUAfGRFHKXFMZQ1b3ojKi1kMumQvM/n5X
 NtzU3EcoFsMwe5RoSBat4xTsXuJlh2t6aureR/u86Q3fl3+hZ18p1LtpcGK3DO0xnqfl1QSHRsd
 2UAEbP0kyfyhyDn119ExcpeKyQdBE4kmqcgvJPxcV6Zsn4rvkofU+gYlCpe01w2QsPzz6jd2MZs
 u5mkhkw3//9/0cLKVUxofaOBuPoGslMehRMm2FkqMMJvM2CHXeNxWBtUhGyiwnEEco1S0tHPIrn
 oY5dZx3pewQbfZfMNLw==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a475ec3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=fjTVS2QutaehiSyZ5pEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-GUID: 8POp5BByaAmRhpUZqS4e5jQ1Y2kDXFQv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NSBTYWx0ZWRfX2cNXn/6YzoSa
 B4uWTnVg3TxFOdZL7WkWa/GS/3MNZ22I6ZqDiLKt92C0rJ5JDKaL68yKlL8pAu/ecdvx+Rp4pOS
 2GdemSaxYZYAAy1fUGXjAwPxoWd02TM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_000331_753910_8520D244 
X-CRM114-Status: GOOD (  10.95  )
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



On 6/23/2026 10:16 PM, Manivannan Sadhasivam wrote:
> ath12k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
> before the delay.
> 
> Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Reported-by: Alex Williamson <alex@shazbot.org>
> Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

