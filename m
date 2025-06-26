Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE41C83026
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O11XQzatHA1yASDGlkteCVGH0IWgWMK9d0eiU8vyEGM=; b=hHFF4xSWWn/7dOzzVgUjqdfvkE
	D7iZn9XhWgn64mXng4UFmyl9L1XyaEl36twgnhKp6BxpPEB9yUJ/e3ku06OZGEZEfbucBccCq0UPW
	SKMq7dtI7gT2S1elLJgQ66vIVPClqtbc9n6Mm3c+rnUop072+3CcEb0UL8NHfIZiP5CLwiHKbzOvk
	c4p6Js5cqWer3itjvRgWSg6aJrLX/6T7KUDvm7lvZG+twq8dP9AZ10aJQ0n7v4OU+l+p88lft/Z5f
	9MUKwpsdI/Ke3SiWNjCTAfo4GOHGqgEUpYKgWGN0hWAgvS0QDOd7vfIs/aL71yvoOGZmge31IuKX2
	BAWcQpwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuT-0000000DCQt-2pk7;
	Fri, 27 Jun 2025 00:25:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoV-0000000D21z-1D7F
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJY45d008621
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O11XQzatHA1yASDGlkteCVGH0IWgWMK9d0eiU8vyEGM=; b=kVNPjn5itPor0KeS
	7Ov9UJLsXx+E4QEwHjMUiogmoaVuBrkwk5fbU01EIp9OamDvzMhgZfGXayXLkXkm
	mNyW1jCoxFbhUcGAimIYjvUPOCHfaLfFPoV4zqFv5seI5EpvwR27c6NUwCfS2tMA
	mXlkR6EyBvj4tvDND118ZgF9CGKcM2AG9A6/bVtuBJ7DW5i0aUBKc4bEjW2MLFWY
	odmFzDNKet7XhTvMQhoZeafkMQ8vlqbVIohJxcY4aPmQjPEj6F7RR0zVIZlfyIFN
	tVvDBtONcmNdrv5IBf53NmNUzOSeTRrrmbg5+rLcOcQ5PQM+hFuEc8vnjmkGL1I1
	Q4PFiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqu8jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-237e6963f70so21005245ad.2
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979717; x=1751584517;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O11XQzatHA1yASDGlkteCVGH0IWgWMK9d0eiU8vyEGM=;
        b=QiGLZeJJOCu8CjX3Wy91BBYTfNRIIjPb8yYnKWG2fyAFL75Y2Rg3I6nkyhCje4O7IN
         AlrxgYNggXR6NQZHbRwylzAO+eIkUVjDzVZDydYOt9lfW5mewzlToLQdx+36n5C7iCpU
         qCe8Rx4NC1bFQMLxUXsflgCkCR7Z/IC1+6GvTA8M10XBFkzalWW/wgUgIHbesISGKxnM
         C6wSiCQRNX5ElyTaW4ktsy2vnKVpGYj6rwPHLRHEy/Z40Co/WwWW3k3PYfY4VVdqVUIS
         zYLM03N9TQUCYa0lYkHNiXNvDDdLBFz759hMpFWDYj6/ca7z2+QvyrnostsU1LHSXgY1
         5BLQ==
X-Gm-Message-State: AOJu0Yyt0/yaHtb3Se6oDoGucdJmRmunFLVQJ46GriFn05WCjhyni0ZY
	AJhmIV1PUbplfIxxoq+SmX9tDjpJLq4KgeyMKnu1SN/Dvpb9PbJ/hQvvGlgxzMmc/++y0B72cUG
	d0JP2VAktPqkJ0Z7W0rEaK4HnuwyJFihsXLt3/T6siXexBiNkjr3QZHyqLHVLzL2LIEb2uTTm
X-Gm-Gg: ASbGnctp0vXHlRi3/B40vBzUKnD/6pRcVVUIV2PpzY+SPrgUimIfv0gvawfcx1avhmG
	h1L3pD43LhvCu0Evs7Tf+OjrnoKOmPSscVxIPv8w8huqRdJDHZKEZskZVOawKyGgFUYt1joAiiX
	LUIi2x/W/7HcbTe9mbAEyx5c/7hIEbnKgXCpw/92xHTviS+gAhSJPqOrdzHoylnq7xFJ69OBBg4
	LtO6qjMtK14f1ugfX+2VQLQ4sxIY3IDOprjuN25Abz/nbGvp5/UZkC7Fk4b2SgjGst6pUPXQSdG
	a4R0xjmuV9lLr2v+nMkrqQ3SSDKg3z5TM1R/2+SIapBKxQeYExwQNnyR/rE=
X-Received: by 2002:a17:903:41c8:b0:224:24d3:6103 with SMTP id d9443c01a7336-23ac46523d1mr18331495ad.35.1750979716985;
        Thu, 26 Jun 2025 16:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJRZ/YV8WDP7uiPZXM7QB7uHxxtcXHfxIByngwgEnbMp6UiFrwF5jg503t2UJQ0ZIkJ3CaFA==
X-Received: by 2002:a17:903:41c8:b0:224:24d3:6103 with SMTP id d9443c01a7336-23ac46523d1mr18330945ad.35.1750979716452;
        Thu, 26 Jun 2025 16:15:16 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:16 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <quic_sarishar@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250603063512.1887652-1-quic_sarishar@quicinc.com>
References: <20250603063512.1887652-1-quic_sarishar@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Add memset and update default
 rate value in wmi tx completion
Message-Id: <175097971586.153431.933903658345273396.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:15 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Swzn8ekvScjB8yFq7d8dudLdz_Q2V_TV
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685dd48e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_Ud3jh0soZ2xRjmNsUsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Swzn8ekvScjB8yFq7d8dudLdz_Q2V_TV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX5X6EB3L/7OQc
 PB1DYsGMzKwCTnT6em8zV5S40OvyZIxm0lohFREofJAUjhk2VlEmmgxEGFBDcbpu2ouchnC/t7K
 OW2i/g02iIF6bk4H6fAgjwmBkxxmZ69FfmOo9X1IHTBkGVm1pRCpz8bwPmsQ1BPd3Q3XUZB8Tyl
 3npkxT60SgTReIG16k6iyOtW9l9yBaHIu2OLtpVm799Z3t9feMXr2FMCEf8aQl+K8gtnRqPdpKj
 dL2hC4KpuWXmms8KrtvVBglQgcjZib3Cu7FX4EjRDQUwIOFzlf1o6DU/AcsvNLoovdxUF0TSj4N
 WfAD4OVO4Ayzj344R8KCldlMxqkDUr6/SK3b5/rSGPgE+R5rjlixHKOk7/KnSbSbUNRPwZUkNPr
 Xeb3VC3KHOX7vVwXWP0JrppVRNrQ2o3oovlI0BSdOQ0cCND2GXhNAI46rwQNPxeg1Wa28bWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=857 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161527_459275_2CF27A2F 
X-CRM114-Status: GOOD (  10.17  )
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


On Tue, 03 Jun 2025 12:05:12 +0530, Sarika Sharma wrote:
> When both AP/STA and monitor interfaces are enabled, ieee80211_tx_status()
> is invoked from two paths: the TX completion handler for data frames
> and the WMI TX completion handler for management frames.
> In the data path, the skb->cb is properly zeroed using memset, but in
> the WMI path, this step is missing.
> 
> As a result, mac80211 encountered uninitialized (junk) values in
> skb->cb when generating the radiotap header for monitor mode, leading
> to invalid radiotap lengths.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add memset and update default rate value in wmi tx completion
      commit: 9903c0986f782dfc511d7638b6f15fb6e8600cd3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


