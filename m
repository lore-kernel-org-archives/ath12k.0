Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468A0C79FAD
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 09:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFkhDXbkZn1yjQAgYJhG1jCYyeW9Ybaqxa2Tec91Hxc=; b=KcV4kNSBADdu0+Bbr1k2j7uYqR
	sVLMpFmQ+xba86dXidzKqZC4L/cFpYDjBT68sKLrHncttIbYJPyDW6q6piuTe2u0SBdDoC+cW0Pjv
	q9z0hCy7l71oYw9NyLyryOk2FBlE+zzUf9+jJU60d+ThMLhyBCzSahYziaU03yPTYNUVo1HiOAIhm
	pbci4ENxhtbH3xVa27mZolDWPuj6i5mI04fpEhlYYvFoVkI5I5HR/2OEni6vqT4+54bI4hn1Z9GvT
	FgiJSmEKIer8cHCh9Tupvc7pgXmK1ajMEsk9MJFIlwCtCYOsWYf5mUA8mCxpGIZhPhIfhz1ls4FfH
	SOIaGJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EtE-0000000BL4g-41Ji;
	Wed, 09 Sep 2026 09:46:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EtB-0000000BL49-2qIS
	for ath12k@bombadil.infradead.org;
	Wed, 09 Sep 2026 09:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XFkhDXbkZn1yjQAgYJhG1jCYyeW9Ybaqxa2Tec91Hxc=; b=Y1EqqQZN9kvfYhr5ikkUqhpz4V
	zgUBrsB4dFpfB+958sPkAspMznMtLcEi9leOqNdoZhY6OAW1FbZJ+HjQkLkyRI37ApO6RciReIsCa
	ct+w+jMX8Iz0N4KJh7c8Cesz5RmmH6JOBGTtEseEBe8Pn3/dnOAIF3V6C7picrme9ldQ6QTECL3gD
	uKHEl6n6WnhK6q8eR+Kdfkz8b1oLHLUa8GqHi2YLPHU/X9TLUocKS5cYuHpiKGfxWZc9HDddp0e/w
	PQ7fOtVcHzG7uR/eY/G2JvyW9TQUiDzxtZYaKjNtDjBUraTjIxEryPq/Q7EImvYi4GeK6hv4wkl7V
	tzNLCzSw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Et8-000000011Iw-2iWm
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 09:46:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6899WoqV3771250
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 09:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFkhDXbkZn1yjQAgYJhG1jCYyeW9Ybaqxa2Tec91Hxc=; b=Wn31AvSUrmLELzCr
	zWh9m+Ysm/8nQpSluVh2rd6jSDhpLuGqTKNBK1fiPEYE0IVR+jCqk6JoPSHa1BeU
	XPoki5jFiCxuqq7cq6EJHx9hYpl/8A5QQccGMATp5VWsF7EYVoO9dr87/JuR8Z2d
	uAepeJXIQ9lCXMBDk6098omt7+bqNHvXFU/8A9sWetSrknneeCUKsMLtrpr7L89S
	Ve04dltNjGz1Ya1vsqMVM9bQiKivsRjpffWltmWw2t6Mc7tFj2QP9/Ov7/eeS7KN
	ieK02vDPqStNjRHTwtn6oFsQvDWac4lpI5KETFq6ySSy0UkJIlG65li/py4VMks2
	7SqvDA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1bc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 09:46:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968dfff779so7810598a91.1
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 02:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788947198; x=1789551998; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XFkhDXbkZn1yjQAgYJhG1jCYyeW9Ybaqxa2Tec91Hxc=;
        b=ASlN2LS9Cn5PVgBTL0K6Imds/JqGZ7nPCbdZ7MNlvH9D8nXHyjJLfv5UBjoNC+2cSl
         yqUBOg5jjeOyjgjLHmHvlFO6zVdLq0jofO0LJFnw3b38q0GI1QCha8/YqvAUR7xbIzEn
         1x9tL9Hw9EbtFHQDqL34NVaC1mQFeZjkzvda2jNAqGD3NPZPWHKoFRn/Vrpt0ASKEHNo
         UDpj8Z+yKTTHd9CC5XpMq5tBEVuO7jorZIHcvsyb6qv0VN5WzJTvcFRkGX/XE9VZKsI2
         hOh6PJI8yiYw8Un8cX5oL8KG2hXz2uUFUpNYztxU8VEOtRaJ7tPsC0QOxo44PEzMazMe
         C1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947198; x=1789551998;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFkhDXbkZn1yjQAgYJhG1jCYyeW9Ybaqxa2Tec91Hxc=;
        b=fqRrFJRb24g3Xu7ka19wVIT6fP4GIYK/tJ40OM7QCSmrYp2eQmSf31NyIvfKQ/K5pm
         hTtClYPmauSZ8hZaRJybz0o84Gdm/gFO8pxtaph6XisJqBP3yraiHywVCoHc7NKUZRVA
         SI/kfNpwBpWLQft1Lyj8k7jGaanyLz8fGbAUZMhR0LKtvra1uc2rgZJDvUO7fifkiKLw
         uojq1uF4AVu+cSi3MPPr/bDzIMxX0kf2zawz9hsYun5EruyUf/EBDTn3sjaBHmjQ4Xjc
         oq8hB2FRkGULxc65Y5zyTeBGR+0Qa2HB5gBXpXE34IteFUkbNHvPQ5ZZUQVpN5ro0ZDL
         nNYg==
X-Forwarded-Encrypted: i=1; AKwUvBzcbEucniKs3cIYP1MWp/LiIhSa+ZsrLBtYtgV5Pm6Jpaj418GWGAHVcmCE6VU8VSJO3UZrfy8=@lists.infradead.org
X-Gm-Message-State: AFuF++lQqlEjMPxBUsMTMNLsAIwqav69eozDLCR991pHN8xOPzQA3LdU
	ndyUWMtK2qFyT1DAynDnjT4FbWJ06Ut6z8I3wX09UNEG9+zXQFwBvRPdtqOgYfn1E0zbcPdH20g
	9jiwuLL6K+3oOL2dClKS1KFHTe01oI0WFL7DBwehoZmVrxl9bsC/V+dPWVNu4GMQy
X-Gm-Gg: AYBFou0u2zoQhJyi1MsyUQQCJQ6ps9Sydlxq/Mfpttky953QXRNUjnAXl+GECI7gwf3
	Hnp7j6+50I+6z07+Dx9RNL+H08wXYYNUsjZK2oIz2vD+uzDABJygDyWOknSYQAlqg/75aas7EfU
	fuVgg/zfxQ9UgEa2lzIdgKF6fLsAFE8NoC9CH6siGQdNOV3W7GIBupo5FiVo7ywNuyUwgwaqNwb
	8M8PamB3bz9E9yFEKbORPuG/y5f9vsQdSaIEf2o3kCDkmJvccAfdWyHzBQqzUvI5sl74DGtR09/
	mLwSRhGPcIFV981mxnHjQ67L5o5LxZJDspR4i7TdDsyfS22VOGEEJ6eKQ4m1LUk5GPuitkeirAo
	53UOOwEZjbgHKM/LFUP+YO8/s8XOBdgGCzBCs+2h1uR6HWMYvSWYGaWX6+w6soQ==
X-Received: by 2002:a17:90b:4c10:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b8bec869amr9484758a91.11.1788947197657;
        Wed, 09 Sep 2026 02:46:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4c10:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b8bec869amr9484723a91.11.1788947196832;
        Wed, 09 Sep 2026 02:46:36 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bac3a2809sm4980076a91.10.2026.09.09.02.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:46:36 -0700 (PDT)
Message-ID: <b4fcaa4f-8c4e-4fc0-898c-6c97e1446323@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 17:46:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix frequency range for
 single-pdev devices
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Shenghan Gao <gsh20040816@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260715065218.41232-1-gsh20040816@gmail.com>
 <5ca16013-e8a0-4403-a2b3-b3b43ea2bb2d@oss.qualcomm.com>
 <CAMVcGaDKC626A6=VC+10vtw3KVNm2NM_yPXTbgnA9Efd5eyL7A@mail.gmail.com>
 <9dd4e992-5810-429f-bc54-036c4eb276a7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9dd4e992-5810-429f-bc54-036c4eb276a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa12afe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Mt_g2Jb-QnVg90RqeeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwOCBTYWx0ZWRfX/ysZOktYOOYh
 lCAmZc6VH2fBNJJ6kxYHIuHks2pNiEKWpJtn3vTehTsVJL/UhqjPg+jd4FAY37cTQXENEw+Mf/U
 qj2V/I+PpHD3BceDwR7WivU3RKDBeY6gApKFAaYAvdMyDXlvCrmyIcj43DIQLlX7WLvwvcUMZ4Q
 OSQ+57eqLHUd/ThWn1lkG4LJnoiiwUI5EVrr3Z5I6fW32qb2MPEgA4e5cVyMBqtROa0o+G7s9WU
 GZuLqJzeovDGHQVSt7AIoM0x+PKyaLIrczncMzf0ba5imYReFuj9axuYQzFyC2WXvrYhG1IkjWo
 4L4kHoAbtU+cETcds1Jp+SLW2CE8+PoTya53o85SUirC0LZSCuYjHydUaUCUjtJOi06XtFt+Er3
 MhWF5HgG/aSeq0Wvuq0oUiBemvgvNndHJtQhVuplxOvTw6cvQGrekhA13KRVHYVwIALBsqyafN4
 aDh6JPS5+F6WIL8kjCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwOCBTYWx0ZWRfX6oc+cxN5XhvZ
 s19fBegpGw7Bzhd5/uxYFqEaGZs1Mgc4tuyNeJu4PO13C56FgfRPwdbl5lYlNxPM+o4KonQrtCB
 JyZlo4EwiZwHHGgDC5784qzl60knAyE=
X-Proofpoint-ORIG-GUID: GhMpGAUH6KwsINcDS7KmzDeL4CzaHgAp
X-Proofpoint-GUID: GhMpGAUH6KwsINcDS7KmzDeL4CzaHgAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_104643_062917_D2D368DA 
X-CRM114-Status: GOOD (  24.45  )
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



On 8/3/2026 4:36 PM, Baochen Qiang wrote:
> 
> 
> On 7/20/2026 5:25 PM, Shenghan Gao wrote:
>> The update sequence is as follows.
>>
>> ath12k_regd_update() first resets ar->freq_range to zero. On the
>> tested WCN7850 under the CN regulatory domain, the 2 GHz branch
>> calculates a valid range, so the first call to
>> ath12k_mac_update_freq_range() sets ar->freq_range to 2402-2482 MHz.
>>
>> The existing 5 GHz branch is skipped because ar->supports_6ghz is true.
>>
>> When the new regulatory domain is built, reg_freq_6ghz.end_freq is
>> reset to zero. Since the CN regulatory event contains no 6 GHz rules,
>> it remains zero. The 6 GHz branch therefore calculates freq_high as
>> zero, and ath12k_mac_update_freq_range() returns without extending the
>> existing range.
>>
>> Consequently, ar->freq_range remains 2402-2482 MHz, and the subsequent
>> channel-list update filters out all 5 GHz channels.
> 
> Thanks, now I get the root cause.
> 
> However the change of this patch looks more like a workaround rather than a proper fix:
> 
> Current radio frequency logic has been architecturally wrong from the start. Ever since
> 657b0c72c4ad introduced reg_freq_*, the entire purpose of this code has been to compute a
> per-radio frequency range (to advertise each radio's own Frequency Range to user space —
> Idx 0/Idx 1 in iw phyX info). Since the quantity is per-radio, reg_freq_2ghz/5ghz/6ghz
> should not live in struct ath12k_base (per-device). Storing a per-radio quantity in a
> per-device field is a layer mismatch, and every problem below derives from it.
> 
> Two problems caused by keeping them in ath12k_base:
> 
> (a) A cross-phy race that silently drops a range. Firmware sends WMI_REG_CHAN_LIST_CC_EXT
> per phy. build_regd() resets all three ab->reg_freq_* to {INT_MAX, 0} and refills only its
> own phy's band on every event, while regd_update() runs per-ar off a workqueue reading
> that shared per-device state. A later phy's event can reset, e.g., reg_freq_5ghz back to
> {INT_MAX, 0} before an earlier radio's regd_update_work runs; that radio then computes
> freq_high = min(high_5ghz_chan, 0) = 0 and the range is silently dropped by
> ath12k_mac_update_freq_range(). This is a real shared-state race.
> 
> (b) It forces the ar->supports_6ghz proxy — which is where your change comes from. Because
> ab->reg_freq_* is per-device, regd_update() can't tell from it which band this radio
> covers, so it falls back to ar->supports_6ghz to guess whether this is the 6 GHz-only
> radio. That proxy only holds on split-pdev; on single-pdev (one pdev covers 5+6 GHz,
> supports_6ghz=true) it breaks, which is exactly why you had to add the || single_pdev_only
> exception to rescue 5 GHz. The awkward compound gate is rooted in using a per-device proxy
> to decide per-radio band ownership.
> 
> Based on above, I would suggest making reg_freq_2ghz/5ghz/6ghz per-radio, in struct
> ath12k_pdev. ath12k_pdev is the driver's canonical per-radio object (1:1 with a radio,
> holding ar/cap/mac_addr), and this operating range is a property of the radio — so it
> belongs there, right next to cap (the HW freq limits), which is the same class of data (HW
> capability vs. the rule-intersected actual range). Both problems then dissolve:
> 
> - (a) is gone: each radio's range is isolated; a later phy's event can no longer clobber
> another's.
> - (b) is gone: the gate can ask the ground-truth question — "did this radio receive reg
> rules for this band?" (end_freq != 0) — with no supports_6ghz proxy:
> 
>   if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP &&
>       ar->pdev->reg_freq_5ghz.end_freq) {

Shenghan, any thoughts on the suggestion?


