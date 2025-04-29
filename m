Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21481C369CB
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 05:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA8DttvezShyXEK6Bv9AR3jzIX6m84IOgjCa99x3Z3A=; b=sRdedscS0+Lr94QR96SXfhDJzV
	Tqz/HpH6uFO7gFKlK7mjrirYec88BEGU54FfjjBU3nxsFpQJ/hZ/ie3VlfwlRs5eqDx8p7Nf71stZ
	K/B5P6enI3cdDm/rFUjHZb6FJHBsp77TxQtb/0HyQKg4y29PL4WHZBEGwjgUmIBiSNdRC2D6PDuIG
	uU3Bu/A73Jf8tDMnmQ/4nh9mgwmfHrjanNiKEkpnybvez1+NfFrzdVgm1KUyNIbJ91N/uh/uLOTAs
	0lBecY0XO9RBFTvrJ9VprG9XJppYFBE81J7gSPL2c2QlaShzkw1nhq1TlRthxUPWtt0CJzkiDpSCq
	DuD/o84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dM8-00000008MtV-37SY;
	Tue, 29 Apr 2025 05:18:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dM5-00000008Mt7-21W3
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 05:18:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq0T4030000
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 05:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cA8DttvezShyXEK6Bv9AR3jzIX6m84IOgjCa99x3Z3A=; b=Nv1quYBLu54ABOKh
	jDpLJpuwBK4fQuO+WMPKDj6tpx/bSmVBVzA4FUzKJQjVcilTnIXxCt6d950m3TCm
	KuYRS7rqo6CIu51RuVSucnolkcB7cF5UO3rbuPOqp3DayjJoRGDW3c/HAyQq6Jdl
	zJ9zUEEoqXiJ8XscUPARB5KNVem7go8vy5i+5sgxwwnvimF5Af4sUmhQ3+whEpr4
	gvudwVFv82FivlRxjMD7lY6k9mYcpBzrmpm4U/gxw4Wg2vowBU18zuONumQfjYJY
	JRfUQc5ePWZ75YQp1rQ1SLy64h9JXvoacZWnleKtXR9bqbbIYr6iCNhWXXSHuBW5
	ZEDGIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevjdsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 05:18:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7391d68617cso5355645b3a.0
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 22:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745903883; x=1746508683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cA8DttvezShyXEK6Bv9AR3jzIX6m84IOgjCa99x3Z3A=;
        b=fMaOs+8nTAtk1VYjtrH4KXVz54dJpJmpMNHOcjrgEbh+8ZXWG1ofTfgxGPe7hnB+70
         5UUnabn4yiI6N2G3uvk47l4712ZncwBVnwcv7+Q0WpTvzW4lhZB2w3nmMUq8O1g7FrL9
         xvmguU76cl8/JPYXDYC5pLawR0vfoLxCvgDYUHeIyABGmdW0atuEOJTGuZwoMSiDSahS
         lvW9hUIiiLkaAy5Tfb9JHbIlSRVUccBMezVKh/ye0COyhOBPSm3LEUZEPl/064F8871y
         hK/GBSp9wqE6xCRshrO719HhVOveVDWXuQnIXB0d25YdD/XfP8wJpN9onkG4jDS6wBr8
         43PQ==
X-Forwarded-Encrypted: i=1; AJvYcCX887cQEJAECozlCErcvaYaxciju8yejUJmRO9cAcQa2Pjz2liDS3RQIVik6rmEJ3ROH3MLpHA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWEaIB7vBayrwahdhosiIY2cc5GXRXfDPavlO2duoSA3fUSQA/
	17O6PcU/KRlM9UTBdbqbLFN9LCT8pirLx2EjJk3YDfEiZ3Aut0s7oyJtKMk+xvwbNyMPZHmoFRw
	HPp8fqMQk3N2HYFJY/SSAUlRIetOqRP1Ezyl8ZZ52X1lOGdai9LyzQQkrjByP6EVx94Yb
X-Gm-Gg: ASbGncsV4M4Q29Wd3wvI7wm2ha9AOWVh/b28vnXH9F3LVk8FbGPMbk33BXdYG0Ryvu9
	LXEMdwQn6hxqhZ9IUo2cQJvGyEi3jaTtK7BODz7/NQZWDLhZHJuHuyZlOB7F523Ukrb2Zol/OqW
	P9S+UFPOSp1lCXzAgMAX2m4Ocq55zQa0xa3vzjUMQFtkLPJ/JVxEUea3B4Mrwu+FW+D2LDr4x8z
	9Z4AeGIYDtbkvXPOpDros5Qgz2+7QxitRtl6Lp8GrkVN4gOZaeuZnwvtyxHi3WxcmCXJQrPV6p+
	gPbWpaqqgrfTMvB4Xn5dnerrSw9UVescfF5+jmKhStToJHwzT28Cog==
X-Received: by 2002:a05:6a20:8487:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-2094f479a2bmr2277504637.3.1745903883439;
        Mon, 28 Apr 2025 22:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3upP0c6A0V0zlQysj0bt2oK9Lx16QvU55T1RVoMsFPKHhv3pQyQ3vjpXnpRuCGfqhh4nezg==
X-Received: by 2002:a05:6a20:8487:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-2094f479a2bmr2277481637.3.1745903883052;
        Mon, 28 Apr 2025 22:18:03 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25965b82sm8994435b3a.79.2025.04.28.22.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 22:18:02 -0700 (PDT)
Message-ID: <a5cab792-04c1-15f7-ce36-1b8104082f51@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 10:48:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix asymmetry between
 ath12k_core_init() and ath12k_core_deinit()
Content-Language: en-US
To: Yingying Tang <quic_yintang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250423055650.16230-1-quic_yintang@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250423055650.16230-1-quic_yintang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RX8jgf2nI5g0Wxqha8orD7SZxSFC4pz3
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=6810610c cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=HYYPFgkb9UnnZKMoj5YA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: RX8jgf2nI5g0Wxqha8orD7SZxSFC4pz3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzOCBTYWx0ZWRfXy+EH77APUyDM vpaln1yPmqsq8YS+/vRE0v90WIcPD7g87d41JnqOQsU5M2nUtb2Ad1yk+AqRJLIEMNtNfM28MQe rvFxHO7lRZ9CQfUYeAC4y0uZw/5YOfkm4Ops//z60RxZ/NeqLT5EUZf0ZvqG91SJTjBG9ZNQPmU
 xM/2CZcuotjSqHAOo2iBzmjlhxD51oB7OcEW64ga/7EBSMHyXkBhetOgLjRSjeM1dZCAzAb6X/h 55fk5aanq1/N22v0WQN0i5XaV6x9/fSSKrR2e2WNdVAmff6BlLCI7hIvJGQjBpQe82cW3KuRq9L XRJ3iUN+VLsBv/4+2GvnGQXAyKbXwYxbcKv1klkhcs4sEYBl/HDicQGsQLp8NryU6gJoLWh4Y2U
 +IE6dx9yTvvKbIkI0vXmc3Flj73XFsUFKtKBx7xkgXqWB1g//pTzYewz6JZi2Kdo9wZ0BfSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=435 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_221805_540648_EBFADB96 
X-CRM114-Status: GOOD (  10.30  )
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



On 4/23/2025 11:26 AM, Yingying Tang wrote:
> There is asymmetry between ath12k_core_init and() ath12k_core_deinit().
> It will cause page fault in some case. Reorder and relocate the release of
> resources in ath12k_core_deinit() to avoid this asymmetry issue.
> 
> Yingying Tang (2):
>    wifi: ath12k: Reorder and relocate the release of resources in
>      ath12k_core_deinit()
>    wifi: ath12k: Adjust the process of resource release for ahb bus
> 
>   drivers/net/wireless/ath/ath12k/ahb.c  | 5 ++---
>   drivers/net/wireless/ath/ath12k/core.c | 5 ++---
>   drivers/net/wireless/ath/ath12k/core.h | 1 +
>   drivers/net/wireless/ath/ath12k/pci.c  | 5 ++---
>   4 files changed, 7 insertions(+), 9 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

