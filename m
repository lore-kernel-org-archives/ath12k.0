Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48307FB5188
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 03:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuAGnnUVWiZRmcQesKYHg8T4vxMspZN6eBQlm36IxqI=; b=QBcditOXTEHL/Rcfzvgdb9aKXZ
	6u5Hjf4fPVkhv7gAERrWPRm81HP7eCbSbQIdIQFuXiabVhA5dH5zFh309o73DbOfU08Y7ZOZeUyow
	H+GKgNgsWcxTZQ68gPhGx0I0lmjgimqPrjl0gCv7LB/2jWjR1PV2cr7PXs3AdaETVLCUoUokE0NEl
	QxSqtuHDoRMrP1w6jY1fa31dsKBqBmnF3URdbanu0PwircqdIicqzp83QGzQG/KY8BZQeLGdhiBtS
	VsOC3d3oU6HqJob0/w6OPQoxmj+20RytzG734cza0dZIh3l1p7zppLnhcNvLW4+tNuIfPtSEXdXWB
	FvppkkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xUh-00000005r1l-3rL8;
	Tue, 07 Apr 2026 03:52:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xUf-00000005r0u-18r1
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 03:52:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQgiR4008704
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 03:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AuAGnnUVWiZRmcQesKYHg8T4vxMspZN6eBQlm36IxqI=; b=TRNCmrK7FSU7YnW1
	4aMcr+R7/74MjoJOSulvRM745KYss3nX8KSv76221sxIE2SNrLjDMDS2idpBQH+/
	ocA7zlcB3lQTfMMp9cmPqBU8xO9eqQIBWu2SINYnorU7TXiSClnkjRnDAjNHfqcQ
	un419Fp81tiQO1EGLAHgEkoaPO+o7+AmjK2IJZUeNsTPCXvEP7U3Bmq1thozwzsn
	j65gJ9fQlUwg7oORHn5SG0WZlAv+iEQ4r0nteHxmzVWMde+QIHeWOrRqS4naxFca
	kZoblcB4SvZBlXD6pTmmZ9j70vM7w5hZUgpLDjr2P6v09PbpHnctxqy8ErYXAoAk
	I/xFAA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkrvtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 03:52:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7423ba5342so7143119a12.0
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 20:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775533967; x=1776138767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AuAGnnUVWiZRmcQesKYHg8T4vxMspZN6eBQlm36IxqI=;
        b=cg8eMAiDRJtzzjYVAdPDYM8ehjeNmwRspqG4p2FsAk00OD5vy8/TRiHWsDnghV0ITi
         3gQw+MTNSjeEoQ6K2QjOAgi88ZLFkEZW4hFPztPv7VwpA5quNY4FYovI0p52Pw5vz8wT
         SjnLXNfPKID0SdBIh7DDF1RrFaHoaD2aN3Om1vMSuoDG3x3L9ooocYzW1Kg/5aJZKpHa
         7fBe5ODMRDZiAO2tcVV3eYKiLAriJsr0NnkJ1fgVCKyt+bcWpylEJS2gIzS91oH3Db/U
         5hTeDdoaiLGh/f1Mc+W8a9+yjtL/li+mlAmwU953iNBaozWHjy+YuYv8g6XuFJX5w4zm
         DQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775533967; x=1776138767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuAGnnUVWiZRmcQesKYHg8T4vxMspZN6eBQlm36IxqI=;
        b=g27oeX4ZE2OlWQTrXpLuloApVWoGBaL3sl5nPFgPaukBtFl08FN+3cPm6326taqu6a
         JrDFlbnrAeaYj+C8FiTcldnl5WIdopp7wT6/tRTH38/6ebGr6wIls1gB3bGqUXeDQ168
         bA6wtb1SvpSGEMNjX+FPyQlrpQnCtjq8r+qFKbIWIskd1RErX0p2POC+wXRT9O7iiUAk
         6wUyli7eWq6kanFYaJoClbdVM6WLWMjrVEy9Yi9UW8bqINyspfaPm2pyxXxuznpcwmYS
         QTfiXzXqT0ztmIyHK/3i5RZNQTZ7bgiBTjPJuDxaD+3k2yzU2KNB69pKZj4b4Yb4X6Na
         LEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXKxkrG67voarkNaYlsrE5kfkq00SVShZfNmNQF+YHiRy59S/IRHE5dQS+/mFJ7QfxUTeMlTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzS4qtWdA1YBWLLGuhiUQd4sF761aIj3aroOrFkfn9mzYtAc7CB
	RUEkaB7J1+wzzsAnD6nhwcgRoUXsrzL9pN8nHkW1H/uEtVOBSdxWTZiyA3TQmR8BGQ47Fdho99w
	g1v1x6Ts2AbgE8M3Ps+8WXP0CA00ow5GuhZx96uxb92kRvbPwqrtUmvnt2uyIGID1
X-Gm-Gg: AeBDietMcf2qMO8sZLIuoYMX81GY5VNHNt/e4RsDjES6w2R07WUXHAzt391dJS1bzuU
	BCgJgc4lXPm4deFCiuv+d4BWUZjP+f/lXIp9yNqNLMgfya1ZcOo5SY6QAlU/Ll3D/hldH9xSYs/
	SUcEWkRgSaOwiUDidSqxXwJwvClXGkxJjzj33IG1hW8Usn4Kt72XMdWTEPnjni5YjLwgVKOjrpK
	1kNdATZK+C7RlNW6zQJwSrB+BxC7TCW7E/RkvKejXrqdN+jrnP99tKJ6YpWPKBTcEFwnuDf5AYX
	ICFzbZgfIMQElL3EBCL5jiUuaOOZuK2L0KfOHst1r6WeNRcZaZLCBzWYqhGMLGoHxQNwObI3Ycp
	DRgds2rrCksOePv1uGISXHw7qUpk+CBZYOloNoOEGi4h/B4V9ScZDBKTFaLeN7Q==
X-Received: by 2002:a05:6a21:6d9f:b0:39c:4af6:4303 with SMTP id adf61e73a8af0-39f2ee459c0mr14891501637.20.1775533966946;
        Mon, 06 Apr 2026 20:52:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d9f:b0:39c:4af6:4303 with SMTP id adf61e73a8af0-39f2ee459c0mr14891483637.20.1775533966475;
        Mon, 06 Apr 2026 20:52:46 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6563597sm16568137a12.16.2026.04.06.20.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 20:52:46 -0700 (PDT)
Message-ID: <0f851509-556d-4021-a08d-937e7bea16ad@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 09:22:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Skip adding inactive partner vdev
 info
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Avula Sri Charan <quic_asrichar@quicinc.com>
References: <20260330040732.1847263-1-roopni.devanathan@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260330040732.1847263-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d47f8f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RQiAibkc-cMzSS9pYhwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Mz2dBbENfS94kyOzNNcTQMT-Va7YH6IZ
X-Proofpoint-GUID: Mz2dBbENfS94kyOzNNcTQMT-Va7YH6IZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzMyBTYWx0ZWRfX05U99AHX4UTd
 QWVZC5ABg4RHrgemaimbODI+OENcjRUxgVRiIAl1Z89tnUH/hNe8go6KhFA8kUqNKrApao+FYuY
 86OScr/ZTKnDmqGo2+qgRDf2/iFmEyZKSIoEGfeLpdOpL8Krq+99l0Oe1qu1TzS/9askceexwZZ
 +gu6cWQuVWZr0Q3eRwr8P4MLWfYz7z8XBSk6/LKs9Np5FoMWbPn6XlhlWdDSDTJU5kTBKeg/MBH
 jk8t/HFW7xmNcckHmS8iUf+l4yQ5QaC+PiZy4RXUpmFy852T2WJhL7pdF9r/xPWFRDwgcCq//iw
 x/Gm7B7XcHZChavqDpxXsITg2YPL+YXuKvHcV8e8Y6wuu2GF8LMi9Oed5KQ8VL2f0yDPszFWmBr
 zN3MpM1EKML/7GjTJa9rpXYWcq/mBf+bbcukqIYRyBPF4SOKbpY1gnXoIfIX3QTkJigeGIAJfGW
 XtBLc2nouTNckCQtHDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_205249_438053_D7FCD814 
X-CRM114-Status: GOOD (  18.03  )
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



On 3/30/2026 9:37 AM, Roopni Devanathan wrote:
> From: Avula Sri Charan <quic_asrichar@quicinc.com>
> 
> Currently, a vdev that is created is considered active for partner link
> population. In case of an MLD station, non-associated link vdevs can be
> created but not started. Yet, they are added as partner links. This leads
> to the creation of stale FW partner entries which accumulate and cause
> assertions.
> 
> To resolve this issue, check if the vdev is started and operating on a
> chosen frequency, i.e., arvif->is_started, instead of checking if the vdev
> is created, i.e., arvif->is_created. This determines if the vdev is active
> or not and skips adding it as a partner link if it's inactive.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 553ec28b6aaa..c1a1b220f4dd 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -11131,7 +11131,7 @@ ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
>   		if (arvif == arvif_p)
>   			continue;
>   
> -		if (!arvif_p->is_created)
> +		if (!arvif_p->is_started)
>   			continue;
>   
>   		link_conf = wiphy_dereference(ahvif->ah->hw->wiphy,
> 
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

