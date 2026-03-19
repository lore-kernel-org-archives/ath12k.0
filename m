Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385991090233
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bt5S92KQQ206jKW4aSaTmm+Ht5CJzX8Upbglh6zGhlE=; b=TqIbAmQeXzpxtDnRmM84pMs8LA
	d7U8VvnjLiEmbX85jGVjjdpc7pNl8NhtedKG1+/0z065DNZeRhL/WGcoRutj/MMm5MCUtzP7/kB9s
	TL9RTVeGhjoVSQKN0p1ws/B4AD6Od5cXblQBJL7bPYuEmZ3sd6nKt4rBikiwXmlozo19nICGrJQGt
	CUWJ+aYyJmwCc42/psdOTzoK/ILAa2fZ4Hl5nTcLMZSoR345PbOmodjF50hartA4vdeAILSsPlWmx
	VNClnyYWU88gvVh+V/+hvvctwyluWqW4y7s4A1YKx0izSp0gDzHlKNS7capzbuwtfibMkClWV3ve8
	6kzU7cpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E8x-0000000Akyj-3w74;
	Thu, 19 Mar 2026 14:14:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E8t-0000000Aky1-26fv
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 14:14:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73vIg1898552
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 14:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bt5S92KQQ206jKW4aSaTmm+Ht5CJzX8Upbglh6zGhlE=; b=DH3Z8IaRGUVTFyKq
	3WSRk7s23ijnlTyxesx6MiSEhfpr13h9B8sMgY6gqpa9VdE4QjFT/2Kv3zeUvo2y
	G1RFwWG6L4Hjq2ghswHSZNYXxHh+dzIawD64NXGKROtXplQhNqfQajxex3tycGOT
	K7GeIpyxgzfPdnnLlO6E6o/k8361Sd6ujBn2AAsYM9QofZJUXktyfH4zvSGewOAn
	XTHyYdLVq1+qXlT2M7r4erVu9arV2x6pIsRFdAl5dR+sLgPgwghzkD0nyWisAaBh
	W3EaUxN6PYqmMyeeupOrv7C7PE4KRNFACyxbSKxtCE2m/mvrE+CNN9hzNnN/hM/9
	lyLGaw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgbpfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 14:14:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b04911610fso12371175ad.3
        for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773929669; x=1774534469; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bt5S92KQQ206jKW4aSaTmm+Ht5CJzX8Upbglh6zGhlE=;
        b=Va5CoFBPIpp1Sz9ZIJc0hkeZKcX3J/nB1fEednoL5Kai27ygeGb5H3w8jYIdDzZYn1
         qm5o/R0vTFW5rIUBwHBMV7t6X6T0v7ISW5n5pENEKh1i66wuczPdoUcENSe/naetC1Fu
         vFUYnol6Q5TS66hC1kmKk3LLX0krEr8m7O2m/tAuoTitlOrmAgg1zYDQRD1cS3eP6kYy
         u97yI5HJWdgwsxuGnYh+8V4u0ZCEeu/dSuTR027e96ZOjE3ow2mAie1qY0XETKomftmV
         hoc+D91lisSDfbd9bHXncX3udLav9ihTD7sIuQghK/+CVohxmCkL3UQOMUjbKPwwDA4N
         9OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929669; x=1774534469;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bt5S92KQQ206jKW4aSaTmm+Ht5CJzX8Upbglh6zGhlE=;
        b=IL7eiEKFS/H0boe/Qnwx7G4TknFY6CNC0wwOwgXWL4kW75/KOMrJRcfxNX20Dxl96k
         QvZnnvKZME8RtUQc5Lc4/a7MqFM1s5KvJ+JOzAVcJnYZ8dk+MNu9NJQBjkG+zZ09q+GQ
         T/xx50Ie9NU9p6NyT9Axs072WuSE7YDBUmZOtrEqX/HDWz05x35KabktXDMETIjErUbO
         I5RtBwm2rNTEaxsUc3FXlOsniMokrEkQwLbA8egbVFGTf8cMZKY3+3R+qeXxXTpmaYo3
         nOGPOwLhkNLRiL6eNgXYwInImI8sNikr5UPPlR9yoIN8I+3HBpCRPy715sEo8h8cX84/
         L+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJRtnDNFGoJPgGt0QlmUVptJEI1K7IPVk+BtE+pRidq4V1esVn+VRMAvmyMovrV/huIyyubtA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDbtKVSzQy3MGytuE2Fz4A1Zj5Z8LCHFIt70+c0u3J43cPxE2L
	U0qfUiYV6GYVCsjyN1PHb7uSXNmE779j04G+o65p0U5UbzXcSJMwL2iJFGfHyfRM0v0yDIphpxW
	4WY3H+4VAVSQw6VvYx2i8vTQ9ctGRa/zshvIyBT66+OK9hRqOiKh/gHErGoQfIk5V
X-Gm-Gg: ATEYQzxICUYXq82p0TpBtMh4bBe2261VhND2O7/23YyvkutCr21aCLqvPvj8vJXwqAw
	ksexiKBRaAkvRDmMLuYFkpsQHri8xZRHX2c6LrQKUP0upc8ojeiOXh+BDrIXZYNPrqBXr/2MB6P
	NIU0rF49SoS1pjt1RtDbcm6ZYic7mKfAL85KPTMoc2ZvCO1uQJoiAoo9WTg2kIkdmU7D4IJIPf/
	duaKpeAcpogS8gkiNjnIrZzKSZ8ZeUY0+59mSlYJUDne2rIrdHqg/0zV5zBdKqhIpB0X7iZd8N8
	Od00W9ajaJEX3lhPExYhvXdZUMaKbyfe2HNVEW8p8JfohiXIWPGGnJu4Z6UCMPnM8pmxYiNajCu
	fv6h09ZmvP7g4z5OGKHRFEZBu/OdTNm4iq6m9QEIQjXEg/3K8NBOqtbQPAPz5Unekt5G6Q0TJBq
	pYkcrJ8eiTGIVOtw==
X-Received: by 2002:a17:903:1ac8:b0:2ae:471b:e55 with SMTP id d9443c01a7336-2b06e3c5c83mr76302065ad.30.1773929669312;
        Thu, 19 Mar 2026 07:14:29 -0700 (PDT)
X-Received: by 2002:a17:903:1ac8:b0:2ae:471b:e55 with SMTP id d9443c01a7336-2b06e3c5c83mr76301695ad.30.1773929668767;
        Thu, 19 Mar 2026 07:14:28 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef519sm60441445ad.49.2026.03.19.07.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:14:28 -0700 (PDT)
Message-ID: <1a037a6b-f39d-4624-8f3d-1298da8c50bf@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:14:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: prepare REO update element only
 for primary link
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260210-ath12k-rxtid-double-free-v1-1-8b523fb2886d@oss.qualcomm.com>
 <8056cb5f-cdde-4890-b8cf-3b37d1c3483f@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8056cb5f-cdde-4890-b8cf-3b37d1c3483f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExMiBTYWx0ZWRfX0UsrP51mLBbC
 TjH0kSnedIp3l2OMDB9m2FhJpEFFzkksZzHibEXc6AQOSjG5Hqntq0lZQ4NeLhIiEzCHciFHxaW
 QqGfyNY9iG+yCtwuHCZKOG6hlwFvd6ex/xlkTwleYvA8WEwlYhWVrnRwzJNYJ3UtRlR5GDor7iV
 DllcMIBvvWAhjVBYDPFtcO6+uU+GzK0vrG+wvTKRhrdXbpFHNC95cKcKrsSIVPj7arS8yrU8jJU
 4ZQ8nQsG6pfSUS5i5JVrEyssWWkKDSj4R+KG3jkuGRCubaejPYwE68caCWhqmePMoMxMje84aX1
 Fp3Kifc1gQYUZt5NhbWwAXIqgA3tEQ2Vkxg9DKXtBz7oJt3iboW4uL081B2D/s/cuMNhrGFtgwp
 RxbzvDnucFWE0JGJscwNV0dZb2fKy0F73cgpnJKeDilLAMWNs56NjGHiSJXClY3pqxV2Bt1J8gx
 hT52R5K5ed0bdfgppyA==
X-Proofpoint-ORIG-GUID: D_MpGxp8EK1U0aO7DzYLsz2KmGeuD9qM
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bc04c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ALmzmtPoW6pM4TZLvQEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: D_MpGxp8EK1U0aO7DzYLsz2KmGeuD9qM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_071431_552477_57B74227 
X-CRM114-Status: GOOD (  13.49  )
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

On 3/18/2026 8:46 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 2/10/2026 8:37 AM, Baochen Qiang wrote:
>> Commit [1] introduces dp->reo_cmd_update_rx_queue_list for the purpose
>> of tracking all pending REO queue flush commands. The helper
>> ath12k_dp_prepare_reo_update_elem() allocates an element and populates
>> it with REO queue information, then add it to the list. The element would
>> be helpful during clean up stage to finally unmap/free the corresponding
>> REO queue buffer.
>>
>> In MLO scenarios with more than one links, for non dp_primary_link_only
>> chips like WCN7850, that helper is called for each link peer. This
>> results in multiple elements added to the list but all of them pointing
>> to the same REO queue buffer. Consequently the same buffer gets
>> unmap/freed multiple times:
>>
>> BUG kmalloc-2k (Tainted: G    B   W  O       ): Object already free
>> -----------------------------------------------------------------------------
>> Allocated in ath12k_wifi7_dp_rx_assign_reoq+0xce/0x280 [ath12k_wifi7] age=7436 cpu=10 pid=16130
>>   __kmalloc_noprof
>>   ath12k_wifi7_dp_rx_assign_reoq
>>   ath12k_dp_rx_peer_tid_setup
>>   ath12k_dp_peer_setup
>>   ath12k_mac_station_add
>>   ath12k_mac_op_sta_state
>>   [...]
>> Freed in ath12k_dp_rx_tid_cleanup.part.0+0x25/0x40 [ath12k] age=1 cpu=27 pid=16137
>>   kfree
>>   ath12k_dp_rx_tid_cleanup.part.0
>>   ath12k_dp_rx_reo_cmd_list_cleanup
>>   ath12k_dp_cmn_device_deinit
>>   ath12k_core_stop
>>   ath12k_core_hw_group_cleanup
>>   ath12k_pci_remove
>>
>> Fix this by allowing list addition for primary link only. Note
>> dp_primary_link_only chips like QCN9274 are not affected by this change,
>> because that's what they were doing in the first place.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>
>> Fixes: 3bf2e57e7d6c ("wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures") # [1]
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221011
>> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 
> Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

Was there supposed to be a tag in front of that?


