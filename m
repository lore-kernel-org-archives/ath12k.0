Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26E0C369D5
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 16:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/V8Sk0jnYoMxTmrMu46NMhWrQw7hVUH5YLpHYQVbNKY=; b=nUdLDeAiiOYDvPnbjw2qb5Mupt
	swY+WYlLNeP4dMhqVehqh+CWrqRQgtWmDRts9A/TUw7wNS7ufy3wUnY3RrcekJGsFGM1M57hDA1S3
	zNM9mCzwwOugJYLV18V8LiycX0KTAI0EviMNK/nFpatYtyVsnQJgm1G7oxoozvTkHoitrE7h23J2c
	6zmR1heBRAJkkcoziSRpSqeo8bdTEozeYS1i2tluOqVxi+bU6vMVqRO2TcbnkrtkHpcaM1Q0mw52a
	RPAbfuCgQvGiPf6VPqGg9moKtrU96mOGh3lWpOyyh9BVWaO2erU+QIWfp7/vF7w5hJQoT++yf5022
	ndGT7wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R7c-00000006sY4-26ch;
	Mon, 28 Apr 2025 16:14:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R7a-00000006sXF-2wlB
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 16:14:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9jc9S001260
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 16:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/V8Sk0jnYoMxTmrMu46NMhWrQw7hVUH5YLpHYQVbNKY=; b=l0JsYmGDncuP3wk9
	1mK1rJ/dDXV2C3LLhPfdUGHRo4Cssmf0vUefYPBQ91iyPcfz9oYa2Dt8i23Owwqp
	qBDKNJaC7GkHQM8aATOHGRO663CeFCv0sE2C4u+ir9Wp4Dppljo5hvNKPBzmMvS6
	HSRXg4rTgWrUfy1WgxMCxp22EXvfIjmQkDFMhuc/B8ZWaTP9jxwFAl0HXhP96/cd
	WMUmm2m/tEpFSQKp8eOD433RKZjafK9zF42eDQf343kRrysE+1whMNgr1dSOk2MY
	fcUJMTrAsmyTJANgWB6h6rUEep04NcHtZHXBXROF68iuCdfRAcTG77zijopmlz0U
	3u+2WQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevgud4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 16:14:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227e2faab6dso42357745ad.1
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 09:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856856; x=1746461656;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/V8Sk0jnYoMxTmrMu46NMhWrQw7hVUH5YLpHYQVbNKY=;
        b=LmAUL0fcabcty7+2+p4xNG9GGbKzifCwcOD/9RJF6ftbYKgykPIl2iNu0dbpOajz+K
         XmAKfZKzg3+s4zskXOq+EyvvtaiuP7MBUBwfIMOZFm3bi8HJaFkHEExkbw4NtU8wK60d
         E/WukoBcTFV15/fYR8kHV/i4plKtCTSHy6hBKgei0IwQhQ0KTn5oh/0v5ZcqhTq352/1
         ZfI2FWV1NXA2Ee2pNqOYkTCUr0JkJHDiq2rS3XYyV5MImQKhWyE1u5AlBt9XPOfLgCR/
         UgHf5z9kW4rQaQL7sKZVP3ZyS6E/5FEvQOe4j9iLuN2RpYxBH89lxJLicRlEVa9ZeGNU
         eUxg==
X-Forwarded-Encrypted: i=1; AJvYcCXflRlK5dcx77pSSg17e2t0am9S94kymFj7ewjFCc2kgATIEj1+0IQ20iGagupEvdXnKZ97Rlw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1405/iIJ3VoyCllZO59++QrdNVvIU4l9iu5o84549Ugx1fz/g
	jii7dNgKdbbMrUG457/y2HCF7Q2oX2MDjR0wDTteZNK66MYF6O5ZJwewfcjvoaSfxyecA2FUlos
	Famz0lNjF+VOgzJurAL0Hxt7w0UMBsj6VlOz3pGfyRni5/4RsrIQwrB2FO0Uo
X-Gm-Gg: ASbGncugm0cWxxG7E7sBssQYkEd0b1ZliZ1d6hr0WB/OEcxftxyXqeke1sZDM/r2pAI
	ZwG6L35YnKzlkRnZm+nMrS+86ghBvH/V/3to5XpPeXAuOQT1XTpx8FY9+hzZTtpxHSrN88iDfQK
	euB40wSOAgchfXkySFsa2EI0BDGG1o21qbI72t8zI+pOQNW2bBQW1iLiIGNacOLYwAflCrmwGUD
	PVvjgYciyKZemONp1Le+R3cbRb3DAfnUSNqkZt7o+8f3ueOBrx1w6RHOJZlUFDbZZ8SeqxkvBdR
	WhMnZSu+82bHFDXzCnOg0WsL4clWE0TvVlkIX8blf8t+CaC6zZbT8LevsMpE
X-Received: by 2002:a17:903:3c48:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22dc69f3b04mr143095855ad.9.1745856855817;
        Mon, 28 Apr 2025 09:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHppuR8dvYljPTYcRZKu4BHzVYSZldfYQM9vAmQpN3t2WmX+8VasqrxjptsnxhSm3w0u+/LRw==
X-Received: by 2002:a17:903:3c48:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22dc69f3b04mr143095445ad.9.1745856855396;
        Mon, 28 Apr 2025 09:14:15 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.192.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50ea421sm84982105ad.109.2025.04.28.09.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:14:15 -0700 (PDT)
Message-ID: <1692f2f8-c77e-87ce-db70-00b4d9fc7c95@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 21:44:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 00/15] wifi: ath12k: add support for 6 GHz
 station for various modes : LPI, SP and VLP
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4I6aVRL1kFkqfQIm1-qC_T4FVopG4J2_
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680fa958 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=XJI/iaC0GbrNbCf3OOiYRw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rSFznLUdu7_CRTz4a9oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4I6aVRL1kFkqfQIm1-qC_T4FVopG4J2_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzMiBTYWx0ZWRfX55E3AWDI8OXu Nonzl+ecPuGs22SxT8E6W8LTw0wXsfKA6McmB6AHbRwC+XwHVLMZVfzD7AScLOX0rWBlAbRjPo7 o7rBJ2DkpzWIVmJ7Ub02LvlNe8GYC1ZzmsnEUWGI0bomhHuEEQIaaDckHLITKVa2MUc86pPxJyE
 UH0hZFd03Ue+kSRTxmy1EI16sMkL4mm1on1tkFqunT3CufssgJULzpPARxyqjqzOhI2jbv+7sFN 9aP36Hpsqu6h4cOiTolyC7aqTD8bLXJuxdgOkb42QLq0GiBlHBYYLm4i5jHtZtFr4cq4sUV92dL oHIsvj5zTzyH6hxsgxVXDognEqsejQLpN1ZAv5ybW/Nxx2kjAsljxHP/HiwdygbREpxmKzJPth3
 HC+rSKG/sHRMIr73hTzXx/U2pT3KEGh0CkadANpOd6ib1IulxINaeRdhpr7cKch/eqwApYdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_091418_757731_78387E3E 
X-CRM114-Status: GOOD (  14.96  )
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



On 4/18/2025 8:25 AM, Baochen Qiang wrote:
> Currently for 6 GHz reg rules from WMI_REG_CHAN_LIST_CC_EXT_EVENTID event,
> host chooses low power indoor type rule regardless of interface type or AP's
> power type, which is not correct. This series change to choose proper rule
> based on interface type and AP's power type.
> 
> When connecting to a 6 GHz AP, currently host sends power settings to firmware
> over WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G commands.
> Actually there is a new command WMI_VDEV_SET_TPC_POWER_CMDID with which host
> can send more detailed parameter than with those two. So add support for this
> interface.
> 
> Before above changes, some fix and refactor are done to do some preparation
> for following patches.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> ---
> Baochen Qiang (15):
>        wifi: ath12k: fix a possible dead lock caused by ab->base_lock
>        wifi: ath12k: refactor ath12k_reg_chan_list_event()
>        wifi: ath12k: refactor ath12k_reg_build_regd()
>        wifi: ath12k: add support to select 6 GHz regulatory type
>        wifi: ath12k: move reg info handling outside
>        wifi: ath12k: store reg info for later use
>        wifi: ath12k: determine interface mode in _op_add_interface()
>        wifi: ath12k: update regulatory rules when interface added
>        wifi: ath12k: update regulatory rules when connection established
>        wifi: ath12k: save power spectral density(PSD) of regulatory rule
>        wifi: ath12k: add parse of transmit power envelope element
>        wifi: ath12k: save max transmit power in vdev start response event from firmware
>        wifi: ath12k: fill parameters for vdev set TPC power WMI command
>        wifi: ath12k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
>        wifi: ath12k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz
> 
>   drivers/net/wireless/ath/ath12k/core.h |   6 +
>   drivers/net/wireless/ath/ath12k/mac.c  | 527 ++++++++++++++++++++++++++++++---
>   drivers/net/wireless/ath/ath12k/mac.h  |  43 +++
>   drivers/net/wireless/ath/ath12k/reg.c  | 209 +++++++++++--
>   drivers/net/wireless/ath/ath12k/reg.h  |  18 +-
>   drivers/net/wireless/ath/ath12k/wmi.c  | 198 +++++++------
>   drivers/net/wireless/ath/ath12k/wmi.h  |  62 ++++
>   7 files changed, 905 insertions(+), 158 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

