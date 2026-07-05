Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C85CC43602
	for <ath12k@archiver.kernel.org>; Sun,  5 Jul 2026 19:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzHURdlTBy4HGtMk9pPhO21TM4DbHArmKo3PXiJCc4k=; b=T0489FgYRk3Eb6zjEUQd5NlQT7
	o7V1TnkRNjhCSutneRf+aoI6ww0oEdiBqhGJW900MBk+W+jfOJ3CuGvvIoPS25FRI0cvTuV7dR2sA
	BzN9IMOlpJXD8l4swfDBdsgIcQfpNiUlCr2uvrnUQtk5kBoO8r49ZSR8Kzme+5m7lhe4xBgJ7vVlb
	PKAS/Ci1840DfWlcCPnRx6QhuCH3C8acdS0AP7QPXhW9g3F1nBQqAAqK2ADVzTl5wxHKtgtddmMCu
	3kF/T81hvKBwdb0+6ax8yMDegkEuP+es3BlSkfcDYSIfrMOKaRmd2uESSVL/4TEf6LHIRsVnZhLzx
	ZzaJsatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSJB-00000009bdw-0Z9E;
	Sun, 05 Jul 2026 19:15:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSJ8-00000009bbf-3qiO
	for ath12k@lists.infradead.org;
	Sun, 05 Jul 2026 19:15:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665IDVQT2402180
	for <ath12k@lists.infradead.org>; Sun, 5 Jul 2026 19:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JzHURdlTBy4HGtMk9pPhO21TM4DbHArmKo3PXiJCc4k=; b=RYYoPstc/ElDH0lQ
	+9fg1uQrsS0yv/soaDeKupGZTFCQ4bqXSRUZbtYo1LjUlL/9osR7Y08YMWl8BYyF
	4GZCWEd/IeHOKcrAfTOHWuiP6SQn3l4LcVpsS8T2yT5mCAmHn9tVP4azsSQAhFV6
	Tu0AgiRGkle6VATOVPsBbNUInpeUP8Zg1P9QHRt+plhYFTAQLVHZENXC4Yc7QKhB
	Oot0k/6BeP7Opqy9XxUjQnkLDK9rnlZhXlWrOG0XFRnJz5hmma14wKXFWSstn/jl
	kgBkKXAOMVT7RLlymwWiZ1dviuUQbl3coHy5nZUp6fjVLC1UPB274OnQHGQQLQ36
	9tOkkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvkajb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 05 Jul 2026 19:15:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c81db324caso51279145ad.0
        for <ath12k@lists.infradead.org>; Sun, 05 Jul 2026 12:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783278911; x=1783883711; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzHURdlTBy4HGtMk9pPhO21TM4DbHArmKo3PXiJCc4k=;
        b=SQ26rUCyNVFJguV68cZxhSQmGBSBGdgYCXZlteabge+ET8pegytpp8Hp6QYBcRjYc9
         T3vP4BqLCRqJx5LuCR0dh6ZSDcEnta5NttQ7EMZOi983Iuu7oCcQlwRmXcJ2rtIBEAbt
         ukBO0k5XToZOKfpAdsgi33FiLWFpc20I5NBMKPhLqp+HUK+G8mgU1K9xvS9k/bo2BH/U
         EnzqcY0mGWnnyt6OoAJsYKxd7lW9O9OPg5xHq6yqg1m3K0xbm9N1za+UBlkR+4pUDo6n
         i3mG2QMRcHZZYVQIWiKLYNAnBBJhMr3/n5xah4g1KFp4Gi8T91Mc4qwtU6fMf391AopM
         1zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278911; x=1783883711;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzHURdlTBy4HGtMk9pPhO21TM4DbHArmKo3PXiJCc4k=;
        b=nThlHoq/3Qn+IOpaVGFISMQ2hdmIkXYq4I6h/Qs9DiRjzV+uJO3JQfPqJNp9QUP5nD
         ZkbfGlRt/rwh0+e1GK59mipKwuyeornKviD14OO+SNfrJ9+dzvBjdviY49/5jdCCOcy/
         lgcdQM7vTG7ASI+AmA/bUjCdG6PelZvRymGizlt8b48gMYltgrdOzVKrBiRAQgVzBufl
         7NftdRxw2U8ArSuNl0uO80+lbRurd8w7Pcd1o1EkKoUO+9si8MOAFK+6J+092J/2fafG
         8xI80ZnGHnRvaEDj5psSUjmGVlgMsLecmIirenCDLom3MIoEDBq/z+um6n0h/cv85mYl
         nRjg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6NeYOyqU5PfULkjrTbGgxYd76ACVRG2ZIEgKlMkUfT0T0UssC4xpvMgMcaioI9z/S8iF6RTc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKwCPsMjHOMy4L6l2zhNCEVj/xOzz30XgrVT8i31yEQWhkAif0
	Wr7oV27hspSxPwNCWq0cPzydPOR/fjsvlGdCYcbcXha9O0H9f7c0BvjXNj5icnm2HrcYU7UV8X1
	XGdSXEicOmwuAXJe5D4R5O6I2CzOVq+X/8IWnZ5pslhD6oI3Oc2n4n9eGsvxzRB8c
X-Gm-Gg: AfdE7cmNRtj+otAPiHwHMrV65HHAgOWoH3hMw+IVh+3eN5Z7gPW9SKlVmCV4YmjZqig
	FFrbzfOmMS+Z5I41htwgFksPv0PxpgaFjHdCTdIocYfkRM9spIId/a9mXMKwAKLHYVwcyG7Sl+x
	VDJn53x+BrjlQM1nuX6E4Mah6iUCr8ppyEgXLZtT4EiEIQC8ibHq/WSuNQI1RpbmIEwunKz0Jz4
	6WhyAoy1KHDhgjQr3PaPSQsLqo2hRSkuZ9eeD9f7/rhWLLGUdglMohLiHCIIt42O5ZEvEDIfecO
	aMn9Sw7kT13B+yGS6NMyCN5yqcd1+k3ncyPgmPv9hvrCTq7PTCbl5rk2dqx1b/BmH5F9qoQHmFF
	edhvz48YjLKLyGJFP7uAJJBHlg9JdYvJLYo1VuVGYI7RHWZnkYnCwtNLlADVO966Q8Auv
X-Received: by 2002:a17:903:3202:b0:2ca:d151:382d with SMTP id d9443c01a7336-2cbb9e38d1cmr78130885ad.14.1783278910466;
        Sun, 05 Jul 2026 12:15:10 -0700 (PDT)
X-Received: by 2002:a17:903:3202:b0:2ca:d151:382d with SMTP id d9443c01a7336-2cbb9e38d1cmr78130605ad.14.1783278909958;
        Sun, 05 Jul 2026 12:15:09 -0700 (PDT)
Received: from [192.168.1.11] (222.sub-97-215-84.myvzw.com. [97.215.84.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b492a088fsm31335582c88.15.2026.07.05.12.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 12:15:09 -0700 (PDT)
Message-ID: <c0b69719-980b-4a43-b918-007751e7e925@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 12:15:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ath12k: fix NULL pointer dereference in rhash table
 destroy
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260615112103.601982-1-jtornosm@redhat.com>
 <d0fd509f-760f-4632-b116-0b6494466f22@oss.qualcomm.com>
 <b25be5a2-bef6-4fda-b166-becca3d1d650@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b25be5a2-bef6-4fda-b166-becca3d1d650@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4aad3f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=i4k25I72rCCN9bAAQd7+Jg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=TRTaysboXGgomUBcWKUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: CkmYDpkxDc0_oumvSWcsavU7_e4QKv9d
X-Proofpoint-GUID: CkmYDpkxDc0_oumvSWcsavU7_e4QKv9d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIwOCBTYWx0ZWRfX4jO2GeJAYP/R
 n6RZ/DO3yl8B5VNVMEJaLAgSoZy2cL7HnaedWc/b6Nif1BwXHeU7D2vzyma6RtFn6vPGG3K1y1z
 Rre/fGkB9z8ZwmfII50TKK8QEZrT+vauz3KQ0wmkXwU7Yjim7S1fdLv1LrHf8rCF2GqVci+2ZLI
 SM7zGPTF3n2HIoU7RKDyyrJVxQH7ydUeon1PXteu4fZi88I6ZNF65Ak4Y1F3Js+FeFqDZvcncGJ
 pLpzWJCDRBWoj0A/aCAZY4LeZVAyZsJwrDwFOZl1rD1IAchXalkSMdXGxdAN7aPjNVPWiuL6z+T
 SWg89obkQPWCZaLezuSu00m0o3sbMZxMTKrYCDwaDAdIsft2T+UdYOpFnZwiogNZhc6xvs5t0fC
 KJBGgdBj8yvYX8nx/XjDgUHJjIPcDQBzlTgu+pd4k78/SuJhZE7325dacZb/J2B0p7vZEssaZhK
 idppvqd4o/5X3wPJ4MQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIwOCBTYWx0ZWRfX/zTkVitmUL+t
 N7p3SfJMaiEFGT/kZ8hdA90UCFE9o98DG6rrKwOUNOnm/AHorstjbrDRVIK1Msav8RJZlLnRZQD
 X573O5HeAiZEJFC11Ru1PKH3xY4LwJg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121515_102059_C8E79115 
X-CRM114-Status: GOOD (  12.60  )
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

On 7/5/2026 10:27 AM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 7/5/2026 10:53 PM, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 6/15/2026 4:51 PM, Jose Ignacio Tornos Martinez wrote:
>>> When unbinding the ath12k driver, kernel NULL pointer dereferences
>>> occur in irq_work_sync() called from rhashtable_destroy().
>>>
>>> Two hash tables are affected:
>>> 1. ath12k_link_sta hash table in ath12k_base
>>> 2. ath12k_dp_link_peer hash table in ath12k_dp
>>>
>>> The issue happens because the destroy functions are called unconditionally
>>> in cleanup paths, but the hash tables are only initialized late in their
>>> respective init functions. If the device was never fully started or if the
>>> init functions failed before initializing the hash tables, the pointers
>>> will be NULL. The issues are always reproducible from a VM because the MSI
>>> addressing initialization is failing.
>>>
>>> Call trace for ath12k_link_sta_rhash_tbl_destroy:
>>>   RIP: irq_work_sync+0x1e/0x70
>>>   rhashtable_destroy+0x12/0x60
>>>   ath12k_link_sta_rhash_tbl_destroy+0x19/0x40 [ath12k]
>>>   ath12k_core_stop+0xe/0x80 [ath12k]
>>>   ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
>>>   ath12k_pci_remove+0x60/0x110 [ath12k]
>>>
>>> Call trace for ath12k_dp_link_peer_rhash_tbl_destroy:
>>>   RIP: irq_work_sync+0x1e/0x70
>>>   rhashtable_destroy+0x12/0x60
>>>   ath12k_dp_link_peer_rhash_tbl_destroy+0x29/0x50 [ath12k]
>>>   ath12k_dp_cmn_device_deinit+0x21/0x140 [ath12k]
>>>   ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
>>>   ath12k_pci_remove+0x60/0x110 [ath12k]
>>>
>>> Fix this by adding NULL checks before calling rhashtable_destroy() in
>>> both destroy functions.
>>>
>>> The NULL check approach was chosen because the rhashtable pointer
>>> serves as the initialization state indicator. The init can fail at
>>> various points, leaving some components uninitialized. Checking the
>>> pointer directly is simpler than adding separate state flags that
>>> would need synchronization.
>>>
>>> Fixes: 57ccca410237 ("wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base")
>>> Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
>>
>> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
> 
> Missed to mention that pls add wifi prefix to the patch title.

I'll fix this in my pending branch.

/jeff



