Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74C1C4451B
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 03:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbGvV7HPSAZ+/yd6PZ8nTYa5fEnloeHvv5FpQWxD+QI=; b=0JSdH5Pi6aagvSmmM9Vtc/2mVm
	PtyKX90jH3pItmjtBLJ4PxxgwbLH2gGNFuh7Eut7ARGYPw1GDjeeGRqQ40fVaIIgfzaKcEgEkDXGw
	66V63et2x+LJ1DuXM3axoqOgdZmr409Mb376DjSuTloFBgWqXStzo/hIwCKjJwzjMdUqPN5lZLkKw
	qxtpT9x6flJTdskSNxKFWrv5pcmoPZrH/ZfDaF4Fq849DB71nRCNCk6vkxr3qbHKXoCaRGHSDn9HF
	TIE8gbGMMG79UKOhZhJz4ptMZtrlqD6ggXIJekFR+479xRojiJ63AS82Moh7qx6Xj6MXiX6/Mf5Ev
	7y7MNfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlevB-00000005nBC-1VCk;
	Mon, 20 Jul 2026 03:44:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlev9-00000005nAn-07js
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 03:44:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtLO3566329
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 03:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbGvV7HPSAZ+/yd6PZ8nTYa5fEnloeHvv5FpQWxD+QI=; b=nby672tNvryi5a6B
	2Ch42w/16HK3npzuuYLCMq4ONshteHUO7whefnAKXYJpOpa7aXcL1fyhD2H8G85L
	239rI4XOKmT6kNiv4Z1xpwQI3MdxfgkSVp4WgpAPv7DhW2dCuehXu8hHJCtrl2WD
	ePKRQ+fkrhjXSlx1gZQucl4JW2NXDRUaK3Tg5vBs2YrxPm+qmYmt4FADsH6kxvxZ
	flxrZZoKHvCFFrCG31nhGrOFCnV7uBUT2I6CVhQSpjBdS1q6tIXeQK0vkJU8Ap3C
	GOiPcxlXYicWJ8/TDnp0WqIbwzrp+rk0yYWsGSPpC9n+eC9afMxSlG+Tl6QrGUNM
	yxCi9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7v51u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 03:43:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso2256358a12.1
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 20:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784519037; x=1785123837; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbGvV7HPSAZ+/yd6PZ8nTYa5fEnloeHvv5FpQWxD+QI=;
        b=RmVGL4urTGeO+HF9KJKYJ4SgFdp+3ayv4WUw1R3jWHk9NGqloiuw2ISSGDP/rYeD5x
         xHOus5a1rtGDLtUmHBve0Mtjed+7mjyyQplxoDbQAONIjwpUCBvnkOwTQVV0qaRHbXl4
         IMi9DFW9WTlt6+RbvLBsa1z3ozPDH8trJLLG6dPet+HMWvHij9X8KGIJwhxa0PPKh8F+
         bHzpljD1Wyw84k+sLA5FYIYWHyRRZfVmVH+gHP/zwIkd3/6s1lLfUBwT+Nfri6g9GE2Q
         2X7xDSPA0IeZEXElqGS+LMDyjOj6lcbC0UCBSuJ0SibAIH5Sd4a2BKOYWBYMb4LAN+UT
         JdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784519037; x=1785123837;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbGvV7HPSAZ+/yd6PZ8nTYa5fEnloeHvv5FpQWxD+QI=;
        b=aSkgyMXCsp3W1LK2Kq27Sq4Nq4UVcXUgxqwuICKY0/AG6FQXSfo65EGOEk/Jx22n6h
         cQlTsNQjGRH9weRj3HPvpVUwB4qAfQ9tbzNP3N15ABYn4srLGSnJA71TpIkrKY0jYSR7
         8cATnaI7JVFA/8MIUDxOoPy9m52kuNyYf21WE7EuXCCYuo57MxYaJ9/T7BvRVVcQI30J
         7tvAwS11n1LTTeeJcUjBtOg/WaLp6B9ZNZbzvZaiAkgq+dY8DTISE+Up3G4N4H0dakzq
         2JA8T27qhuwmwI5cHPJImenrGIU+OW87I+cELE51BISmMV2TWP70G+r3lw0TP1paO8Gf
         WjNA==
X-Forwarded-Encrypted: i=1; AHgh+RrGtsgGjWawzIOGBq0C5Cysq+eK5xFDQ4NE0jcSVU12s9o1Aks2xOYYblvck3zXkNNF0gzsu+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyANAjAfGPaEquo1hwyepBUNeblqvpo9cPTG24Yn/BW8amoCTYv
	DJQt1BOMfOQO84ZtezeOzNuxKvnGWUiBm9RNbVJm/QtbXqMqP2JwPYOIzjUUDE6IDJnyU+kT+3x
	aNwZIkFEtDpFacOJXl1KM9h312t9xjfW7fY0vBdTIxJ7kWxEfyKl+RZHOor+mB9ZJ
X-Gm-Gg: AfdE7ck8zvl3geFtHkvPAINbzc5a09rTWtRcqNUjp3S+ZVUHh11yCcHhc8yu02JR2Vf
	HZHiz+W9TdpWMO0Hjb/+BU/ToZswtjQBpg5xTqjqUiQxbujCp0Bd+JAGWzHcLIQodKUG+UzujUG
	3V45Erx+IXlfjv+rlq4jfbDMIUJblnzO1dV8xtydYeRyNBkAnK+8DFlzJvKz4VFZBmHnt+9cKco
	rgZq2r+/TnBTYE5b2P6dxvv8pTznVhe5FyIO4tINXIOloQVVhFmdEbJtYHpzXtLtBjYPeRVk0jx
	Q0PQ6kpdts40qEWV7iWnXlFkxFijxsDvBsz3eOkb4uNpqwPuMKf4iZ8Pg1dKpKcBeFLHl1+bXZ9
	FSnDWyLiayzc2zEUjgDWXTMPL4P12n+yh0eFqMib4vB/luoI=
X-Received: by 2002:a17:90a:ec8b:b0:38d:ec55:7aa7 with SMTP id 98e67ed59e1d1-38e3d29a193mr18242457a91.19.1784519037490;
        Sun, 19 Jul 2026 20:43:57 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8b:b0:38d:ec55:7aa7 with SMTP id 98e67ed59e1d1-38e3d29a193mr18242444a91.19.1784519037034;
        Sun, 19 Jul 2026 20:43:57 -0700 (PDT)
Received: from [192.168.126.30] ([157.51.77.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2a48sm22695420c88.2.2026.07.19.20.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 20:43:56 -0700 (PDT)
Message-ID: <550bad80-c4b3-4e24-9103-fac714862f97@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 09:13:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Avoid buffer overread in
 ath12k_wmi_op_rx()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260716-ath12k_wmi_op_rx-overread-v1-1-327a4b1c2372@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716-ath12k_wmi_op_rx-overread-v1-1-327a4b1c2372@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNyBTYWx0ZWRfX1fTJEkrA7+eO
 O5/Zvh7Dy2GZEJ0bgwyWOsNgjQMEvzDm6GckJCCuAo2n87b3gzuw7jiBQcCZ7GAuszup9FhmGQ0
 lmpru1eOOkJ9l877XveJ7oqCBRv2XJ1YrYuyRjSesCQpwa80eeQj1fAL6QG9WDbQ7OXYE7cTKca
 VdK760ghkztE7CsV8T4NjBqnxlQYryXfos+M8pZPnArRHDs/XfOAIGj3Ko0BO8TyAOoQ8mQXBVD
 FjQrVkLecvn9ONLb48DxnTrA0+Iz/V3RYIWRe3JPDtw+OqtH89SjF7kHvfW/JZndNBeng4W7WZo
 UhhhaVIn7DeGlOYbX23VH/KKkpY4NOS0SjoLbBNsVR3gJWJKua3TIbPjiiSRbRCa6llbUllNGF8
 3lxWcCcSngNLM5QuMTp1rXl3x0UWF+VCkyn4iWv3XyLdvaMdLkaeJrOtgJjBsiT0W1VfKkyhoo/
 mPyys0x5lX5VI7EFtrA==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5d997e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Jeo/xMHqCPjs4yjtUlRiiA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ymRfW-ZP9UeHRcWsrQ4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: zkaB7Toly09aSw8PJpl1Dz8DmiNLDd3k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNyBTYWx0ZWRfXw0XFq413dFDB
 I1rcA2R64RS48q98GKoKoMlzR3toeYlrH+RQpqF1HK/+DIDLA45xqi28AdGPSxH4eXaduc4FjKx
 kzbUtVOMQD4m0ARvIiCjuUcmKizs/zc=
X-Proofpoint-GUID: zkaB7Toly09aSw8PJpl1Dz8DmiNLDd3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_204359_080256_570BC5E1 
X-CRM114-Status: GOOD (  10.98  )
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

On 7/17/2026 1:31 AM, Jeff Johnson wrote:
> Currently, in ath12k_wmi_op_rx(), the firmware buffer is read without
> first verifying that the buffer has enough data to hold a header. This
> could result in a buffer overread.
> 
> Update the logic to verify the buffer contains at least enough data to
> hold a wmi_cmd_hdr before reading from the buffer.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

