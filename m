Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D402C88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 04:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m89CAfTeZ6FzFSDRlc6XmkWO86zmfxgToEKTXxUgnVg=; b=d+D01henouWFNWO10cEvkldI0A
	dmn28IkQatYlD4jw9iPdnnA6o1ORtt68BXUN+qQagAbrpTSwqRy5geSIV3sZRSh1Sp2Qutovlpz7+
	vKcaiB4e+a94eIWq/kxBtZ9Jo26dZc9jJkyBn+7+6E9bjv7zwn1NaadcYRQuc3LWDO9KguXeYbMhS
	Gaotmmr9Ctv7COUmD/YVNFsAugSzTIDigCUCXYMsDaaIxJqsvhBpkw+Nm21GlfAuJnkUL9eNiSLDY
	S4M0Gnn6eQTp2meqfg9XEgdvaZM+nVAaKd+dR92XXsbPism5a1Bva0gaX9RTY1obp7Pxl7EycEfhQ
	4BU5zmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L0B-00000005CRr-2jPP;
	Tue, 15 Sep 2026 04:42:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L09-00000005CRL-0oVA
	for ath12k@lists.infradead.org;
	Tue, 15 Sep 2026 04:42:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nRLn2623201
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 04:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m89CAfTeZ6FzFSDRlc6XmkWO86zmfxgToEKTXxUgnVg=; b=Cw6QdanNYDz0o6tc
	PXDorZbcLRb1QNyLkbNPYLg4lpdNtKbhhACx2qXLzKGHpjsacm8vBmY042vRHPdW
	EolMgYiaUgEv6JS45uroCLKlmyeGu7qDrzcZMHtT97KWwqyFwav3tkXVfUZOtzka
	cvZ5xyIHm06bbvKE0oSiFkF3FvUpBa/nDHhW1UcghdMmB3U8jDUcFP8RcndYJjpU
	DJzuMIYmojtxQgdSnBdY+n4eTgYBwoZSRF9Hw8uBwkzVWwuDCucQW7lFrz8rkMW7
	WmuHQ/sKnukrN/PhDc/wKK9vWKyXDDbldGUquS374XjZyX1meJA29+/2hbwSnLIm
	fjSbyA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9tc3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 04:42:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b10so4929724a12.2
        for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 21:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789447354; x=1790052154; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m89CAfTeZ6FzFSDRlc6XmkWO86zmfxgToEKTXxUgnVg=;
        b=Xe8F5ZPmiiRhjPpldDs7MQG61HX5BaWPfcWcZkUBg/qGxyIyUeZ/0FIxlHj/DZWFXo
         CzoQwDzuePLeqXB7M4H3Q3zyz8//Rgl7QOYtPvS/WIale2OW0jNRxMK3wrf2D4xcoT/k
         QCArfia7uBoBX32oIvni6EsF4hBx+fcp1F/WGcWM56c8qzRz77B/LRBAkl4hlGqcaw1v
         WTy1HYPq5vASB2j8OTtvJU6Td8idMjbfHf5zMXIVuwFU3GlaUXxCyYA6xoMFXIYOYD/7
         J/CfoW5cRShKHIVnvQ3hswE/xMtulN9YXTjp5Y9HoURPZNnsHFJNdYO3mj3lcK4+bcK8
         TlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447354; x=1790052154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m89CAfTeZ6FzFSDRlc6XmkWO86zmfxgToEKTXxUgnVg=;
        b=DVi4NyVEQKs0iRqjYkzjfXBGPzkp4uGy9IFJFpoTBsAB/7w4qL612X1K6dTGCxxn0H
         WsZhhTSxeGtzb64sNtnW7jCqiYKVJYzfzLQ1/PUesyThmkui8HlDAoOzZaZvdHPavMB+
         mag4y5nsqyd7I5c/yeboFB0W/kXMq8PyzxarH6pkigGff5uFOUD2sklOLSn9aWgYWCcS
         iDgqsWHAgay8jsDfeN+wlk2ROo6lJDl7dBWxejmULwanFC+QuVCnlGIKlmf3rWr6Fn+h
         kqhUmLN5QPJCUxygC+AU/uMQoFhDtqiCchERIezVaBxSkKVsV8Z7YRrFQSzyoHmLn/Fj
         JH/A==
X-Forwarded-Encrypted: i=1; AKwUvByV3mlZ+IVbJcEXwbDxWZoRT6RfVdNFPY2RrYHbHyy3bFgGxAJZobqNJBWvwnqeSeLqEKrT5fY=@lists.infradead.org
X-Gm-Message-State: AFuF++n6nNP1CtrSo07TPBSYgKxKHG9LdCSEaNZdNEJs91BYpa2pze8t
	ZDh9dR9JJAzyXOAQCHYFSycFBEuHzbp/WQ2pg4PWYCtYluBh2TehgBy4XD8ii9SPKWv+HzOsxCD
	dXGk4gbiaAuNCuu1sRX2X3vKz9MTuclcno5x6/2ZLVrF2jOEnUnrTeMDv8+uzVwY/YK/2L6lA
X-Gm-Gg: AYBFou0nL4d1mJYoujfOrs1SSYvecCWN37DMix+tHj6dN3F++ZsKc2sTNGaUfkqbuUG
	2g+Mje+YTP0IBPx9UCkzTmjY6eEMS3wEBsBC+hlZcdq2oJqZprJ85Mz8P32XDGPJF4jrXQRLp97
	U733takMQuZqtohkTjKupxtJ8E880CJ8EpgV5WaRSCvkeDzRLv0PRZhCpQwv47sCvDVmRV14UbF
	zUBwuhlRJfXsT9HZi492iR2WYCU1mSxGYc8+teZz/lzbquXMxI4IKPQRmsmWoLOuseCSvPgFedy
	ytuzKEubL4Ry4rYWj28vzOlj732dk/ucBVpL5jqzfIXguCDcSv15vjGB9Gc6sYE0UmCDRGaZQ8Z
	zAzCdfZPKJVyCE11obgSCzYkP2kUJr9eNFG5lKdBpnqYY+SA=
X-Received: by 2002:a05:6a21:a510:b0:3d1:3c2:85b6 with SMTP id adf61e73a8af0-3db4039f83dmr12744253637.5.1789447354515;
        Mon, 14 Sep 2026 21:42:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:a510:b0:3d1:3c2:85b6 with SMTP id adf61e73a8af0-3db4039f83dmr12744197637.5.1789447354054;
        Mon, 14 Sep 2026 21:42:34 -0700 (PDT)
Received: from [10.152.206.38] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm29800575c88.3.2026.09.14.21.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 21:42:33 -0700 (PDT)
Message-ID: <91836e75-4358-4650-b4ac-80c116ba65d2@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:12:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: QCN9274 WLAN.WBE.1.6 firmware drops pre-auth EAPOL in TX
 encap-offload mode (WPA 4-way handshake fails in AP mode)
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath12k@lists.infradead.org
References: <app7ADVti1eiVQr5@mpf-ESPRIMO-P9012>
 <cbbb5555-60f0-4a4b-881d-403decc53ca7@oss.qualcomm.com>
 <aqFARFlTS7757Zks@mpf-ESPRIMO-P9012>
 <9ddb130d-9e08-41a6-b76b-678b045a22ed@oss.qualcomm.com>
 <81026fa4-efa1-4841-a563-6145e573b2bc@dd-wrt.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <81026fa4-efa1-4841-a563-6145e573b2bc@dd-wrt.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8ccbb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=6i62sai1IDPf190ooGIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA2NCBTYWx0ZWRfXxuUU+w3Fxn4h
 zj62Tly9DHwlCekClx/cTVLcrbUTFVMMH+5m2XMd6rzLZ27EhWqi950GtOwJRRD9l9H2kollyRu
 fJ6CewKn4OElAy2f/bDhM56LQ8iJgG5+4T1eA2HHeC+4wVF/M+THgp26q4dM5fZ9BMWIPDaFk9d
 1bbYDwHe/Ff/8svCj/SCB70xoXmayUjujTMe37u5TyAvj9iTOSmMBRbPXmE7RRKmCV3xkKg7oVU
 +Dn2qBGGC7vpi7ZkHm719ZkbdLVG3kyWIvCDoRFEnKcKDG70IkbgvMzsHzsSRZqbFFQP5EPxzO6
 cTf+dZlF6asj3X2OaEuiPLjO+vUZqz/5ULMfBIqMyydF6xqScEfJ5QnUH3aHQjpNr0UP87+mLuy
 D+PiBX8NgqksVNgTrrzJ/BCzjMU0stSsr/oNiAsL+UzkbXn6hQ84ZLzFmTIJwzvfVur1OiIwkFO
 Jn/JeE6s1I4jN+KtT0A==
X-Proofpoint-GUID: NvQ7knWIsteN9-61hbSeR7LHL5aZKv9v
X-Proofpoint-ORIG-GUID: NvQ7knWIsteN9-61hbSeR7LHL5aZKv9v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA2NCBTYWx0ZWRfXxfmDm3fxDJw+
 v9IZ2z4HdsfCE6CbdOohN3LLO8HR4ZSmNpfKaZmR08+KDXFva6/zcHlnbU4GGZHnbOPWP2v4ItG
 Efe+iKENtCLkkTuEsIEZDtYM2MwjaOI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_214237_353842_C744838A 
X-CRM114-Status: GOOD (  22.15  )
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



On 9/14/2026 2:04 PM, Sebastian Gottschall wrote:
> 
> Am 14.09.2026 um 09:46 schrieb Vasanthakumar Thiagarajan:
>>
>>
>> On 9/9/2026 4:47 PM, Michael Pfeifroth wrote:
>>> On 9/8/2026 9:59 PM, Vasanthakumar Thiagarajan wrote:
>>>> Worth trying with commit
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/? 
>>>> id=1e33f8acd837420160ea088160d8648a3db54c3b,
>>>> if it is not part of your image already.
>>>
>>> Thanks for the pointer. I backported 1e33f8acd837 ("wifi: ath12k: fix
>>> encrypted EAPOL TX in encap offload mode") onto my tree (backports-based,
>>> single-file dp_tx.c); it builds and loads cleanly. Unfortunately it does
>>> not fix the symptom I reported - the 4-way handshake still times out with
>>> reason 15 and hostapd still logs "did not Ack EAPOL-Key frame".
>>
>> Thanks for checking with the commit.
>>
>>>
>>> Looking at the commit, I think it addresses a different EAPOL case than
>>> the one that fails here:
>>>
>>>    - 1e33f8ac only re-routes EAPOL frames that carry ATH12K_SKB_CIPHER_SET,
>>>      i.e. *encrypted* EAPOL. On an established link that is the GTK rekey
>>>      (group-key handshake), which happens after the pairwise keys are
>>>      already installed.
>>>
>>>    - The frame that fails in my case is EAPOL msg 1/4 of the *initial*
>>>      4-way handshake. It is sent to a not-yet-authorized station before any
>>>      key exists, so it is *unencrypted* and has no cipher set. It therefore
>>>      still takes the unchanged is_diff_encap / TO_FW RAW exception path in
>>>      ath12k_dp_tx() - exactly the path the 1.6 firmware appears to drop - so
>>>      1e33f8ac leaves it untouched.
>>>
>>> So the commit fixes the rekey EAPOL, but the initial handshake never gets
>>> that far. Test details unchanged from my original report: QCN9274 hw2.0,
>>> firmware WLAN.WBE.1.6-01243 (the latest published in linux-firmware
>>> ath12k/QCN9274/hw2.0), AP mode WPA2-PSK/WPA3-SAE.
>>>
>>> One thing I noticed: the commit's Tested-on tag is WLAN.WBE.1.6-01270,
>>> which is newer than anything currently in linux-firmware (01243 is the
>>> tip). Two questions:
>>>
>>>    1. Does 01270 also change the firmware handling of the unencrypted
>>>       pre-authorization EAPOL on the encap-exception path (i.e. would it fix
>>>       the initial 4-way handshake, not just rekey)? And is 01270 planned to
>>>       be published to linux-firmware? I can't reproduce your test setup
>>>       without it.
>>
>> No, the EAPOL packet Tx handling remain between those firmware binaries.
>>
>>>
>>>    2. If the initial-handshake fix is expected to be driver-side, should
>>>       ath12k also force the pre-authorization (unencrypted) EAPOL onto the
>>>       native-WiFi path when ETH TX-encap offload is active - i.e. extend the
>>>       handling to the is_diff_encap case, not only the cipher-set case?
>>>
>>
>> We do not observe this issue in our local setup. This behavior needs to be root-caused.
>>
>>
>>
>>> Happy to provide full hostapd -dd logs and tx-path traces, or to test a
>>> firmware/driver fix.
>>
>> Sure, the below logs and configurations might be helpful for further analysis.
>>
>> - dmesg output with ath12k debug_mask=0x6000
>> - dp stats output before and after the issue:
>>     cat /sys/kernel/debug/ath12k/<pci-bus_id>/device_dp_stats
>> - hostapd configuration in case this helps with the internal issue reproduction
>> - hostapd logs
>> - OTA Sniffer capture, if possible.
>>
>>
>> May be continue the debugging in a Bugzilla tracker for this issue?
>>
>> Vasanth
> 
> just as notice. it have a similar issue but only with wds 4addr enabled. (which btw does 
> not work at all with 1.7 firmware, but only with 1.6 but with crypto enabled i have to 
> disable offloading on 1.6 to get it to work)

There is no known issues with encap/decap offloads in any of the data frame addressing
modes (addr-3/addr-4). Here as well, if you can share the above logs with 1.6 firmware in 
issue scenario, it will be helpful.


Vasanth

