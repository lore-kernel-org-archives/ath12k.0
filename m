Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E39C43458
	for <ath12k@archiver.kernel.org>; Sun,  5 Jul 2026 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gj+YLt1a9eyMlIaineSH/PGHkbWi7DsdRDopGs+T6Mc=; b=CKj5M7VxuKxPHDSxAZr1fDqaxI
	mLToW5mQbDb3zABVJKEI+fR3vsyR4UvUcLR02Uwr3QdnOdFQKYN6YE8/WFJiJ8NGBjk/9Vtem19hc
	dSo2ZNcHyLoEpzqT8O4D6hcw/NK6M8uNutsZ2apzmMteiBhN4VVYimQaT6bbeiwnN6gM503weCafp
	2EF+zYKK4dp8Pj7EiQzU655EjNHAzURFwGKbcWW0W4jv4MwxiHy3XA5z9iIoyrYIdNP6RB0Gh0eNb
	qZcZB1HVA04+SttVunE0kyDdkkAvBQcPP7G/Yrpzo26fDbsiZYmXZoqZK4hguDDTEkhJLB7DglpdT
	MKtXB86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQdR-00000009WN2-2j4z;
	Sun, 05 Jul 2026 17:28:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQdP-00000009WLH-1gF8
	for ath12k@lists.infradead.org;
	Sun, 05 Jul 2026 17:28:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655H91X763184
	for <ath12k@lists.infradead.org>; Sun, 5 Jul 2026 17:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gj+YLt1a9eyMlIaineSH/PGHkbWi7DsdRDopGs+T6Mc=; b=mO37KDNb1Udtd+Ej
	wyswc5+W8Y3oKvIa27hBAob4YwrwOfmBuh5xcOXzM9oeowZ5zTf8xGRruSCQKAf7
	5xRdmp1s/CFbSXAidKpJ991RGcXTl7GkN3bXWgquRIqL90/fwaKpKrX0rFV3VBmE
	IKCzUHLwk7FHSY/Dovw5Ye3fTE13PMCT7Mhj0VHrLUoy143yxnB7tUQHARnX0LY3
	j+0nVOaN1BukUZRZzXdbKPt5Yeb+X9paLnf81Idfk/Z3OK3EMhSSshkipyN3woq6
	iBOzlkCmE+Mw4xiQ2mVk1fGvn2R8cGPw+J4POIMr53tEcQ/pfT/2KR8QZHn5Qvfb
	ZA8oOA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkdek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 05 Jul 2026 17:28:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c80be91ea3so47735655ad.1
        for <ath12k@lists.infradead.org>; Sun, 05 Jul 2026 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272481; x=1783877281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gj+YLt1a9eyMlIaineSH/PGHkbWi7DsdRDopGs+T6Mc=;
        b=d4w8va+7xAeXaDLgIN5wMElBr/sbq44OCVTIZC9DT9/ex3+9PsjhMBX5d1ajjWr2jr
         r+Rf0gjHhgxvlpbDjvmZkq5v1zCWJiDBOzFtFaxRNfjKd345eQ4TXJ4qyS0uD/NW8YMT
         2//Jjo4IhrZJ7/ZtfxEIq65haXupU9GmJiTwSMJFMQNUVK83qShf+V0t8wZfGLV6Pl30
         OrJX7QFev7wCV+N6FrlKpTwqGZL85W3f96uSWKk9dKdjNO3Ep3ZXCvVQ2YZeWlazdvFQ
         vGADrELWL+l92LDXO/84gNUKbVKFdO1LiqRtFo2LtkIIQ5dhKIS+WdPFDpECFSMuzvYI
         saGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272481; x=1783877281;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gj+YLt1a9eyMlIaineSH/PGHkbWi7DsdRDopGs+T6Mc=;
        b=r+Dq7dOFCdBnYMrfnFaVl7pTy7VT5i++BQ5fuQ+WZpn+vTQPiVHM02wB8rRRejHkiz
         /B1O0CpxOAIEtAtMga86hLjMH1nfzX82rNsEciBrckvNILu6AUi+EIPSh8EJ4/ahuV1u
         skVxvD6dUjrdg1mp4RhSSCpbpFa9exjOty6IfHzHO2Y1DLzXx2E2fYrgr+RsXo3wKWgM
         pth/JlDZw6R1umXSiQI2CB8G3ru9DmJTCl8E/LfcrjDH0ZB6SPOJA2EqtG4RbUgpoixr
         4gOMfDB5Xh4MR6Fx8IJB+VTtCS3uqIR/PS8S67DYrCmwhSYtzCM+BI3ZWZ6W5sRQjVd0
         Ptfg==
X-Forwarded-Encrypted: i=1; AHgh+RoAXHA/sgA34hrH1UVJYawY5XlqrDvsOx3O8aUULt4dkOCGh6b13Qp2qpb6jOU4B8ykDSq94Pg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbFLR7XcwidKIqVHHexQ0KzlMtDpOKvHGOj60R4sJbD3R5UxxC
	sxBSPAar9Yxvlns5uNKQODXslnHj8jLwLxDckfZB3jfMZo7kzBNjs9q6zqx+sDMZYO/rwgnt5nf
	tCC1mZKB9AkFxBPZIlcjpGnIKBgNprbuffMcDbavv9T9l4LfBEDH7J5Dd0MeazuJ5jsj4EEu8
X-Gm-Gg: AfdE7cnFfG2Pq78RBVHAnSrI6forNiFvSKXUvOkHGHdsh7+3wLwyw5+OO670R90S4u2
	mC09V/FkMnXbX2OX41B4HsmIk/oSu3lGlqntuTXWs2h45dxXHzLkP5ynvmcaEpFBTKeOkt+8H4K
	hA+XEmsYl9I9sEMAPQb1sOC+SFfcX9kwV7b29Q7/TIjZ4r+kipyqtHZeG9itDi+ZFNh7F8Q6jxS
	ss8irSJ32U5F+wor1AMlX8KE0XawSxoJgihh1TD32qqCB7lgkMWW+AXxgmiI+BnCSQzCesXk+tl
	YZVrr1uvrZVCx/XfW4NDLQpJ1TKvSLWNII4gzVppGn7l+pKuNNkpnnMK5VnAqd/Db5FZu4e5qL5
	5wGfLLmWPM7Qh2QmAgE6PzxNtTJNn1GmQtF+JriOfia6ytWyVb8h3GajZsSiwPw==
X-Received: by 2002:a17:902:f791:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2cc94739b69mr13488205ad.15.1783272481208;
        Sun, 05 Jul 2026 10:28:01 -0700 (PDT)
X-Received: by 2002:a17:902:f791:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2cc94739b69mr13488105ad.15.1783272480731;
        Sun, 05 Jul 2026 10:28:00 -0700 (PDT)
Received: from [10.168.91.130] ([223.185.219.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm65764138c88.10.2026.07.05.10.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:28:00 -0700 (PDT)
Message-ID: <b25be5a2-bef6-4fda-b166-becca3d1d650@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 22:57:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ath12k: fix NULL pointer dereference in rhash table
 destroy
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260615112103.601982-1-jtornosm@redhat.com>
 <d0fd509f-760f-4632-b116-0b6494466f22@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d0fd509f-760f-4632-b116-0b6494466f22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4OCBTYWx0ZWRfX8vXbQ1rfj8Zo
 E+EH6AdVEPotxW6ANMFUZY24r20tvTHprBYSo/eiOgouXe5kPQ8LLci/D37ZKPaVOqwvunSFEtr
 CSz6g8bnCpD5hGgDVYCJ7BnhSAxxtJU=
X-Proofpoint-ORIG-GUID: TOLjMLeP8ngozpn0nxPtzPfMLxcSmRBm
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4a9422 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ziM92C7oNnnlFgKtw0sKeA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=DO-9swsaIGp9kS3Vgj8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4OCBTYWx0ZWRfX1UQDy7wQw4B1
 o4jZ4eKBHRXXmcXz+oz8kqynQwZ2Rn6eXpDPjHrxeWJ8Thj+nIhVcbw3GUufjl7Pft9bczbKPhB
 DPFGWAl1J3L7MyDcPZo0PuRtfipNwPEXkuy5/OFB5SgUT2H8OENnr4iIU8gruG/boF/1CGGljgG
 hCuj7CCxFe8fjRjq+hZkMaZ8r5C2eC6sAbyoDBC8nActnVC+2SmogSlOedIe9lYsRkLZdYcrOB7
 xf1Cf3RttbVmWAFtmI0RYaQ4528FXZIAlkmfRP+Ftkxbj6bsYRRiKcGVQfDk1xv3Cw6NKbp+g6U
 S6r4ItZ94LsNiwX2sFFAfDZCIkxLAVS0vukWnV+75tBdYPxQYW04Jkn0nawlqlhPP8Zilllq7oi
 RwVX0EkX/zgiNx+g3y3jZXaAJAOQ/hkxhsdyjlfjOV+35an1nzbL8YEgWt9ZcdqyuMZRatMaS4V
 XIMAc0SUk3rWG32hw7g==
X-Proofpoint-GUID: TOLjMLeP8ngozpn0nxPtzPfMLxcSmRBm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_102803_551838_9DCC60FE 
X-CRM114-Status: GOOD (  13.31  )
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



On 7/5/2026 10:53 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 6/15/2026 4:51 PM, Jose Ignacio Tornos Martinez wrote:
>> When unbinding the ath12k driver, kernel NULL pointer dereferences
>> occur in irq_work_sync() called from rhashtable_destroy().
>>
>> Two hash tables are affected:
>> 1. ath12k_link_sta hash table in ath12k_base
>> 2. ath12k_dp_link_peer hash table in ath12k_dp
>>
>> The issue happens because the destroy functions are called unconditionally
>> in cleanup paths, but the hash tables are only initialized late in their
>> respective init functions. If the device was never fully started or if the
>> init functions failed before initializing the hash tables, the pointers
>> will be NULL. The issues are always reproducible from a VM because the MSI
>> addressing initialization is failing.
>>
>> Call trace for ath12k_link_sta_rhash_tbl_destroy:
>>   RIP: irq_work_sync+0x1e/0x70
>>   rhashtable_destroy+0x12/0x60
>>   ath12k_link_sta_rhash_tbl_destroy+0x19/0x40 [ath12k]
>>   ath12k_core_stop+0xe/0x80 [ath12k]
>>   ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
>>   ath12k_pci_remove+0x60/0x110 [ath12k]
>>
>> Call trace for ath12k_dp_link_peer_rhash_tbl_destroy:
>>   RIP: irq_work_sync+0x1e/0x70
>>   rhashtable_destroy+0x12/0x60
>>   ath12k_dp_link_peer_rhash_tbl_destroy+0x29/0x50 [ath12k]
>>   ath12k_dp_cmn_device_deinit+0x21/0x140 [ath12k]
>>   ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
>>   ath12k_pci_remove+0x60/0x110 [ath12k]
>>
>> Fix this by adding NULL checks before calling rhashtable_destroy() in
>> both destroy functions.
>>
>> The NULL check approach was chosen because the rhashtable pointer
>> serves as the initialization state indicator. The init can fail at
>> various points, leaving some components uninitialized. Checking the
>> pointer directly is simpler than adding separate state flags that
>> would need synchronization.
>>
>> Fixes: 57ccca410237 ("wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base")
>> Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> 
> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

Missed to mention that pls add wifi prefix to the patch title.

