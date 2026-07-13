Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3410EC44501
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDPxzBtU90wclqaKo2TSOT6TO+880sfHe1SFtealZ+Q=; b=Vr58/64Q7Kz2mnoa+x4BbSh/vw
	MHmgETdbij/jEt66s1h1izBd3bbdNRPDkvlzlT3SPfacPkI+GlGEwCfwrOkqOOU587+OMIfe0cZNl
	901JvUnStQfpzffyR2Z/5C6WoHzVtqv4FYm6lkQmZKMw6tHCPjsCfxsJhl49+hQE5d+UpyftvUyAY
	BttEwVyLH3r4CxdMVmACNbMC7XndrPp3bwrInikd6+XgwoAPS4fyrjmUlsn+mMrbDSwQIb2nvlmfh
	XjoYHxlYoLMPNn3Dt42OmxAu9SJ6AL8YesAQyTsiTcoXtJjMktgzHTTs7uPuyzfxOBjP1N8U2gLHJ
	XxVLpZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB9F-00000008QdB-3yWo;
	Mon, 13 Jul 2026 07:32:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB9E-00000008Qce-3b6W
	for ath12k@bombadil.infradead.org;
	Mon, 13 Jul 2026 07:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oDPxzBtU90wclqaKo2TSOT6TO+880sfHe1SFtealZ+Q=; b=YEvwIR5s6XJ8NyTss3dDz4Q8qT
	jV/cW9VyJJw6ueKFCaepfvrUsRy+xM+X2kBAJs9J+GgTsVWrPL45v6JXba2vS8wp0y6miLXcVc7+E
	o1UcMu4oa7BEL9wV4iZpBjEDtvnv8SE2ACtgW5RHbzC0iyf2xHCieWpOhGSmGfL8FpQgPuqRCsytt
	nEOgeGKlIcX4yx+DWZ4eoGJnV4r3npb5ikMAZHMO8ACVf7aLZPdaNNH5nuWE4E3WozqpijHiTl+Sv
	h9zG9ZY/REwuTZhFdFXQnI9orjdDKGeUcdVfAh1KVyd8ZES/T7o2T8nnNlyZQHev1UZIPVn6uI/Ii
	+B/bJSXQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjB9B-0000000BOsS-1ptG
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:32:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NwsA390873
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDPxzBtU90wclqaKo2TSOT6TO+880sfHe1SFtealZ+Q=; b=guCW8lQ9OcGw/NEC
	ioGpc8LNS1M/bRYJxewFTbkZzhvaM0sTpVTj5LWNj3cof5xVuat32N4Sng1mG3Ms
	4ddUaOy6PsSf9WbghvFwRiWOhazey4wR0aVzSGpnCOg+cs2eXev/g8nEV1Bu04Bd
	sk+7jMXJzDMqveCwcbO8O4X9WgTqRy2WL4zuoLrdK47quXczXgoDKlYW5SRpF+TN
	9Erd8eIyjJMffgTRY9iMlkC5sls+0FdH1M4X1r0ugxX4RArSMYhOSDgSJj3wknrp
	nCMoYSA4x3F7Rh61x0lsewP3vSJeG2tGUJhyztpAIB8T2ARpGCMyF+iZFlHTk8Q9
	rwNkRA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gmv01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:32:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8482b95574dso3328214b3a.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927928; x=1784532728; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oDPxzBtU90wclqaKo2TSOT6TO+880sfHe1SFtealZ+Q=;
        b=a1ZZcz8qavKZbPiXjE1HJAcPutG2UA2myPn3ltf6oOyy6op2MQTQ8XSQ/Ru/KHisGC
         JNVHTsRlyqU57U4WGp+La7XJ8Efy5GRrT3Sksd7kHhpk5bmlzyRROXUXYM9xaBj6Tcxo
         hU7QpGb1I9y2C8tad0VDTgw97wRNRdY8LeWNmpgTGgg6I4bTy2K8IwhKyaULLkZO6Oo/
         OwWZECgxY3QD96zhEm08qU9lsf3ME20r/KJUPozSl3fKnLUl0bTeU4MzhvASq8UuTNRw
         VvdrkdLwZ1jFdAUS6Gy+0CGNbow3DYgAOMt/03HdfodgDbnQucLD8ON67SAbRmHnfTH1
         JkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927928; x=1784532728;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDPxzBtU90wclqaKo2TSOT6TO+880sfHe1SFtealZ+Q=;
        b=oTsthWwDpcaopc0Oc+ciS4r4fpy66ms9qL+TVCc36+8D7zZ7umx9D+EaBstxOB656b
         pNVIEy/X7wddF89xhYQ1wxhLkRGMBzJdNGZDPtyjV2oHmwMInpi0NLZ8Fnf5HALMC6WA
         dtJ79HKVOZO/Hc8a0QW3SAQ1B2hHjEaeht+hcqiMN/SDyp0Mziu18fIsp2Zhqb1h+l0l
         FjANNqfQPg9G5N0Of7v8/DDAl5VXmBwuC0oS0vaQafwo0ax3YiZMZE98/QIBcdz+5LVQ
         TujVORFh7XRAKTP9tIaTN/HERsAkYrNIm+skQNXNq1jyYHEYsiBaTHZ7MjgUwgLefa6U
         U8JQ==
X-Forwarded-Encrypted: i=1; AHgh+RoM7EY36Luv+Nxw96siUFQEClYngZjEVZbaLBr9Y9P0cpO7vmC57e1pOItjvWHPtEkRhW4Lwfs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNyDwCC+qyYOtYK41NWdQ+e8WAMu+UgWjLPoBa+pY3eKPDdqlH
	j5l0vKoZpRnOOysSBxhsgA1JpQbb16EB9m7ajcAJLG0rEa4rkJBy7SEmTVyW8AzWjlhSwWdKT7q
	nYUb34GyFFrDQyI2AtaLSIlI4GmuMlXW+Yc1NE1JEVO9FEN9ZECVIavKCkQQcTVUa9IWunvv1Ue
	Y=
X-Gm-Gg: AfdE7clc9+dTGvYQ96fFXlHFYwi4rMDETA/7L4VHLfrEbs2ro1HxUrQkGPXLyvzse9H
	63rVqq70XAlZqdTkrwfZXfk4F5kHtP3ZBtkg0sNpEWL/kH7tvUzdi5LUVmeyCcPb4SvWvn44z6m
	M2jaiIWMZYjd39buKVwWm3hR3FhDg3+RNYRvbZNqxq+i1m8g1hH01AnJmu+DFLa2wDIZc14qdEf
	4pz00R99D4sEy1OPts9yQXsTEXniFTGoinZJtNtgRvm8NMSyq/KYLzQz5zOaNjToNuXSJkuKOpC
	nltojUWjFKdmQ1TXXaihXoiycwQE2k/NDvkE+ozVLZBQeTQjbkvIh5J6kPTP7nda72pmAlJrreQ
	AUBeQIfCJVGtiBSN0+0ZHtMm88OB/EZWP60c89vMFj7+728/A/TgiZhKR5KWDZjfxJFogZakCrk
	rN1EoCqOg=
X-Received: by 2002:a05:6a00:c82:b0:848:57f3:8f99 with SMTP id d2e1a72fcca58-848897a0bbemr7033974b3a.56.1783927928339;
        Mon, 13 Jul 2026 00:32:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:c82:b0:848:57f3:8f99 with SMTP id d2e1a72fcca58-848897a0bbemr7033942b3a.56.1783927927860;
        Mon, 13 Jul 2026 00:32:07 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm8020259a12.12.2026.07.13.00.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:32:07 -0700 (PDT)
Message-ID: <0e412b03-eda3-4386-8009-d23460b8d2e5@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:32:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v6 0/8] wifi: ath12k: support
 firmware-allocated MLD peer ID
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a549479 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qiebmGgv6xejdxd45h4A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: IXVFHlc7uGjTLpjuu9p7z_F4ccBoZuKd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX93ONUHpuJgE8
 5tQs9OR2kGzvBH33kUDRdG5nWVbukrhNQmOo1xadIYCo8diYXa0mVQFX7Zkrfzw7pVGypzLDH1l
 9XrQyC1fAGEe5j0UlzCXAzqfq1E8Oq9R0VRY26a5LjNORn4FPtr2hq/wAaKo2LwbDzf5Dk2gUq1
 I+udTt8qR4XNuPAUh2adDqTxDoFtOCGf+L32eGKUKUSeiR7ZJUP69rAG953dErkZoB0ZS7r9YV+
 3oGDcUSKVOOkChS20B1jFOr6iMXX1DzdMv4c/JXVu1lxgDPTN0ONj9dESVMzlxESYUeEsiqUccS
 YqcW6F1yfJmu4C7pu/j6Gq8/4wwDMWT8zOv4PYFdkIS4IbbXVIvad4e8HWOmLK7HpTSMKwxUV73
 OeDfi4Ikivw+++UvkmvjxHLGvLwa3zv3S/Y3FoAp5ZPzvBMF66t2B39jWw5XHO1l3SMbDrqKB+4
 /evfBlwkSFbGvNf8saQ==
X-Proofpoint-GUID: IXVFHlc7uGjTLpjuu9p7z_F4ccBoZuKd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX/o61OBprSrex
 9+4Txxk7vgrj/+gEExqL4uotyUQCLjMuBLUFSKK+rZuPWR1DBRGT2KB1QqtkrqluAI7wWS0t1PI
 7UztdZN+SmijHLiFF93PWM6bXTM98iA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_083213_989175_F1AA9631 
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

wrong version number. Please ignore this series.

On 7/13/2026 3:29 PM, Baochen Qiang wrote:
> ath12k currently assumes the host allocates the MLD peer ID and passes
> it down to firmware via WMI_PEER_ASSOC_CMDID. This works on QCN9274
> but breaks WCN7850/QCC2072, whose firmware always picks the ID itself
> and reports it back through HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP. As a
> result dp_hw->dp_peers[] is never populated for MLO peers and the data
> path lookup fails. On QCC2072 the firmware additionally crashes on MLO
> disconnect when ATH12K_WMI_FLAG_MLO_PEER_ID_VALID was set in the peer
> assoc command.
> 
> Add a host_alloc_ml_id hw_param to branch behavior, defer the
> dp_peers[] publish to the HTT event for firmware-allocated chips, and
> propagate the firmware-assigned ID through the existing host
> bookkeeping when it arrives.
> 
> Patch summary:
> 
> 1: fix for an out-of-bounds clear_bit() in
>      ath12k_mac_dp_peer_cleanup().
>   2: group peer assoc send-and-wait into a helper
>   3: refactor, keep ATH12K_PEER_ML_ID_VALID set in ahsta->ml_peer_id
>      so later patches do not have to OR or mask it at every call site;
>   4: parse the HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP message;
>   5: introduce hw_param host_alloc_ml_id, set true on QCN9274 family
>      and false on WCN7850/QCC2072;
>   6: on host_alloc_ml_id == false, leave peer_id_valid unset and send
>      ml_peer_id == 0 in WMI_PEER_ASSOC_CMDID;
>   7: on host_alloc_ml_id == false, mark ahsta->ml_peer_id and
>      dp_peer->peer_id as ATH12K_MLO_PEER_ID_PENDING and skip the
>      dp_hw->dp_peers[] publish until the firmware reports the ID;
>   8: in the MLO_RX_PEER_MAP handler, propagate the firmware-assigned
>      ID into dp_peer->peer_id, every dp_link_peer in
>      dp_peer->link_peers[], and ahsta->ml_peer_id, all under
>      dp_hw->peer_lock.
> 
> ---
> Baochen Qiang (8):
>       wifi: ath12k: fix out-of-bounds clear_bit in ath12k_mac_dp_peer_cleanup()
>       wifi: ath12k: factor out peer assoc send-and-wait into a helper
>       wifi: ath12k: keep ATH12K_PEER_ML_ID_VALID set in ath12k_sta::ml_peer_id
>       wifi: ath12k: add support for HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
>       wifi: ath12k: introduce host_alloc_ml_id hardware parameter
>       wifi: ath12k: do not advertise MLD peer ID for firmware-allocate devices
>       wifi: ath12k: defer dp_peer registration when firmware allocates MLD peer ID
>       wifi: ath12k: resolve PENDING ML peer ID from MLO_PEER_MAP HTT event
> 
>  drivers/net/wireless/ath/ath12k/core.c     |   2 +
>  drivers/net/wireless/ath/ath12k/core.h     |   3 +
>  drivers/net/wireless/ath/ath12k/dp_htt.c   |  49 +++++++++
>  drivers/net/wireless/ath/ath12k/dp_htt.h   |  12 +++
>  drivers/net/wireless/ath/ath12k/dp_peer.c  |  75 +++++++++++--
>  drivers/net/wireless/ath/ath12k/dp_peer.h  |   2 +
>  drivers/net/wireless/ath/ath12k/hw.h       |   2 +
>  drivers/net/wireless/ath/ath12k/mac.c      | 164 ++++++++++++++++++++---------
>  drivers/net/wireless/ath/ath12k/peer.c     |  31 +++++-
>  drivers/net/wireless/ath/ath12k/peer.h     |   1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c |  12 +++
>  11 files changed, 292 insertions(+), 61 deletions(-)
> ---
> base-commit: 951dc0a744e4dc8490935316d3b76e23990bde3c
> change-id: 20260527-ath12k-fw-allocated-ml-peer-id-2b456891157f
> 
> Best regards,


