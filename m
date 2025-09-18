Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B064CAC5A7
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7r7Imi2vfNVSSFkOKQmhXkXZJL+oLzQLqzpBHTEulg=; b=j8BoXZDY/ga+qWZdd9wwqeIb/x
	i8KJbbFwmHty9iI9HX2yhIqGEuapOiNCHTmieLJ42wFsllN5I/4NqJnIATgn1upnpWfi2HP6nn74r
	NC7Na/1sThfLHN07RLBUjOVfLBSlGnHioOXxCQuEfp3STH4T33WdkcRm56EZoAFuv79qXGCWqX0nk
	ER2wSSs1kmJaoYKXftDLeAXP6gPnNuq5D1DJ71kQVwvKrDKYfuqLBVUF7eZy+OHc4IocTeNdEBr5E
	djAg60sC98MjHHGJlW6gLdYOd3az+SNk6b4VVoV5MvlURNZ3zbkhXXy4ULd0QS6XmeQz3TsvT0Uy0
	V3YTgWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLg-00000001Rx1-0n6v;
	Thu, 18 Sep 2025 23:47:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLd-00000001Rt8-37Nz
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IJbTlR029750
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7r7Imi2vfNVSSFkOKQmhXkXZJL+oLzQLqzpBHTEulg=; b=auI2bXpxcDyOoBmF
	/facPtrg7SWI3WTk8sX4ORk/045VlCuojw+r78jcNP0lqL/t+ZMehjEqWL8gZanD
	0oaDnMMIlMARuYbxJ8BjgdLwR96Bl4jxN29pXcD7nKwO3AIRRIGnB+YQM5qEitLl
	1VXlNVEOKw0sojUez9BjL8SY4l3dncOptMKYu67zr95l9VaLCbLVP7m2tTSF0TPP
	RAgC/VsAwZtkrLHWCAjKz3nyuMnWoayIjpLzVHgqncftDlb6xgvMctylpBDgmL9j
	oaBlN1M/yEllqYIAtdXKSFz+gHbNLjmJwmY+uQXIfDE1pUsxyCgGyVxG37613n3y
	HLu+fw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy10bh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581ce13aso29930825ad.2
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239252; x=1758844052;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7r7Imi2vfNVSSFkOKQmhXkXZJL+oLzQLqzpBHTEulg=;
        b=LmaKANOUueoPeeJ/DVxnM8vGS4ycaEYQcO87UEujByvwn3auRQozvguwfmm0KSFasG
         j8t+4akPx9aqivD1pIQJy5IiBrj4Q5wQR3570I2gx3eMpoM5pZAENzyO/mkPkHfhUbO5
         KXOofQyOQy3ByqXZiqYQiMPxSrFqB+7DldTwt8a1h4hlT3SgsiueeNPrrkhtw/vsQXNP
         hpFvBMtlkveAl2RL09OWNcZVHlBLJSHFYtBvr0GcAtR8fo+h8/+jovtuGfoa6QUjCT8q
         BTUZ2WhD0IvkDk2Z1P6Ffo4P1eomfoCT5UD4hS6oYsQmfEAggaR/UDBHbwxVZOPTjVA4
         yTYg==
X-Gm-Message-State: AOJu0Yz4jyjlIHvR9kFpB/zIIdRBpSNvI8gNcwfdW91pRGWhBATUXmyW
	TJ31LRxg1Xf37NL9+0IKDcmzqqlOn4OnKNBSSxd2TQkCC23kCBofrbaVB1/i10sZfXbUKibskXV
	Y/gbSBTQO0iGanA9YIQshFqBswXF1x+fR8baCaA5OnLbAKsHWDQPVijnMMEAnYfBX
X-Gm-Gg: ASbGnctNI/p0KgDadnHuDIoEYNqeen9i2oA+YJsbDKTaMpJyKcS0OmlR3jtuFKsYaij
	MwWQ/G/n/DtVfPpgE4ym2WVRN9v/TrSFaTjgMBHZnGS0An1Q17WG4kzYRj5aL14Q/CIiaIiNdex
	Mk7mjTSPpfDBi+z6cqhmGDMOpOGNeNnQMLGigBaQpSpZbmNuZTL4lAysX+HsIXiRaEIrG2L6k2A
	klsc9w56JM7H9ONS2n3g1mf967a+OJ+jG3zVH4lgc9hDU1o1X5VlBlW52eCJ0LqB0kkXhACKttJ
	qswqtWDsP+ZzNK9/+tUlsSJ0qTUnQSr5iBln7MOO402Uasv9JZ0G8KYfjflgUzxF8TAK8AQknio
	y
X-Received: by 2002:a17:903:234b:b0:269:7427:fe37 with SMTP id d9443c01a7336-269ba512857mr15663465ad.29.1758239252279;
        Thu, 18 Sep 2025 16:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD3D7F7WkpxU5WDuNIA4iddPfpHaW1boJOtIRz+2CMCerf3Ppp907ZNpE5jg4CxUxXkLbfNA==
X-Received: by 2002:a17:903:234b:b0:269:7427:fe37 with SMTP id d9443c01a7336-269ba512857mr15663295ad.29.1758239251845;
        Thu, 18 Sep 2025 16:47:31 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Add support to handle
 inactivity STA kickout event
Message-Id: <175823925118.3217488.6929910029455029263.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:31 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: hEFf1cbueR6tvAn97KvBR6y-1w9jxtEF
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cc9a15 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EoySuBRnP2zY1VZUk8wA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: hEFf1cbueR6tvAn97KvBR6y-1w9jxtEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2SEXGweWIeIp
 M5vrzcxVL+ZV9LLcaUuqkgupeKOdb81Q56q3KNKXtVldyccbidDcJEf3xQmNFIfrmhxzyeteNCG
 RmlFJ+ljNDr3nARMeHokGVO18YM0TL5rr0l4hNI9z+IxFhHPNlgeTTE/4pF4xETCZ3/3OYZdHl4
 k5cm8QR4Ahv5BgvfhStvCr+bpWXMRoryenZIvdgUMymJFZgzmeBZBeAgCXXJdUth7lkQ4y6JLfy
 TjbbfP51lprL/2wzE3/E8PiwLlUaIreZrUiZ63nlrn9GZwc/TwBXs8tNTtZaU4E2mcvWrEdaq/F
 PFFW1+FnYfu8d4KNf/y0czVsdEFwQPo4LIWbUlzUxBThiuJCCG74CEUAX7w/vyLR1r3E4vphKsN
 KqIJtKbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164733_855053_A8B5773B 
X-CRM114-Status: GOOD (  11.62  )
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


On Tue, 12 Aug 2025 16:47:05 +0530, Maharaja Kennadyrajan wrote:
> In this patch series, enhance the WMI_PEER_STA_KICKOUT event by adding
> support for reporting the kickout reason and RSSI value.
> All reason codes are handled by reporting low ACKs, and will be leveraged
> in the future.
> 
> Add support to handle the peer non-AP STA kickout event for the reason
> inactivity.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: enhance the WMI_PEER_STA_KICKOUT event with reasons and RSSI reporting
      commit: 59a2ef69ec1d0a754f9a229adee64c229f70ed36
[2/3] wifi: ath12k: Add support to handle reason inactivity STA kickout event for QCN9274/IPQ5332
      commit: 9891fbd9d8ec1710215b3c1ce1a5e9b3f33b5c1f
[3/3] wifi: ath12k: Extend beacon miss handling for MLO non-AP STA
      commit: dcdb05a43df9d2e40116a1ddd1460846bd98a6e0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


