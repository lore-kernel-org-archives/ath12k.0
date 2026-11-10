Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB1160A2639
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LIcycBsa;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FTtGxwdV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ga4OlKqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=; b=LIcycBsa0NNrb3
	xc1iAT1dVQ+ThxLsANEm40wyG95X1ucORMQ9R7RAXt8nXtPM7kKtqWAPiVUgJuKk3351TNYio7N47
	Vd+uA3RG+9S1ws0k7SLzbFqAuIGi4Q7+2A2TseUc51TKvDjyj6kc6pRbxIHIJs4jKwhaMAZDGpOuz
	87XNmo5HcjiBYXG/aI0Ww9IkumsdAc65+H3ig9vap2YwTr/oC2PTCL36XZF/7EakWjg+vIzIMuJuw
	P1QJ9lUX/fPxjbyEY5Tcj8YKlAdCprtLXadZBk0ZnkIScuyiQwBYvinnpmsCmlyOyctO5cOZQX1jH
	Jsxf/f2W2MnH2GSlflRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgPY-00000002v4r-0Yb4;
	Tue, 10 Nov 2026 07:36:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgPV-00000002v4S-1vIb
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 07:36:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A9ul1207787
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 07:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=; b=FTtGxwdVYRKzndWV
	ivYp2VHwpiFmPViWn7ItXR5S5Nt3jLSy2sEjkEMjl1vRsRtqZIqKaE/m3+dpxVwy
	27QEjgIWEfF48khmdESc1YM2ZknevxHJM+zfnPB9tIBn5nNpZmEOXzl82533Do3O
	vxKGQo4PchCW6SOmmjQMd8Pf4Hno2MrX3NCbuTX6fvnm2l1UG7irQOusOLpegI5u
	RoGsjsytHBuI6wKDtCwkEAp7dFXjedQyujjo4/gM13GibpWiNiw/BTGWIEfAnnIN
	RtvnWxbzrQ6aZkagjpLyjnTk6O03ZG+dFtNM/I3k2M4CPNAIp+Kfkglr0REDuIZp
	mxIvAQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkj2st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 07:36:51 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so1808877c88.1
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 23:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794296211; x=1794901011; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=;
        b=ga4OlKqpKX9X51KlJR3byWN0CLycrmai3a0zIADQ9ydWqqzwEjjfZbnCjd18Tc203F
         nIfbP6DwTqM+AO/t7Ff6bVSWeTbZGSN8W7hNwSBBOi0Gmd5WwebcW/D21ge5a5bkgIpp
         CHAALHmyXL2nXIRURTbb4meNAxdEZKw87Ph9xcbYkrAKCZG1jo07Rp4HkEunbqocuo4S
         vE2i5+e+sJ1HrK7nyJwbqMWV807HqN6S7XXi8dUCOxNxE6Rtc0bMjfKt7c18pemKtgtg
         UjzA+9Z9LqloloS6Ath+yL+sQAi3S9hiQ10mfMwdmy6vZWFN2L6d+5OKiyeVhD75cTMW
         2PCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296211; x=1794901011;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=;
        b=hsUA/jBD+WmEQ/n5fAOfyANU+xqikubLpnVNkLeqa7AWzccnJT3y3cV/Tt3Rp80WoX
         H5J5zJwO4mCtaR6WVZ0oLD09cSkb6JO/BG5KVJwEwJ9QFAIqyCwF/jUlUAnCcaR/z6W0
         ed+z3ORZEi/zt89iE664TCrGa1X7LVDkrxkkhU408aN5LFiAcvmb2v4f6jddInM0sa80
         Mwc7oPSHbpZMt46rOHC+/0EN5WJ5x/shZ2Ek+5H6B4c2mBzXGMVzSOzwZ/p+f1ni8pT5
         4UVRiRc5eYf+eIOTVO+NIUXRcedgsMD3cS2IVoKzIK9Vmw+YAYv4nwlTdgjXbeWnKiFy
         KpTA==
X-Forwarded-Encrypted: i=1; AL+hErHXFsdttTBpXN9yDV5yI7rQEVBzlHi87bBF8woFc3M430bCIMw0U4l7RhpQbYsPGMZe1BQXZY4=@lists.infradead.org
X-Gm-Message-State: APuU4Z8oGk938yD7aBVTeCeNsTcEZQyLThcktaMBwLOKrAZUDuJ1CtG3
	pbsg18wKuHHj5eY8ZcSb49R3cQmAutxWV8vmffAbD9Im/x4UM6Cmo9f2VpbYTsdzgjGWVcyejCC
	4ZlA9Tz/igWWUITGzJhQuoS9wxaVeGhK+sWHaFoDDZqk/1uCmebk6EegFgsNk3qEC
X-Gm-Gg: AYBFou0X0L7+C46yv6VC/Bv/th+jsT6+lXggc/afbTk4UOiJTELflL1arsu9hVgwUas
	0heS+Bxy0yVon31bkKXT4UjuLPB8Ar0u4UDItjoYekrJoYp51b9Dizd//IFUgZ2MmsajQ09Nb3e
	bOU8id4P76dClqe0pEQ5lnXcaYyIasg0AoYw2g8aa3Rj+a7ydGVn/5Gtld4A1bR5RVT04Nqe1Nz
	pDEFjCYKNGLYxb/8gFboeZIQZcP8vzL1TlUHjgT/rnceAJOogA7DoCxRQkh/r4ZweQLuEklpfhB
	bmNhw9sgvZ0GtMiN+QiDQYC7VVj2hWff+I0LUHoqu3qQ44tzczK09HCblNLgPs/CCs3nzt8H3yu
	PcoPQi9R2vgUfCofQMe94Lnt/jqaSalb0KF08FnzGJ4MQWMcJe2cyV2U9p4hOhgV79Iws3rANc3
	JpJpr9/tjKoTUHKw==
X-Received: by 2002:a05:7022:170a:b0:190:716:4822 with SMTP id a92af1059eb24-1b3b603aeedmr2309294c88.8.1794296210361;
        Mon, 09 Nov 2026 23:36:50 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:190:716:4822 with SMTP id a92af1059eb24-1b3b603aeedmr2309269c88.8.1794296209582;
        Mon, 09 Nov 2026 23:36:49 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm4591558c88.0.2026.11.09.23.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:36:49 -0800 (PST)
Message-ID: <d1d6138a-f8b1-45f7-8761-4647a3ddc004@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:06:44 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 0/2] wifi: ath12k: accept what newer QCN9274
 firmware requests at boot
To: Goran Sustek <gsustek@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nazar Mokrynskyi <nazar@mokrynskyi.com>
References: <20261110002121.90167-1-gsustek@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110002121.90167-1-gsustek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x8A_Sf1tX81kifq-Pr3CpEhYQyNRsoIS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMCBTYWx0ZWRfX6Z7+GW4He3xF
 M2Dhzi4be3CZ+S0SR3JljBUj0NMZxIG2oc02OTkSRS2OdeqUxURIOQ9iZZ3Zajpo8E5LpY0ZOhC
 GJJXU5Fbs+jXe0a+A206uz801VclA54=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2c993 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IZxZDk6eNelpyKfexPcA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: x8A_Sf1tX81kifq-Pr3CpEhYQyNRsoIS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMCBTYWx0ZWRfXxUB84VF+9Ljg
 xbuVdJldUqzGLYaOsDor4S65WEFqk0bVozBvit1UjEigCheUZEG0GLUFCtfn1v71h+QRR+oRyND
 zN8TKZjRfIsHoy4lI88l4whwwaLOwMns9eAnFujRVbELH4duybyJbqIjd9wQazwd+Osxw8mav1c
 y+Oj/vLDyBOgkb9oQeQy3I8HCHk1sVHSQkNv8CYq4Fv76iqu1yofMC400VMju1Zi+6v+bGNas8U
 pEj428FrGWlAd4PN632BL8ox4Jm/+XDgJDB8JZEkecQ2xdUeLFoQJwnjftF8CoX+UwFEmp7XNGq
 v+YpSYdwd8BPBnh1IogsYDOLJYcUVNmm2mLryVkAAd0LT4PuuPUd0VEvQxd7+qxYtMakOqdynT6
 Amzh/W3BylEBfJXZXxKvLaIGdvi4ubkgLNSGpjs82pTfFN196OQB9at9Z/FpfOPuwaOAx5YIZOw
 RenoOHoMfAcvO/SID9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_233653_652531_E8E2F1CD 
X-CRM114-Status: GOOD (  14.72  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/2026 5:51 AM, Goran Sustek wrote:
> QCN9274 firmware WLAN.WBE.1.6-01243 requests two things at boot that
> ath12k does not implement: a target memory segment of type 0xa (AFC)
> and direct buffer rings for module IDs 2 and 3. Neither is needed for
> operation. Today the first gets a wrong answer and the second aborts
> the parse of the service ready ext event.
> 
> Patch 1 answers every unsupported memory type with size 0. Patch 2
> skips unknown ring module IDs instead of failing the parse. Both keep
> a warning, so the gap between firmware and driver stays visible.
> 
> v3:
> - 1/2: clear the size in the default case, no AFC case; keep the
>    warning; describe only the response change (Rameshkumar Sundaram).
> - 2/2: warn for a skipped entry instead of a debug message.
> - Rebased on ath-next.
> 
> v2:
> - 1/2: do not allocate the region, answer with size 0 (Rameshkumar
>    Sundaram); former 3/3 dropped.
> - 2/2: commit message and comment reworded.
> 
> v2: https://lore.kernel.org/r/20261102200235.48973-1-gsustek@gmail.com
> v1: https://lore.kernel.org/r/20261030220836.14164-1-gsustek@gmail.com
> 
> Goran Sustek (2):
>    wifi: ath12k: report size 0 for unsupported target memory types
>    wifi: ath12k: skip unknown direct buffer ring module IDs
> 
>   drivers/net/wireless/ath/ath12k/qmi.c |  1 +
>   drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
>   2 files changed, 29 insertions(+), 15 deletions(-)
> 
> 
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

