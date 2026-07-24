Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B415BC531F9
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 04:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d40fEAvsg3aYGm3ZuNQRGj0KLdYyAEXqJk6tyRxsTW8=; b=gCIjcN6bRror+0V889IxkK3Kac
	heZUQ48zkgHgeHsbOgUvm7eA0xemR7bzQYQIy48sGECudSKrOcoDKw+Z97TVegwiFh1wp5ML3RMYQ
	0HbzVe7zxHcHckhmqlnCOW3xTVzyn/L3r5YnqL0RWMQ3+KW4MxBWhzFpRG9BBsC1VuAtzC8EUwUeB
	vj2k5B+FG6FjceGoVC0SRz2LlgOiFiKAAK4JmAVoiuzdDlw31tJ8BkmWvJmGccNl7CZ/G8CWNJFcM
	xyrHy/ZN+SqsGEyrX7zA2l3rPF7vNNqrdmuN3a/v/PuJMt1W7kuNN39NjPVorhgZw95xB42yihGGC
	jDkgPrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7wo-0000000FTnm-3Plg;
	Fri, 24 Jul 2026 04:55:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7wm-0000000FTnQ-0UfU
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 04:55:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDK92275940
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 04:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d40fEAvsg3aYGm3ZuNQRGj0KLdYyAEXqJk6tyRxsTW8=; b=QJdn+SWvp2Hj6tHk
	N22hdSqVUq2dtb/PczEtPHIXGWocvLC04+KxPa/tagQMdNSH1Tbg39GX668P8ILZ
	KH+hx+C/g7TzfHkJW/8Ie1sLSIizyEq0hy88wqcX5UEls7PD4fOOZFnSMst8edc2
	JDu6LkzRvelGyEv/sfsJ8jWw586oRsdkXncXgQnSE84Vr7nO3eaV3ALJlTIjaN7l
	6YYMYghZPx7ISHli9Y3mxPDZYBQ6hGFiEkAHRgBnHUxKKvNgqKobKwc7hc7oOcpW
	O00yzhEbEHBAT+GJx04FMpmMWI1EkZLfeeVY/bxABwgIJvnVZBDQo8+nQCNqq8gH
	rqunCA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0a2rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 04:55:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b13so47381a12.1
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 21:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784868942; x=1785473742; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d40fEAvsg3aYGm3ZuNQRGj0KLdYyAEXqJk6tyRxsTW8=;
        b=MsFf88YdL4NHmxIRsFLDfb641Pl2AHrInZCriWMZCQTzw2Ebd7t5XJbP9oZTmtTZFM
         lytyBfToIMpzFXaR9QWIcDDi3fTa8MSYYJQFAZVLcUwAba4LRwdCZV8/gpy2Pn76DvW7
         6P7gSY1NmfkHop5t3yLB+6BE5+mWBSly9l0iWwoNtg7rO6j701MNRcjETu+kZ8iett6X
         sLVIaD9VvRQLJt9BOSUt+G4ycC/+i5/xYqzmRONVJ5q1WotkjLsGr5eTW8cACcz+v3Zj
         QoZ1ngXxfA23KxkxRwV7oL1G4CG59huY7ZETJPIFfFHD02x9MjBQYdNwCrEE3zJuivo2
         Rn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784868942; x=1785473742;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d40fEAvsg3aYGm3ZuNQRGj0KLdYyAEXqJk6tyRxsTW8=;
        b=pey9Nh+8A118/9/iS/AQ2jBM1RDCotlNUTS8HDD1MaxV8hCk7/WsRID+YXBM1gztbe
         KuH2mTUmH11+evclzkzr49OGYOwjrWn5K7BkXwB0ylosDD2Dnd4G6cUlMdBD5kr8iSIG
         K/sVBkxtrPigD+eWECB/Xsse2jidhTuqKD4AfvsLeQ++rh1VSnqfwLZQURva3xXtuRMc
         +sh+4QU4irmYc+NnJ5xkdX6PtQDPTXbuYWuJN5M+I7tT1i30eiuYVjMzAKIPk8w7oZtY
         3VbhU4nU9ZLrLHFTcc8E7Wnfhx1bAcGe7fXqarMvWcDsrEUkWyaJwxV+pnbgaYPKLZjJ
         et6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoNVu8NVvlv0KHS99OMiKC1mRfMSj5DFqLfLI0Lh0RZBJ6jcXVh2jXEIvrSrPlvg8p0BpCtiB4=@lists.infradead.org
X-Gm-Message-State: AOJu0YydVjIkj7sBiiyxj9JSA+p0hZ99tBp8R/NSw/I5yEoJ/9a9869/
	ITfWLClQxnoVO90tfVs9oWyDKN3OZV0r1hRNRlCturZuhP28ClHPbTU8glTZnQdBpTdvLx2Tz7p
	9qH64lHssuD84Ry3eGvh/5qcnkFxshi6XAB7aRwkjW7/mNew/naSx0JmsrRvLvRTe
X-Gm-Gg: AR+sD112nNhe1FLOSJOEJTnM9sDZBWGiZOM5hgCS7lSfwMYe/YHNt/YtNqvFwQEXIfu
	1n33aha6o+naHsixO5dPc/wROELQj40uvdi/ULLbeCIxurbfEahvbeNcsUlT7TsvfYx38ZraRV0
	Fc2ShjaKMkGzAkOnwFdlPP1oMSDVmp1v6EpFyVX618+tDu0NrZJfsfaw+AXlPRDFgD9oflJULmj
	bHLawWBt3mxWqAAwvP6mtNrSrKjGJPZLKS0ISDd+dDDByMsD6n05otnlJggMzx68vSddifN/XId
	8kfVNOwgIugrIiFdAEFVS7Gkt2cOGcusq+ludldsfKcAvLjgAREgCawllvEueQPK8lZOLhLUAz+
	jZRI3CjTP+p49MLVVb14y/6HvyEWXeKNIFPB9V6+Z
X-Received: by 2002:a05:6a21:117:b0:3bf:e3d6:ab5a with SMTP id adf61e73a8af0-3c44b210ec8mr6635226637.52.1784868941921;
        Thu, 23 Jul 2026 21:55:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:117:b0:3bf:e3d6:ab5a with SMTP id adf61e73a8af0-3c44b210ec8mr6635200637.52.1784868941414;
        Thu, 23 Jul 2026 21:55:41 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm24598410eec.6.2026.07.23.21.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 21:55:40 -0700 (PDT)
Message-ID: <4b27b14b-23cb-4cf4-93d9-239cd2cc08b4@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:25:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2 0/8] wifi: ath12k: support
 firmware-allocated MLD peer ID
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 615MucFymjoCtu6HvZ-mdIRLgcoMsF7o
X-Proofpoint-GUID: 615MucFymjoCtu6HvZ-mdIRLgcoMsF7o
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a62f04e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1CCuyHwD0-y4VE8UPjEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA0MSBTYWx0ZWRfX8eYXGB6Z/pIW
 pUvSVaHfGuxZcSwTzTDxfTrBswbJEiXkOf5w3C9OpydTG6YK4eGFRxVTXbyQVwTJVrxU69CbrBW
 rI/WDearbAQG6SHtzAvUpZ/eZ+SACzEJpjiHpgaTma4o2hCNAW3aAUeGrKQAuGUq6mPRbHyAqeF
 Mp00TiBOEpmoc3Da4B15gkklVmHQS+aSyK7f1q9HC+ovAAhNoXD/pzclho2TQ9BqXbGDN1usIXe
 mr4T6tteCv5NzTSgcQABFJcVCdmDrclkJ+ZBdOvwp7DPBwmPr6tu4U6nwSH7gm4JO/TrAJWofZx
 RyzIJDhT948mXwa7OlaMCqYaoRbwVZEqkhZ52o2qd3G4k1GWAiDvf2FmZMPcWwwFLJ7rWiTwXzV
 wOwE5c0W1ceYYhPAuP55dXjihhDrm+OOxn2oildpMn02EuW4C0zk+OHv4Fvmj9jxt1O10dhhsGK
 niY3rgFek2nJjl5EChg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA0MSBTYWx0ZWRfXwnXgRZtU8u4i
 vwG6EFFMRCL5ChHMYwQ7ToeG4xCUibQMDUwYUzl7sWG1zziSPWYORF45V+gJEY5MBY7yjJ4fqTH
 A/ZE18l58HWmpn4OUZtFQ30CWHVz0O8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_215544_177076_BB67F4FD 
X-CRM114-Status: GOOD (  19.14  )
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

On 7/20/2026 12:13 PM, Baochen Qiang wrote:
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
>       ath12k_mac_dp_peer_cleanup().
>    2: group peer assoc send-and-wait into a helper
>    3: refactor, keep ATH12K_PEER_ML_ID_VALID set in ahsta->ml_peer_id
>       so later patches do not have to OR or mask it at every call site;
>    4: parse the HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP message;
>    5: introduce hw_param host_alloc_ml_id, set true on QCN9274 family
>       and false on WCN7850/QCC2072;
>    6: on host_alloc_ml_id == false, leave peer_id_valid unset and send
>       ml_peer_id == 0 in WMI_PEER_ASSOC_CMDID;
>    7: on host_alloc_ml_id == false, mark ahsta->ml_peer_id and
>       dp_peer->peer_id as ATH12K_MLO_PEER_ID_PENDING and skip the
>       dp_hw->dp_peers[] publish until the firmware reports the ID;
>    8: in the MLO_RX_PEER_MAP handler, propagate the firmware-assigned
>       ID into dp_peer->peer_id, every dp_link_peer in
>       dp_peer->link_peers[], and ahsta->ml_peer_id, all under
>       dp_hw->peer_lock.
> 
> ---
> Changes in v2:
> - patch 5/8: initialize ret before goto err handling in ath12k_mac_allocate()
> - Link to v1: https://lore.kernel.org/r/20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com
> 
> ---
> Baochen Qiang (8):
>        wifi: ath12k: fix out-of-bounds clear_bit in ath12k_mac_dp_peer_cleanup()
>        wifi: ath12k: factor out peer assoc send-and-wait into a helper
>        wifi: ath12k: keep ATH12K_PEER_ML_ID_VALID set in ath12k_sta::ml_peer_id
>        wifi: ath12k: add support for HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
>        wifi: ath12k: introduce host_alloc_ml_id hardware parameter
>        wifi: ath12k: do not advertise MLD peer ID for firmware-allocate devices
>        wifi: ath12k: defer dp_peer registration when firmware allocates MLD peer ID
>        wifi: ath12k: resolve PENDING ML peer ID from MLO_PEER_MAP HTT event
> 
>   drivers/net/wireless/ath/ath12k/core.c     |   2 +
>   drivers/net/wireless/ath/ath12k/core.h     |   3 +
>   drivers/net/wireless/ath/ath12k/dp_htt.c   |  49 +++++++++
>   drivers/net/wireless/ath/ath12k/dp_htt.h   |  12 +++
>   drivers/net/wireless/ath/ath12k/dp_peer.c  |  75 +++++++++++--
>   drivers/net/wireless/ath/ath12k/dp_peer.h  |   2 +
>   drivers/net/wireless/ath/ath12k/hw.h       |   2 +
>   drivers/net/wireless/ath/ath12k/mac.c      | 165 ++++++++++++++++++++---------
>   drivers/net/wireless/ath/ath12k/peer.c     |  31 +++++-
>   drivers/net/wireless/ath/ath12k/peer.h     |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c |  12 +++
>   11 files changed, 293 insertions(+), 61 deletions(-)
> ---
> base-commit: 951dc0a744e4dc8490935316d3b76e23990bde3c
> change-id: 20260527-ath12k-fw-allocated-ml-peer-id-2b456891157f
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


