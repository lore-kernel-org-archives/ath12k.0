Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F679C19F32
	for <ath12k@archiver.kernel.org>; Wed,  5 Mar 2025 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRrcOt5UjejIK1PUNjHLBfNNK9uHRnWPZoQFKosMIBQ=; b=dehI4Qm7/gJ843ucx+3Wt98YEI
	d6H3IvmT1ZFaBJB3jd4rbffkXGi2UbweLietI0fbVy2vDsEfJgKg2QfhIDcLs7KG8xGjtMi9J5oFX
	nJ+eWEERoYwpyI9zN0PUOz/x770CyMPVntoFHiGuTKF7MWYl6L+LMsoD6gqMJbbS/lcXJnafUZL3x
	78WG3+nudB8f8MsArEwc04H0LQ4JyVriJIH45OOyLK+vS+ahcuQuiAyKsZsKn07C/zJ2Hj0Q2tXp7
	RmFVWQsPdaenfA35WXQj1nTFhJc74mOLgIuT3ji1My4Z8PlzC20QDww/6APy/zcJLmEl2PRAozHUH
	ztNkNxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpv83-00000009BRc-3vYq
	for ath12k@archiver.kernel.org;
	Wed, 05 Mar 2025 20:14:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpub4-000000095z2-2LJE
	for ath12k@lists.infradead.org;
	Wed, 05 Mar 2025 19:40:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525Ao2nT006010
	for <ath12k@lists.infradead.org>; Wed, 5 Mar 2025 19:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRrcOt5UjejIK1PUNjHLBfNNK9uHRnWPZoQFKosMIBQ=; b=Cl5tZrIyKyy6FovS
	737odnMMoGugHNSzMb1A0QN7Vz6WgubiJ8TAwiXSqHav6mRMShOCyAL3JMFE29f9
	4lIOSVZJGGl3YwnsOD2TLcxgH8b2VDywGlvDPc1iJIkatEzGWnilrsuYLXzpfK3p
	LWs3/pPJvCi/WpTHEXWR2NDuqkaQyg7bdp/JNjr1cm6oHU7gLRsSrmF9jmOecSbg
	tXCRmV/s4YzZ2wI0WPLcHZDWCcsPdwKznERuiCS52Y9ZrDrMjwdFlCdz3W6W31ez
	EkMm1E5WRujzwvdZltNexaHEOFww5vmApw+pzTffhHb9C+6EGpXsE+b4QpatlyCa
	akCumg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tpj02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Mar 2025 19:40:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240a96112fso2323935ad.2
        for <ath12k@lists.infradead.org>; Wed, 05 Mar 2025 11:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741203600; x=1741808400;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRrcOt5UjejIK1PUNjHLBfNNK9uHRnWPZoQFKosMIBQ=;
        b=STD6uFcyyAqL+gl+9E2u9V+m6yNujb5KfhxkGHf5EnW7dgpr3QVyP9gR36k/utCQi8
         ObdShBYmD3U0SQxUdsx9+FJY0SxE7QVnUrgBrfD5hvQ+v77j80lOv/+38j4HfS81Avly
         Ou8EnfXPc4YknNy7NNdS9hnFQy509ujXI8cQ37XYn88nz39y1DMQ3n2qji72GKttJPqE
         sb5+BaRO6usA+n9+7UFy2rvtozBCJtG1P3JsCubNrhctR28U+xQdTvZUqSJmsleFpGAU
         /NfGnFDbl+qNKgCO22tQpvld0HAg7kXgjZUZfIbYg+EVPyj/LcyGluEgtpqUmD4VxANv
         5ndw==
X-Forwarded-Encrypted: i=1; AJvYcCVeYLmmU5hVjGSFNWPEp80w7zS37IJtJQ5ZoU6s4ISJjY66GFNz1suWTQp+AyJms867Db3tkaY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDtQjfICB72aS26ecLxmvKm+TkkF9tUIDqhCuxLw7MPc18Lkbf
	eaZLn5eCpdAwuZwyAZRSSuSeDXAh/b2JA4FKjHYKy1nizVQZNFd04VLPxPnr03i8luVXLxGlXB3
	2OshPD3D9zxDuty0M7x8YFjOLjuB/zQuzXE1CuZm481qc2Xun3fmPfEbQwovq
X-Gm-Gg: ASbGncufc2JCvCKyN5/7V8ahH6HXx0Esxw5t2L2M5BrTpou8xYD3JKTxx6B4YsREsT8
	LlxWcde4+TWQjBeyaqydxuEoDLLuAALckc+B1rN5TmwcbzA30qYARzQiFF8+ksFLrLAvnAcqfNU
	d3K/7zfrSWOcqdC1ibnivwMkeET+ZRy7ieMvIRp3aNgk4Qcl4MsUvmXZXDeqxhKsjuxP16pgP8R
	wLvnu+kRsDOs5kQwix5YtJ6a5kSmN7Lx/5Z5YT4rNvBCpEp3LiS5YrlFf/wpzVN5uB7eECEcl5i
	Ei5gQHQqEwGbE7Jikz13cfjTkKpry8UVTa3BIPk5jMU/KzeCKaRCwE863tIfiP/KA3tXBbU=
X-Received: by 2002:a05:6a00:928a:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-73682be4d64mr6258973b3a.14.1741203600036;
        Wed, 05 Mar 2025 11:40:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEit7rS+bUZLICAMk+jW8iJKAZYzsBcMpzhao9oXjFVFFRg+KWvR8uITBhQospGLt/JvQf/xQ==
X-Received: by 2002:a05:6a00:928a:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-73682be4d64mr6258939b3a.14.1741203599565;
        Wed, 05 Mar 2025 11:39:59 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363288529dsm9470348b3a.41.2025.03.05.11.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 11:39:59 -0800 (PST)
Message-ID: <ea1bf15d-ac1f-4443-af05-89c3f8280378@oss.qualcomm.com>
Date: Wed, 5 Mar 2025 11:39:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] wifi: mac80211: restructure tx profile retrieval
 for MLO MBSSID
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
References: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
 <20250213225036.3118133-3-aloka.dixit@oss.qualcomm.com>
 <e38f01b2fe15902770cc11de24e82fcfed1aad5d.camel@sipsolutions.net>
 <13fc7b10-dbaf-4df8-aa8f-9e9095657d47@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <13fc7b10-dbaf-4df8-aa8f-9e9095657d47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c8a891 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YuS9t3q7v_2qBqA6pgsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QPe0_C0O9LMSbscMVzFIbUuEOSjiAPDB
X-Proofpoint-ORIG-GUID: QPe0_C0O9LMSbscMVzFIbUuEOSjiAPDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_08,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_114002_749847_32DFCA5E 
X-CRM114-Status: GOOD (  19.26  )
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

On 3/5/2025 10:39 AM, Aloka Dixit wrote:
> On 2/28/2025 5:44 AM, Johannes Berg wrote:
>> On Thu, 2025-02-13 at 14:50 -0800, Aloka Dixit wrote:
>>> From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
>>>
>>> For MBSSID, each vif (struct ieee80211_vif) stores another vif
>>> pointer for the transmitting profile of MBSSID set. This won't
>>> suffice for MLO as there may be multiple links, each of which can
>>> be part of different MBSSID sets. Hence the information needs to
>>> be stored per-link. Additionally, the transmitted profile itself
>>> may be part of an MLD hence storing vif will not suffice either.
>>> Fix MLO by storing an instance of struct ieee80211_bss_conf
>>> for each link.
>>>
>>> Modify following operations to reflect the above structure updates:
>>> - channel switch completion
>>> - BSS color change completion
>>> - Removing nontransmitted links in ieee80211_stop_mbssid()
>>> - drivers retrieving the transmitted link for beacon templates.
>>>
>>> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
>>> Co-developed-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
>>> Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
>>> Co-developed-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>>> ---
>>>   drivers/net/wireless/ath/ath11k/mac.c         | 20 +++--
>>>   drivers/net/wireless/ath/ath12k/mac.c         | 33 ++++++---
>>
>> This probably shouldn't come with so many driver changes in the first
>> place, but in any case the changes don't apply on my tree.
>>
>> johannes
>>
> 
> I will refactor some of the driver changes in a separate patch in next 
> version.
> 
> This series isn't applying cleanly because it depends on another 
> refactoring series I had mentioned in the cover letter:
> https://patchwork.kernel.org/project/linux-wireless/list/?series=932457&archive=both&state=*
> 
> I know it is a big no-no for mac80211 changes to depend on the driver 
> but sent both for the sake of completeness. It also explains why the 
> driver refactoring was required in the first place, because without that 
> series this current patch was even uglier trying to access tx conf at 
> 2-3 places, RCU accesses everywhere.
> 
> Anyway, the pre-req is now in ath.git, let's revisit this one once it is 
> merged in wireless-next.

My PR today will pull those driver changes into wireless-next.

/jeff

