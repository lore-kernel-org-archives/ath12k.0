Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C17C982FA
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 10:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBHydZSyrHff1ApJ9bUoZm9nBCnkiZV5DuxO7M+8nK0=; b=dXIdnVT3fuD4mjBUvny2gNVS3L
	4RGUxURNG0FmEZR+m+o7iKLIGGxlyoe3o4cxMV8WUCl+9lOmv4R5eI+VAnkiNP2AlN1VtR5RivzPp
	jpPgjFoxkcAuT96b1IW1vluygHIoTY60Ksuy/fO5L5AsaW5FzdpSiuaRmdNu6K05PywPjNl+zuna8
	a7aIXQMU2SJGnG1SKNOYukqNY5YRn42FPrC1SPW0LVT4xtizOv2QOhyKJpzvHP6Zl/PntinMYHMYF
	jCE27maNNn1vFx3Hns7uaVr4kBF4slNRvBUvVmN+44lEnbqKwLW9VpKYRMprkxtwosCxnRGBoJubO
	xaCiCXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xq3-000000053eA-2k2Y;
	Tue, 22 Sep 2026 10:35:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xq2-000000053dj-1jZb
	for ath12k@bombadil.infradead.org;
	Tue, 22 Sep 2026 10:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TBHydZSyrHff1ApJ9bUoZm9nBCnkiZV5DuxO7M+8nK0=; b=lhEIaA3/vKjSQq/loKZzWUuYjp
	DPye+6R3FXgJZf1Q9I2EW2N26FOl99TNgz59t3nM0Iz2JL+eyq4RbYbMLQk+hgDI+6xe0+agtIlfT
	dZ/ohTFDu5nKjvxDfYcI0ZN+EaZKJNROB6oWllskIce9VNVKaROkxCLAodPF4dMreFmmY6Ecz6B6H
	E6Qt0oR0pXwB5kbYe+3DkJuKKWeFPodIAF41Ppn2mSMR/5XWGbxxdEcm4ejecXzLSwxEoPIKip9YU
	088jBiCtkW+vm0JZoce+cFzPx+tbnsHEWCIGsikWFql/3AWMhInQfWJRXro3QoP5jQafjHp0cybEn
	ggkxXDQg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8xpy-0000000DRlx-1QIQ
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 10:35:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M74LlW1978577
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 10:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBHydZSyrHff1ApJ9bUoZm9nBCnkiZV5DuxO7M+8nK0=; b=NOgxHJQCsYAwIuOM
	V+zrWwvmFYfGSbq0d+FsFo0WmXqVRidxRBwOMQvWtWu9uoEC3v0dOMNIypiJqOwh
	V5cJe4aL/e60Rce9D+rGpyS5CACnzj0lI5Xz8VtimArMBj80RxIyScXml7GIc4ls
	Ua6+on0W00It1j7Meb+R7iZj6LcpHaFrri+p2NkBc1h3usT1gTXA3V6FwameWBEW
	yYEF/QCgDziGpNcqIKQV9lNYJAsVqRikSDUzmga7pyF4fuFob43TQAQb8ndAlCoS
	lwgMWxdpFFdda4LS7SHeggep0z5ofH1LPxQqPnoBUbkMqPoZHYwPS6y4Ovsh1Z5H
	LEViLA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jddm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 10:34:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-868db1b2c64so6689021b3a.3
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073294; x=1790678094; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBHydZSyrHff1ApJ9bUoZm9nBCnkiZV5DuxO7M+8nK0=;
        b=Zo6Zg5IJM294q4kPPZ1+0PWJanZ723Wv9YJuH6+ytHCQ4cWcQMQ6cFC1dzstlRsd8o
         tp/9HNwZTeMNd9Jal8aSXA6PYLzY0UVkWgDueKkYiKWTDBREY7LoIjU0+Qzplh0kOYrl
         xN87TKkv41o0Z5b3UDKCB+31AW7awxpEzs6naTXbtdLB5yhXd93xh4f9yvLvicP/1oT0
         S2XHumIzp3lU25bS9F53Oztj8uTSb1/pcIcYN7PdPhuuMy/zoKTVt3LFtSdt/vagF0oS
         XPQcQh80OaQM1+Sef44NxkROAgI6eSicJpjf3/9QMqCMrjlQk7/69EkTqoOsNOVOQmIt
         64DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073294; x=1790678094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBHydZSyrHff1ApJ9bUoZm9nBCnkiZV5DuxO7M+8nK0=;
        b=lmCUXQLwK0TaPGzjJ0ejZzA6XXnHXi8rp3YB7e1bFXtwSs/aabAv+Mm278IIYpy2YL
         I4m/RchK/vWAaHi7oo89jpK4pxgSRfzasTyz/JHsI2l5fNMeqzkxGk7tEJqmdfYmWiQS
         7EqfHxyggPNl0Ubjsy9WP+5WGImtPLtTB02EaoBdF1xni8p1wcg+aKfjHzkbXZBjKEyT
         hFRp5Wo4NHhX+ZriuK9xVaL1yeqJRU/qH0XdLSXHFR2NTFEeBQvlg7TeMLqcB3Z2NzAt
         SyIiw9PTDXbOcdvKWh0kVgah4ZhBLbJ4UF4xRdO8aDWBQgJs1K0v3zaidI2E0W314uY3
         ZAMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPk/7MCe1LT2+AboMsR6mbh5MIanfd0/ZJBFYpyrVwUfsQ0P/fMJ0Ivtff4+IcqqhyOtOaTco=@lists.infradead.org
X-Gm-Message-State: AFuF++mBxaLGeWIrj1Cl0RP8/y4IC7yV6YJ/ucwejQHyVLbCBQUwJABz
	k2hLdZtMdEWBriNPiRVT717Xf7Nj9MFEdmCb6O4Cg+Aoj6TNBjD3oEFeCTKggVMWyo5BCu9zoCw
	Qoc03E3nTtABZLLnnKMxDDKgpsK+e9M1bPMg73a9hYbtQblHjrqQC69WhcfJsUhEs
X-Gm-Gg: AYBFou0KdrpNrdYGTA/nM3fY2KkWqqU/WV3+8O07eGZs9uIGXNQxE4R+HDNh8tLDhoU
	eZ4JKRL4nJzHnyYB7ryvKw2EQRIbI5zg+I1q5hAe5Ek919EayFKt0bdPlZhKIvKdlrozEmAL2nz
	6YVE46M+8cwnNI7s8fOHB9RXr5YOizJR1Q4ce8pRTY5G/rt52TzEhSBPzRtgw5ppiHVr30zJc1d
	8jbQ1ALqt85I9LopLGpMgtLWjIFMNPnmLHtX1rqevDKDeN3fUsAgKarTTaZ4fJrFF/2ujynVbBq
	mOXxziiWmD8uvtAIaw2ZOqsZHvLs3aa0asvH+eWwJPYSriCI0DNWlMx1dZVigR1AS1BievPi5Rb
	qFe3Xi+FtUYMh/TKQvm+5v3oK7Dm4n0v1mhW6W+27xtGpLKr6mqNaZ6P0Kd5ktWV1YI5I
X-Received: by 2002:a05:6a00:1152:b0:862:72a7:eb59 with SMTP id d2e1a72fcca58-87c81bb7802mr782689b3a.4.1790073293511;
        Tue, 22 Sep 2026 03:34:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1152:b0:862:72a7:eb59 with SMTP id d2e1a72fcca58-87c81bb7802mr782654b3a.4.1790073292817;
        Tue, 22 Sep 2026 03:34:52 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c32ea8d7bsm626000b3a.43.2026.09.22.03.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:34:52 -0700 (PDT)
Message-ID: <d38ed0b7-c9fe-4958-8abb-ddc7900350ff@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:34:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
References: <20260921173033.846332-2-ivitro@gmail.com>
 <974e540d-d6e2-4ebf-8714-98e4056083d9@oss.qualcomm.com>
 <c30b21e218bfb00a1eb3c52ea0b7c9f0dc828592.camel@gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <c30b21e218bfb00a1eb3c52ea0b7c9f0dc828592.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T1pYbjdC3uxO3Pe2jI6__fwWfFG97qCi
X-Proofpoint-GUID: T1pYbjdC3uxO3Pe2jI6__fwWfFG97qCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfX0UfNhpLBwldD
 dCw7s2dOXKDge1e7PDcCK+MkgROrXXlzvlxvTdMGiZHc+LrUInSv5WZSMiH+BsKbHLS+oROeSdf
 P7NS8EP5lCuSsa2A7WMjo4SSeNV/nkNibQQbSxANcWBBFV/xjT+wRg5CJJBGpRRpkJMsmYxLILE
 p4R0rloukwws/jGI5f0sItykcQlK8RxiIlYYU+/AzicgJKn8ebwrvmwyneiFdqGsshhyC5bqnn8
 0p6Hd8sftA944jhSrvb/qvZeybDab6+RYd9CBiCjH4YNkGSGGuAKWnfl8nyJfzawl+AI0v72gOU
 gkmfhks/6pNWeG5K+6vdaQU+XfyRBRJri+XZDUeCIlCixtYoEBjiYX0hALlnxEkiWP0z0cJH6Q2
 SkdNY/r1Vx5vTCsQfLkkEf6AA9BEfoXxtmGEVYpG3e+W2ebPZ4ys0VLqgr7IccUw/wV/DtZ6Wx7
 qemWCidIE6Fa9eD3wSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfXy58DtjYB/gAo
 lfE6u+JWZFh8z5oX3bHqU3yRVfzCSR4RrfFhfk+QRvey3TpLKu8SS6SR6dpNk6I4Cz06GhUMD1c
 NupPwDvFR+nSPJfzjsAVOulXwr7R660=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab259ce cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=W7MpxnUmcWWQ-iNiEcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_113458_851932_7F13D5D7 
X-CRM114-Status: GOOD (  16.97  )
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



On 9/22/2026 5:29 PM, Vitor Soares wrote:
> On Tue, 2026-09-22 at 14:13 +0800, Kang Yang wrote:
>>
>>
>> On 9/22/2026 1:30 AM, Vitor Soares wrote:
>>> From: Vitor Soares <vitor.soares@toradex.com>
>>>
>>> ath12k supports creating vdevs with addresses provided by mac80211.
>>> Userspace can already make concurrent interfaces work by explicitly
>>> assigning different locally administered addresses.
>>>
>>> However, ath12k does not advertise an address list, so when a second
>>> interface is created without an explicit address, mac80211 has nothing
>>> to pick from and falls back to the permanent address. If the first
>>> interface is already running with that address, bringing up the second
>>> one fails with -ENOTUNIQ.
>>>
>>> As in ath11k, provide a list of usable addresses so
>>> ieee80211_assign_perm_addr() can hand each new interface an unused one.
>>> Keep the first entry as the wiphy's permanent MAC address. Generate the
>>> remaining entries as locally administered variants by changing only the
>>> upper nibble of the first octet, which naturally limits the pool to 16
>>> unique addresses.
>>>
>>> The cfg80211 definition of wiphy->addresses does not specify where the
>>> addresses must come from. Some ath12k platforms use it as an interface
>>> MAC address pool, while others use it for firmware-provided per-radio
>>> addresses. Gate the generated address pool behind
>>> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072.
>>>
>>> Other platforms keep the existing behavior.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-
>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>
>>
>>
>>
>> I just did test on QCC2072:
>>
>> root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo2 type station
>> root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo3 type station
>> phy#0
>>           Interface wlo3
>>                   ifindex 6
>>                   wdev 0x3
>>                   addr 22:03:7f:12:be:cd
>>                   type managed
>>
>>           Interface wlo2
>>                   ifindex 5
>>                   wdev 0x2
>>                   addr 12:03:7f:12:be:cd
>>                   type managed
>>
>>           Interface wlo1
>>                   ifindex 4
>>                   wdev 0x1
>>                   addr 00:03:7f:12:be:cd
>>                   type managed
>>
>>
>>
>>
>> Tested-on: QCC2072 hw1.0 PCI
>> WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
>>
> 
> Thanks for testing this on QCC2072.
> 
> I've added the QCC2072 Tested-on line for v4. Could you reply with your Tested-
> by so I can pick it up?
> 

Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>


> 
> Best regards,
> Vitor


