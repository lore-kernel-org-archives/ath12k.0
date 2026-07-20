Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA571C4451B
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 05:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1uefA3+UQaby4KmgeDxHdUwVrVHdjO8FOubPW0/W2U=; b=KVD781HyNUt9KWNBlE5GBGb540
	FoOHfeqMyPsbXDhAbOaeS3hDddTgZ0q0MjzvCx6SJr1j5nj2aRl1b6mzhGn0Iqj0DmGo/4E7AZNxo
	Shw9L/kTXJIs1Wz+BYh0nt4jaTV5FJrW9RyBxxbqVEGYJErNohUmL/naLiJpxRILvYK5WLzF/5Glz
	6v7MLl2LV1ZIN9ET28AZiKkb7CDZlKzvywK1esQXlieTTbliduZeEPOcbJBWuqGhr7m68hoACv6Kv
	IIszGvrD4mN6LjcG9tZev9drFekcX54JD+i1Ch5ILIJ803X5r+WScFEMUNyFaT/ax5c+UJE5tRyM+
	aehsPIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlh1n-00000005uOw-2Pv4;
	Mon, 20 Jul 2026 05:58:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlh1l-00000005uOb-2KNT
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 05:58:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNt45P757630
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 05:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1uefA3+UQaby4KmgeDxHdUwVrVHdjO8FOubPW0/W2U=; b=kFx8AlDEEVK1tFBS
	QtkWDo34XI5Q4pBIvOP125535m8TWAnf+AwnKPp7kot0WQ3UVBwOPIzChnF2JqgW
	O0dpu51QKdVl8lYRs5ed9eIUJTbN9qEjRYb2qdr8KMfI04D6yCVOapbKNBLCa1zp
	TDgBmCsBxe/B7M0DgSF05axKwnLLC2HCiTBKGgrR9bQz7eLkZdkchHq1ftuy86T/
	mjW89GzscJvHHwXzpmnn5nEotdvTlulmlwhdghS5NpG6L5nxFWj7x1R7Kccxzalq
	tNIqWhTNiF47Bsyb2tNO8Y3Jyfxes2HOJHU43w7ha1inYc8jXBhGawRqviXe68Em
	U84fZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnmk1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 05:58:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf6acd760cso7653985ad.3
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 22:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527135; x=1785131935; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x1uefA3+UQaby4KmgeDxHdUwVrVHdjO8FOubPW0/W2U=;
        b=Equv3XCrcIb61teQkY3wVaGLIh367B21gFUdF/xYv56cFx7ZFUZUjRXv7CRYcby8cO
         Ch4YGt0fvutnqVRZ6sLcaVeZAsnifwrrD8RM9vnndFWSYsecbjk4gXdNfDkHP+FtKvEw
         8PGn3ia+O62prewCvS+3yxTIVYlrtwCU0AoJ5qAy1QYGwP2+M4tmfx8Ds8Lnx7N+Rmoc
         gmHaOrPzWiaKgLV2cJngOWPsVL8A+B5pBNUAg6d0QwXhhP+7A95T12ZaSe7+k3Kc/tnU
         1YS/AWxvApYDZsKvmo6aUrvHH2Ql5hB/qaQ2XNau77LDtz8EG0ozvTRlCeQPR4iAImVo
         cNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527135; x=1785131935;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1uefA3+UQaby4KmgeDxHdUwVrVHdjO8FOubPW0/W2U=;
        b=McfBTFnuPtbOSbw7V5/HcHxBYc6gkVRy4PstZhyPMX0ZkUXdOqhoXUNzVnhk3ygVjM
         n7MlyHyd2EUhR1O87wPYT8P2zPCUZP+wjfttCl3g0kIqYuSzuXudpmu3ZXYUiuy0VSf6
         taEUaBSnKtYy7OeSvwYAJxDbCU9ci2Vng4Vu+6/LWQDu9J66vp7cgi7eVtcLiRp1vwG3
         ecH9HkHLmK++DrCix3cqtdC+geCu+CfvfmoQh1YNStXOB9cntI4KvvSzurO2bzR5PgLE
         TsoBuwnDQtmmNm4pGKs+mjevfjuq+NpLe719e46O4gMd8d4ipGJqt7EW+2VnMhezlW4j
         s36g==
X-Forwarded-Encrypted: i=1; AHgh+RqYYtAsoaFlUmOnymZufOv5sL/NNhDArFP164C0jUI0s7J1s879j7ozf1d2E9e90GKemlFnfr4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh7CynSSJIrEV9D6vGYlP8xpaboTpAawsqBJB1SKuRvbpQRQt5
	gVsxCZdn9K6Vnu/hJZmN7w3AzZPT51AYxBgrWleN3jfyYB9QsPX/yM6CKVlGjFtRO11S6UCrG4b
	H4Mm42mLGR00kYUk31GiFK4QQbBdF36LYm+sH0hPsCNMlGuarSaPn3L/HUK1uXniJ
X-Gm-Gg: AfdE7ckF26slJPPQ5ltZ8pHUWWSeofLH8q1dswwDjQAGFOMtYdKDZLI9FXRpEnimRpN
	kIC/gqiofwkm35qQqxM3CyvrI5cWESWKFavO2KLo7QmYj7ABvG+CZwOAdBhE1Ye/kLrJl3tRKhY
	BgO2l7/LbTaszxh4OgcZyRX1NGD90uOMFdy+e0OL/1JgppZ34ag+DAOglXeHiYwZmgQx0Okwd0Y
	BFoOc5NasYYX1GP4LCqViZ67smv+9m+/Iv5foKQdsgrhx7AL5YQDL1cqoHaFZBqsVXCJmN50nKe
	0/dp6FeL4FC6cveao05fTgb3u50526OGGeQNxyWEDT8Cs60b+BanKEIXewPtdbP+fFNunBRJGzI
	ZHSvTwH3RD2l4+ElNZyhCp8HD+wI45hRyaBLiRQRfhpOj2wHVVNZ/JqrQBKEFeQXacGPvZGGS
X-Received: by 2002:a17:903:1c7:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cf349fb45amr137301505ad.35.1784527135383;
        Sun, 19 Jul 2026 22:58:55 -0700 (PDT)
X-Received: by 2002:a17:903:1c7:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cf349fb45amr137301255ad.35.1784527134898;
        Sun, 19 Jul 2026 22:58:54 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347119dfsm50212035ad.56.2026.07.19.22.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 22:58:53 -0700 (PDT)
Message-ID: <4153e4d7-6ede-429c-b059-84e48371d35f@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 13:58:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: fix survey indexing across bands
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R
 <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20260703-ath12-survey-band-fix-v3-1-2fb050c2505a@collabora.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260703-ath12-survey-band-fix-v3-1-2fb050c2505a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3SKCDaR0JtCDXYfFf17fV7sozk2S1hT6
X-Proofpoint-ORIG-GUID: 3SKCDaR0JtCDXYfFf17fV7sozk2S1hT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NCBTYWx0ZWRfXwgWP9LgLBuGN
 nDRJAJFB3n2FdxiYP+Jny6ruyEnlJDd/KHvPrlyDR7S3XmqaSZ7V8sif4c9RGOEp/xe8PRX5wtN
 O15hQnvjMswSCFDw5Lwlvj1Sx0Pkqp4sl4FBTK1AEPT1VLgncvdMSos772yEbEGwCtPMrP0r4km
 GvA0CFXOaHLNyDvvk6e4w7Cp/jlE2JNglSkaxR6LS3GL2E4X254GW46kTZGbZY3f6ZuCqBZ5CG2
 C8mo1tkz++SrgKe+t0jcF2USCQVSMA8XcU5wMv7TX78gcLZwk9tTATJUEsXCxJoZn1CTTyzJ2uc
 vMg0FGyvXqk5MK2ThNIEdPR3zwYuz0WzcWHCXrK76lvcfYRfbm6TjHeJiJc9i65kWpf/dpVXPDj
 RfzxnfNJMmFUywrppp6U+vDEGITIWvZXaVPTbnfGtGQFKnhPFLKr+HXO7Mafb8AdeT6yVNwMyzP
 PQCfjVs6F80iUCQ21vQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NCBTYWx0ZWRfXwZJeZLmFrtQH
 Mv6GCepVo65as4Dzff+PQLWFdwDB33ufilClmfWbK/iby2Dwi4eO1lXH1NuV4AYeH0I9eP0oiMN
 mpZQ2vsm31WXFlBHxNjbnSvppP6uXK4=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5db920 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=GUBCPiHTW_XQuGLVs6sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_225857_738062_267B74F5 
X-CRM114-Status: GOOD (  12.61  )
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



On 7/3/2026 11:56 PM, Matthew Leach wrote:
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
> Tested-on: wcn7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Fixes: 4f242b1d6996 ("wifi: ath12k: support get_survey mac op for single wiphy")
> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


