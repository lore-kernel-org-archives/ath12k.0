Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F301EC36010
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 19:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaTgF4a/34uclFeoWrPsrCmEq+pEEC8fdHAghCe2wqE=; b=uoDebakY0UWCdBIPc/yjd8aSCK
	TwGYSpajqwfEVRlFa8z+AWh4k2f5yg69I/FGgDZKVwmtBZHwEGvLnjoacpzaXdM5dBmsuso4G7Rin
	SUgF08xuZs1/Pbp8uQzmVeQjKXLyUbnFNbM1d+lkLp52fGMwzgTkzk8pi6gD1MEqBkWmv6Ih/yOXD
	lrWYVX3L7HOkj968ckPq/SKQjlhwAfOqWS2m1ObAftRUWHLlCNkQBsOejdeZpLfxRqoVQmQdm4my8
	biT4y6++nqQLhxzRJK51VDpViy6bgKG0brjYzOFYG3OWIbJlW/FnrcGGkpFWNnM3M1xK6eWYcCDMw
	h6lsoArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sJc-00000001quw-32JZ
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 19:39:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rTE-00000001boQ-39cY
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 18:45:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378drT7013467
	for <ath12k@lists.infradead.org>; Mon, 7 Apr 2025 18:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CaTgF4a/34uclFeoWrPsrCmEq+pEEC8fdHAghCe2wqE=; b=RKhKlcM+kETrjZEK
	ii/p/I2zsOR5eV4qkbUZayHag9cccq8DlQ/ss0XDIHXyPLFijVzbVwboYSRHn/bF
	/4Bhh6C2OG9jyIEvc53xmttfM8K28dpYWCS8tCmSgevphF5IlTKsCk996YV7Ef+R
	V+u90ApRTSnVZl5H1/XxkDiOCwo1iw3S0Ss5EDGtRuOCOQS8l02hi3HUOzgGM3JB
	dF/9SyViyYyzIdmZt2wodBhJTwbpDqW1fLdGK7YjfZLTXVHSJmbVIW9gKIzLDIU2
	B6qanyKB/lWWlOeRkXYuSAX5w82eImG3NTKhl84G248pmuRHmedw+mAo2kcMTC7y
	I/hHlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1d4w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 18:45:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff8a2c7912so3746744a91.1
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 11:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744051518; x=1744656318;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaTgF4a/34uclFeoWrPsrCmEq+pEEC8fdHAghCe2wqE=;
        b=Mz2DCKuiKKnCVcyJsGWtLio8W8+ZdfzLEEHkYGNCLlV6mrf2MWFX4elMlab6y1Oqnd
         zYr9OPe0J0Upbn/fbbmOmHapsP+Va+oFg9N71QErcSDURH/GipPVYZHEuyrxsK5s7cEp
         /jqufEm3h9WYYGWpHIIj31dxx8Q1JUHCfg6meWCth5nhni1hhHz06q0dn3lwLMV04V+h
         8ZJIzD+0XKRyWoU5xvpwpcWZBZA2SPKavQnUer6J4IuD4j9WlnyjYAsHPW8W6cPv0VI8
         WmRl8SGdKaI3JvXjoGUibBri2EsNbf6mBtMDWS1CPWGr5stDrzsCMDodUAJ7YffDdslC
         ru0g==
X-Forwarded-Encrypted: i=1; AJvYcCVSnNtC0+uUNvgCqUVOqp7iEHgVSjzz+sgOOdl/06PU1LsE8sd5wyv+kh1gzIWcmC3oAhThmcc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKYUsf+trSzWdiW2uUVoIXLJUMebHiUbj2OjJe7DHqy7Vm08jf
	iGDrB5LFBLj/95UWXLeFDwoyOgZeyEJlpAyJi2jHGxM0An0p/jf3PX7iscW61i5PuYY6SXfKkak
	u0Xee9Rnohxig/uSwwKVj0lzPW8MOSzBTSeQTdu9O0hg76GB8si2R8AWE/ygyB4UyiX9q
X-Gm-Gg: ASbGncvGD8a7t/2smQw46B8uMmruFmmSLb51gwwBM52YFJoPIS/5YDPE9+W9mSgaCbr
	4G+GRb7me9FgQeUJH4EySfCzTppyhnH/PlSDPV77O31DwSoXVXYzOwXEvWj/MWibRs6g0kfUGP3
	zzEGWQ3cyYY6NobXxaKgAnjFge1MZaB8BxiePOW64qOP1yhqXCaXHE9McrkhXU9yzGB9DQC5kQo
	QeRNE/lxi81bqJDRAclHJXL0I8sM3VlBhyoahTMKMItdp8ehyEPVAolsZeyuEX4I1SkzHU8wP5r
	nlHlrOhHti9SS0pADjBQctDYcjZLAvjpy+A1R82pU4yRkl9DfVDeqgGjOHD0Hj3+JQACVZsl+QT
	nmgXuPNp6
X-Received: by 2002:a17:90b:6cf:b0:306:b593:455e with SMTP id 98e67ed59e1d1-306d0be3b60mr680195a91.1.1744051517631;
        Mon, 07 Apr 2025 11:45:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH27ifd9SidaNf0mMnrpXJ3YfkJFEZ9H05V+CJJvNNT8LXGl1cdmrGIclx6qauZey72sUoYvQ==
X-Received: by 2002:a17:90b:6cf:b0:306:b593:455e with SMTP id 98e67ed59e1d1-306d0be3b60mr680176a91.1.1744051517273;
        Mon, 07 Apr 2025 11:45:17 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb90bedsm9449695a91.43.2025.04.07.11.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 11:45:17 -0700 (PDT)
Message-ID: <620d7c53-e8eb-4816-a9c2-d4bcd44b5d96@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 11:45:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] wifi: ath12k: core.h: Avoid
 -Wflex-array-member-not-at-end warnings
To: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <Z8-Snz86Xfwdlyd7@kspp> <202504071138.98D5B6E@keescook>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <202504071138.98D5B6E@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LT-eEpd4HE6tdSHmQjUyr9KVc_5M2FIg
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f41d3f cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=uvMg_fejPkrpZwH_nmEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LT-eEpd4HE6tdSHmQjUyr9KVc_5M2FIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_114520_917741_716FAB6A 
X-CRM114-Status: GOOD (  13.67  )
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

On 4/7/2025 11:39 AM, Kees Cook wrote:
> On Tue, Mar 11, 2025 at 12:02:15PM +1030, Gustavo A. R. Silva wrote:
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>>
>> Move the conflicting declaration to the end of the structure. Notice
>> that `struct ieee80211_chanctx_conf` is a flexible structure --a
>> structure that contains a flexible-array member.
>>
>> Fix 30 of the following warnings:
>>
>> drivers/net/wireless/ath/ath12k/core.h:298:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Hi, just checking in on this patch. Is some adjustment needed for this
> to land?
> 
> Thanks!

There is an alternate solution which should land in the next iteration of
linux-next (I just enabled the post-merge-window flow from ath-next)

https://lore.kernel.org/all/20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com/

/jeff

