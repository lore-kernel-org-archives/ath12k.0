Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34508CA5FA5
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDG8O2Xi893kxZ1X4lsNGubwTtFSLtBJs+F+MPecEKo=; b=TdZm48xEEj9ThslVkeBGwgtu0q
	etpgaMklVENT1lQs1ZNu6S6ulYdymud2sfLEZCrkgtL9Sb3PP4FRpJyJBd4FFby1OOr6gXGnpeUpZ
	r3mbiGMNlmqCEXC5WvNUUa+EifdAC7T8leUz1JrFgkycMhpy5pWwRKbzgMHJUqCYnJD6LivVm+BrT
	/U1KPLQg6AVOuvdmqscpL65VaQW7hifNSmsAexguBmy910ld8hz2QlV/r1dup+KuzyxU6yOBZGYJM
	GARNpIgzski23+lgIH36XV8UVQmiBCqCNJa78ANQXVRPpXcSARE4w41hlEDv6hbi1wB6kGp/hsENS
	u2UhLCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYGu-00000003iy9-3OLc;
	Tue, 29 Sep 2026 13:53:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYGr-00000003ixj-2nJz
	for ath12k@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XDG8O2Xi893kxZ1X4lsNGubwTtFSLtBJs+F+MPecEKo=; b=oAuyHBIbd14th99QL7k/XwNyYi
	Mt7VsWDDB65htAHUVg6gTu1UmDUdzCoD2faeLuIHo9qWIWNCU2IeQKaQv4kN5kgV3gYzeSD+yEgq4
	RFS96rlBHAsvMSSOaj9OTytgdlwgFksEDwYhymWTftDR9xDRxhTDXWpwPES21twV42ViX4ykXut0e
	ZNdUjLqvMCSV3NNnr4nXbRKo2AGxVo8csw/UQTtG95hfHSSvAvrhigEjFxDpDRmm3e2IbbWXN+FRP
	VhbIhlYiPEQPjtLQKLTlGRsustT3L3K5GgvPeh3ymvmMJe4o5oF6qlhr2Jqbx0ghyFThUgsL9nH8R
	g7NZ/SkA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBYGn-00000002hiw-3pPD
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 13:53:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqf6M4151381
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 13:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDG8O2Xi893kxZ1X4lsNGubwTtFSLtBJs+F+MPecEKo=; b=AtVSE2VZCHpsPd3K
	a2Qpu0EXbIc9jcHhFlbYKAzRZJW8XXTAh7k4AhWO+FU4BPOKuJwejJJYh10KMzfq
	jIMH/fLMm8wq65O3gTxWKEoz0LIeCgcXDfdAJafqULodZtrorCcm17k31AA737VK
	7xSKevuykbRRNqXNBQvA3UQeSscf2zsHKzZnhr3yvopm+FvqFpOtPU5QBN+67uOg
	XrbX+uMHVCWQkgQOawy5Ae+HQtgKeKP7mHDjVf/NbOfL3Uiv3TduWe8zI/udL6WA
	RqBH/e8ErhZlmLBMkIHFOzIvfPAgS7IjDNx9A1bGSOthFePVig6izjFFhlnpedGG
	KhxbIA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwncchv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 13:53:17 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dc57e2a3f2so6465251b6e.0
        for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790689996; x=1791294796; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XDG8O2Xi893kxZ1X4lsNGubwTtFSLtBJs+F+MPecEKo=;
        b=YZwoN5z/C/lZKsFFVTQIKeRoIGao+DKLhMaILpQtnyN/Krf1ql8OjYAYs1oGpqQBwS
         SEmk4zPHsmcTqGjZ1fb7AdakURWYHOdmrWhWuXjFxsAwAFL2YCDRPM754Oj+wgeeYtLj
         Kvh0nY3b5S6NPKGm52xJWXtstRQ3DuiptVFgKxVmqhijGj0tqDMe+nc55XhCY7ZnN1R5
         QaKukXU5gfeBiv84syGZ3ZFVp4n9zRDB73vJDt73cwwVjnEZHKHC3FNGBR+CqeI13yPB
         Gt6RaCzmgf6Ui7GthZfP1xrqe9QTlp7ddIwnPzo58zvJJ+F76sKHkdgpGVX/C5YaLjIk
         y+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689996; x=1791294796;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDG8O2Xi893kxZ1X4lsNGubwTtFSLtBJs+F+MPecEKo=;
        b=EdlYIrdbhxZqCIFuOZWtcoII1XyZ5Xy5gDlgmqnsdaAhqQHOEMjz9ulXOapxhSJ/RH
         QNBmtKSDzYBxxl0B6P/vZ6mQwC7HAMX9M9miIGD/u3KCnBZh1OtDGutlwuNx745h2WVo
         qf6Vd8g+uN/vLqcFtajgriP0Gxwtuvu3IbSQpl3FAoEvGOUJ5ODZr68CVA6VpMmPdHyo
         CnNgX0HEoD4Hd0Afg1YDds4fQOihhmRlTEeJpwsUCoPK1vLjxY6D0PU40/M9p3GkyTWl
         IY+vZlubdSEhbt4ak+9b885hsFlAEUb+Oh8IbHhWrD7nfRe8tR75BkqZFbauT9rsgtfj
         cIkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBCpXJ4/EhdZEK4hPRIYcXL99VsSnwCumpzvju0xIjayujOzU4lCzrBI8e2OSh9iM7/YQ1UxE=@lists.infradead.org
X-Gm-Message-State: AFuF++miqMqd9bWjuqugCrN3RBzQ5Y8CzwdCFJzeF1KcG/VHLAigg9MS
	z3WvbQ47p2KV8+RKE602ohtytVOD+JvgGLwX5qRteVW3U8pTlIlY2yW/t8/84+hzOJNwmkABqja
	xHe2DD2HXW1KsRAuyHwP+GEe9SBgkFFH2WflJxoB04j5wK+NUt5FbOHo+TKdnlFqi
X-Gm-Gg: AYBFou3FtHQdl6wqP6/M+0W6VqMCLIJNFqzU9KvH6nXDzgp5bbS8yIF/pWDUAfTonBv
	cK/eQ+IymgOr9wQd/I/QI2HoPfdBQwOEe2A0xnXyDXMMyvRiMzpkw4nTFy1JJVZRXHLSXKPRPIP
	x1ZzHD39oVQ8tdMX22OS0wZUc8OZGH0NP2mbumStrjHAHWMr5NS3TSDXTMBQyXe/GMYTAq+koWG
	5ecUDp2p3gEV3pdM68P4LL2rYFwkkdX9lqqHSZPEvzJca5X6uD/O9p5auUyuxLAvipa1apeYRNU
	Mk32lWYKVDbnDQKh6fSmz2KCfI6K3KnJAzLJCAb2r0sFr/ZDZJdzdi6AKyzhoB8sA2o0j6k2hB7
	uq/YMPCoVCgXXHIk3+IR3fk0lN1p4i8BdM1LEjhzCfZmEkULTrvOnsz5dU0gJ
X-Received: by 2002:a05:6808:508d:b0:4e4:fbfb:efc1 with SMTP id 5614622812f47-4e4fbfbf617mr9776226b6e.58.1790689996260;
        Tue, 29 Sep 2026 06:53:16 -0700 (PDT)
X-Received: by 2002:a05:6808:508d:b0:4e4:fbfb:efc1 with SMTP id 5614622812f47-4e4fbfbf617mr9776209b6e.58.1790689995778;
        Tue, 29 Sep 2026 06:53:15 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbbb2324csm4691834b6e.8.2026.09.29.06.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:53:14 -0700 (PDT)
Message-ID: <58cf630b-94a8-4f72-a025-f9db0f2adad7@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 06:53:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath12k: avoid IDR mutation during pending mgmt
 TX cleanup
To: jiale yao <19888972804@163.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926154824.75224-1-yaojiale02@163.com>
 <20260926154824.75224-5-yaojiale02@163.com>
 <773e57da-a9d3-41dc-805c-cb38b38b1dc4@oss.qualcomm.com>
 <77a815e.77f1.1a0e71f6167.Coremail.19888972804@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77a815e.77f1.1a0e71f6167.Coremail.19888972804@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qkLHkDnjkEC0nj8UMf42tkAkV18K8C2I
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbc2cd cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8 a=uR8-w7941YXdG5CN1KQA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfXzXi1r7o2iad5
 Ridlk9a6GkUKmGQZCxAH0lXYu0Fy29ollrs/5icO1YXB/8V0FcmqZeiQGgv5z7eZnwwI6w+ve0V
 atlVxgqjbvrlTWmhpLGVwcPv8bnxWemQTNEFJPBSVeB22leDN7RbKQTZ1NZ6Ufi9uDku2+dKNOv
 7zTjEWbikV1PrdutTkvmDboIAy+lrZOR3kbX0k/JMwBHdkD0PDIiY1Nf+o2KBHA0qde4puxI7ys
 /aGEGzHt72wrIAzeTgi7MjvuuIRUV2iMlHZzHkqAnOKo0nCwoZ7EZZJ0ekzThgfWLcO/o5F/fz5
 q+ZeiWIFiyGSZG7zAcFiqtddFdwntPGAtVVdMmUcuzerOxJPjrDO1zBbAQGD/p0i9Cv1zwzBjTM
 ibKLIje+p9xnTkbZRLnvN0wQ83O6KjTQ5XWc5O+SdcRJN5LlIDgiGepCHZc99pb/WFh1wROGZjc
 fzegqWlhp/v8UyUJwlg==
X-Proofpoint-GUID: qkLHkDnjkEC0nj8UMf42tkAkV18K8C2I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX5z/RSUZp4+fX
 Nf5T13P6qR9XZFLpBOStLGMZmpbxRE7ftIlIXsUESBXjF0jgILZQqZmBGMYkTVckZnTRKLKKvUW
 ZjpE319P7OEjLRiAHou7I0C/TUmzYtk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_145322_749129_78FB7F6B 
X-CRM114-Status: GOOD (  28.60  )
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

On 9/28/2026 1:26 AM, jiale yao wrote:
> At 2026-09-28 13:49:54, "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com> wrote:
>> On 9/26/2026 9:18 PM, Jiale Yao wrote:
>>> ath12k_mac_tx_mgmt_pending_free() is passed as an idr_for_each()
>>> callback and removes the current entry from txmgmt_idr. This can
>>> invalidate the radix-tree iterator retained by idr_for_each().
>>>
>>> Both callers destroy the IDR immediately after the walk, so removing
>>> each entry in the callback is unnecessary. Split skb release from IDR
>>> removal and let the callback release the supplied skb without updating
>>> the IDR. The following idr_destroy() tears down the IDR itself.
>>>
>>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>>> Signed-off-by: Jiale Yao <yaojiale02@163.com>
>>> ---
>>>   drivers/net/wireless/ath/ath12k/mac.c | 25 +++++++++++++++----------
>>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>>> index 99bf5cf79d10..7695b21149d1 100644
>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>>> @@ -9166,18 +9166,11 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
>>>   		wake_up(&ar->txmgmt_empty_waitq);
>>>   }
>>>   
>>> -static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>>> +static void ath12k_mac_tx_mgmt_free_skb(struct ath12k *ar,
>>> +					struct sk_buff *msdu)
>>>   {
>>> -	struct sk_buff *msdu;
>>>   	struct ieee80211_tx_info *info;
>>>   
>>> -	spin_lock_bh(&ar->txmgmt_idr_lock);
>>> -	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
>>> -	spin_unlock_bh(&ar->txmgmt_idr_lock);
>>> -
>>> -	if (!msdu)
>>> -		return;
>>> -
>>>   	dma_unmap_single(ar->ab->dev, ATH12K_SKB_CB(msdu)->paddr, msdu->len,
>>>   			 DMA_TO_DEVICE);
>>>   
>>> @@ -9187,11 +9180,23 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>>>   	ath12k_mgmt_over_wmi_tx_drop(ar, msdu);
>>>   }
>>>   
>>> +static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>>> +{
>>> +	struct sk_buff *msdu;
>>> +
>>> +	spin_lock_bh(&ar->txmgmt_idr_lock);
>>> +	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
>>> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
>>> +
>>> +	if (msdu)
>>> +		ath12k_mac_tx_mgmt_free_skb(ar, msdu);
>>> +}
>>> +
>>>   int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
>>>   {
>>>   	struct ath12k *ar = ctx;
>>>   
>>> -	ath12k_mac_tx_mgmt_free(ar, buf_id);
>>> +	ath12k_mac_tx_mgmt_free_skb(ar, skb);
>>
>> this now keeps the freed skbs in the idr for the whole time 
>> idr_for_each() runs as opposed to previous implementation which removed 
>> the idr entry as well which looked safe.
> 
> Thanks for the review.
> 
> The original issue is the same as the one fixed by commit c38b1e19485a
> ("firmware: arm_scmi: Avoid IDR updates while cleaning channels").
> ath12k_mac_tx_mgmt_pending_free() is called from idr_for_each(), and
> ath12k_mac_tx_mgmt_free() removes the current entry from that same IDR
> before the iterator advances. This can invalidate the iterator state.
> 
> You are right that my patch leaves freed skb pointers in the IDR until
> idr_destroy(), which is undesirable.
> 
> I will send a v2 using idr_for_each_entry(), which performs a fresh
> idr_get_next() lookup for each iteration. The entry will then be removed
> from the IDR before its skb is freed, avoiding both the invalid iterator
> state and stale skb pointers.
Thanks, I just came here to comment that my AI agent spotted the same thing:

The patch introduces a real UAF window that did not exist in the original
code.

The window:

In the new callback (ath12k_mac_tx_mgmt_pending_free /
ath11k_mac_tx_mgmt_pending_free), ath12k_mac_tx_mgmt_free_skb() frees the skb
but leaves the IDR entry pointing to it. idr_destroy() only runs after the
entire idr_for_each() walk completes. So between the callback freeing skb N
and idr_destroy() removing entry N, the IDR still holds a dangling pointer.

The concurrent path is wmi_process_mgmt_tx_comp() in wmi.c:6436, which does
exactly this sequence:

spin_lock_bh(&ar->txmgmt_idr_lock);
msdu = idr_find(&ar->txmgmt_idr, desc_id);   // returns freed skb pointer
...
idr_remove(&ar->txmgmt_idr, desc_id);
spin_unlock_bh(&ar->txmgmt_idr_lock);

skb_cb = ATH12K_SKB_CB(msdu);                // UAF: msdu already freed
dma_unmap_single(..., skb_cb->paddr, ...);   // UAF

Why the original code was safe:

The old ath12k_mac_tx_mgmt_free() callback called idr_remove() under
txmgmt_idr_lock before freeing the skb. So wmi_process_mgmt_tx_comp would
either win the race (remove and free the skb itself, leaving the IDR entry
absent when the cleanup callback ran) or lose it (find the entry already
removed, print the "invalid msdu_id" warning, and bail). In neither case could
it get a pointer to an already-freed skb.



