Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E37C35FF3
	for <ath12k@archiver.kernel.org>; Fri, 21 Mar 2025 04:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWfO2BcPvIMHXrjWEJOrynRVKuEBJtq4aHvLkmmDT70=; b=voBn2Ro85lrTmujQiCAE7SUIll
	o+z6EaM2e01Bpi1RNvZ3N9i+P5Q/SU0wP+EJOpOucVtwIpXjljgQsDRs7ulvOknPkhptm5dcgZzC6
	+HrauLoc8J1LB23JcHuErm79pcr+848pxN8ViJtXsCVZIc7kS5olwef+wrgDnFH0b5LjQZxxbWZ66
	0iJ9WiP/RmeMJeGiDlFsv1Ht1DKkKW1KpXZEwUogBt4PipCCFLRvpicB94CzeIXi11s9IRA/fWU7z
	oBRqgHG+g3IVQneZFWYJWdVlf4yj7KazP5nfdnkwUS0cgoRu/vwAVKyzbEC8utEFYCX0xjv3GOqpz
	FArqSdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvTb7-0000000Dn2n-0aqr
	for ath12k@archiver.kernel.org;
	Fri, 21 Mar 2025 04:03:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvTb4-0000000Dn2B-12jF
	for ath12k@lists.infradead.org;
	Fri, 21 Mar 2025 04:03:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1Wgq7002291
	for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 04:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWfO2BcPvIMHXrjWEJOrynRVKuEBJtq4aHvLkmmDT70=; b=QyYjGOmLUpxclaAK
	dDWaouWtz19mMXVHiiBtHFF7Ox5e4xP5Is3hMPKf9opGpXUpy5H7xPAZH6aQ8JgR
	OkvR4z4sJTLj8HjaKMPByG2akwKsCI25J0Cleo3wlhaX1fGbmKOigHN9W1viKlPE
	vkEg38tSWf36Egc4sy28/6dKcYSUK3Sk7/ZP9ak1j4700OwBurVWOSQzcytX6S5+
	HbnfvwI4tmOBqAe5W9HK7Lud69c9LfZJyoA8NxbQajo+0CY1PVftr2XdR4XAcmAE
	RaIQZi1h1jDWlONlFAfcXFsGThsx6oWpiJ7SRH4NsiHD9XyT0a4JQAtcle+QBSPc
	06ka2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmc3sru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 04:03:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff6943febeso2092193a91.0
        for <ath12k@lists.infradead.org>; Thu, 20 Mar 2025 21:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742529779; x=1743134579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWfO2BcPvIMHXrjWEJOrynRVKuEBJtq4aHvLkmmDT70=;
        b=DtwhvbjY6jZ8t6KLO2oVq3qpJl56r5QyihRl0hN9xOiZxtGY5OmT46FJYTEUbcsv9T
         18Fia2WJmw6q/pW30z7ONeYD3OgxekOGBqFx3Q1Zt7cgHc+p8wft8xJm5McdH6kDE/k9
         ZXT0wDohouRaoCMWDqEM4Kr3ebuWW/PCbSHSoX41txEZv5mqEozzddyrAwLVQf6nfK3W
         P7IHOm5AG0Cr4lHiSfhEBIs/roMlsuzwgZFin16LS1PSTLJltTcOO2nHB9vGj8dvvsLu
         8VDjQ0WBAm1fyp0CVw/jhzo8ZMGjlja6j6RqjWxkpUfVBw8dQ1lelFTTmI/KER8tO7Aa
         zr5w==
X-Forwarded-Encrypted: i=1; AJvYcCWYr30e+OkZ5isZLJVIg93NuikDLOr+7txtcHKAnOmZUW30AsIv9+ORQITSqYcgoAt+uF4iP0M=@lists.infradead.org
X-Gm-Message-State: AOJu0YygKO76/+gxWjD6o0t666Lvg4vHfjXVAN/oDZnBvH0rqwftV6dH
	yI3UPB15P/YJcMGixWe7ehkLqGaBvUONeFr3g3l+/rAVYN4nWqc4/1sq/yFO+OmAukiKf3vV022
	m1zKAXoxNr9Zukq0D4kBKuhB3WyWfkpdfJGjeNhGdcjBOEzakx6GGW9fhAsu2RIMY9zAm
X-Gm-Gg: ASbGncveMJjjdVccP5mT8nSVtCB6s7n9oHdS+46Er0OTATyObfnPqy0kaQEFCqJNyKM
	mfAEO2xFBX0Fqn7Fsym6We5uSbcOsk92bqXxcnA9q+ETrWam/y01WyQqHCitRBJmCd9KCTcZs+L
	jk44dOXtCqmlA/yqAQveMMh16LBCgft0geAJIET8us31pcKc2B4lbUnAUMjo8DtJS6EKGAHKb6F
	ICKIaQdvS1f4fGoFSEKYzERr2Ecj3LgYh1rxKHNs7/9uGGr2yn6s4ZTGaKOAKcRzBghM/iuxbFc
	FjNV2HQ9FTr4vliahKnIq9bgxUNSY47JifqHAP7nZLG9iGgYhrZKhCdWPU2G34Z8
X-Received: by 2002:a17:90b:3943:b0:2ef:ad48:7175 with SMTP id 98e67ed59e1d1-301d43c9272mr9424157a91.15.1742529779075;
        Thu, 20 Mar 2025 21:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwEfWS1L0HjIr9WqT5+3VKK9Z3whZ1PxEMMo079UfL+36e8bxMvOO2G+eNOx5jd6ObvadbLA==
X-Received: by 2002:a17:90b:3943:b0:2ef:ad48:7175 with SMTP id 98e67ed59e1d1-301d43c9272mr9424116a91.15.1742529778596;
        Thu, 20 Mar 2025 21:02:58 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.201.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b02csm4865226a91.17.2025.03.20.21.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 21:02:58 -0700 (PDT)
Message-ID: <df8149da-beb8-b06c-949a-025a29f9f84f@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 09:32:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: don't put ieee80211_chanctx_conf
 struct in ath12k_link_vif
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kup5K8zD54ik37QPnzThpmB5AMu2pT9O
X-Proofpoint-GUID: Kup5K8zD54ik37QPnzThpmB5AMu2pT9O
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67dce4f4 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=13kUIL9uG/hLjppKjZ3b/g==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=uvMg_fejPkrpZwH_nmEA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=775 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_210302_415488_0ABEF512 
X-CRM114-Status: GOOD (  12.78  )
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



On 3/21/2025 7:15 AM, Baochen Qiang wrote:
> ieee80211_chanctx_conf struct is not put at the end of ath12k_link_vif.
> Note ieee80211_chanctx_conf has flexible array member inside it, causing
> below warning with GCC-14:
> 
> drivers/net/wireless/ath/ath12k/core.h:298:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Although there is no issue for now since the array is not getting used,
> this should be fixed to avoid any potential data corruption issue in the
> future.
> 
> Remove this struct from ath12k_link_vif, fetch it from ieee80211_bss_conf
> instead when needed.
> 
> This change only applies to WCN7850, and should has no impact on other
> chipsets.
> 
> This is an alternative to the solution proposed in [1].
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Link: https://msgid.link/Z8-Snz86Xfwdlyd7@kspp # [1]
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

