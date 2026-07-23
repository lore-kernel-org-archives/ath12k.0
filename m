Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21A6C531F8
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 17:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBubX+qYzAE+thkmI0/fBJno+EcSFSapyej/MN4ZLsg=; b=EuCXHuwNEZne88KIRKVFCI2bLR
	DVq+JwhEgCKydOiT7OpWxBUxZv26ZNQ1Opo5XgTi2VstN7HZ0npVJ0jfM+RlXA+b/9Ar4LZwfbjcS
	5UHuY/SN+5sC4wXvrIPQmwAm8vZHLh+Q2MYW4zXlqLWqwNCZCud8j4qg1kjoPW+qKbSti3tARilKs
	uHd6QU2FcNfNuQWC9YcYrHJXFRq4Ag2QScBjrbXT8MV2HzIQMHOjyReYGoo+7PU+YU9HfCpv+s5mS
	R9gKVVpCHhWhC0Sk/hhbnMXn8Fi7iekABZpbDDP+NtOMdqGQs7FoE9dxdFprr1gP5PhcMRsgrKq3G
	4jrM1kmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmx7Q-0000000EoO2-1h8u;
	Thu, 23 Jul 2026 17:22:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmx7N-0000000EoN8-1FxK
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 17:21:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF5V4b1326126
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 17:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBubX+qYzAE+thkmI0/fBJno+EcSFSapyej/MN4ZLsg=; b=TcCw/1KEO4hqSTh5
	EbR5wulddeBNwWT6LlQUO+Kvfioib3uJme4fADUp3cH2T77TC7xF1fj8keGpcnG0
	D2P63zRc28+lPiFKt9ACBctaWwObyogaHcIQmXrA/g/AI/CyStcV8GdtbyS9GvSh
	sPgwwzZRpOl6ellW3TTWqxeRuyXpdjiwgxWmw8EFnpfVQmk8wnN+hQguhuk/fNcH
	e0fz4DhFLpjC5QfRclbuw+Oh4eEsTfQ/hZhKN3qpyFlbuCi/ZbxK1D/5t8gEap+W
	LxLFqOwm73mdTNWqLvypPqrDf960tBPiOV//rgUjJxO4wQo8KK+QHsITytN9hmzl
	NkbvEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a0q84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 17:21:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38827cee19eso1161422a91.3
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784827315; x=1785432115; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nBubX+qYzAE+thkmI0/fBJno+EcSFSapyej/MN4ZLsg=;
        b=BzGK7XcKDgRuRXkGSf0IL9pVncMYeZA9G0WdETy+A4EkRfP0uB8njU73CfWb6VilS8
         MqZUcshVxIR6mNbqm7YF35PVn3btf1ECOaLKjbKIbehfqptMQeou0d8AwhVa7MPYZ7pi
         9PMRK71nRTJoH7eF/Id7x0QCgtG4ED8i9rzHnciR7YievBvsShen52Ray1qcU7skwG8T
         ufuy6Dx8BVR3sQQMB0mHJryxCNy/TndMVk0kyP8KrAx+a8OdP2mcJQNGBRKdIRgDRAYq
         PaQqrx0Hb/9P1N5ZWkiqU0VgAMNlM+PGCd6b+/90vo8APlv9UFP+rfwTTQdtYeYomwnf
         SQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827315; x=1785432115;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBubX+qYzAE+thkmI0/fBJno+EcSFSapyej/MN4ZLsg=;
        b=n1/QUbV14d3yucK9g/ad+g7cnOxsIHyMm7HCgjbuFo314bMlmgTGRotsjmI+7URwir
         YLsWQmQy68YjGokT4fSDsKPQ5OrJYdWDg437vlhJzzuQH+jN0nkEHTBB/zC6wtu9Ln5V
         EGMkTUXH4FqIBk81rT4Cp9Rb53dgUlTkGv2XtjsouBZrZvpzSJJHohcu5xD6eH8lm1UD
         jKHAPPjryCl8Yd2/4BvtT/22zl8YSOS6U+hIoFhBBM9I4LMTcb1dc6aFLJW/MOSAvJ5S
         FrezpHvHf4WmccLQjY5ZpjBv8TqgKb5wFU3APqRKBDvtFcm2F7aKHJXUxeHjpzAvUg3t
         O6OQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTD9DLm3af+H/Cvud+DdYGTArKcPyYhBxM2hR6KDI853AvEE+N0eC28Gs07WrK7Nk12feYB4E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6QdR1yqeMAyrUiPBKKiYrh1D9NZnBKHiMaHkUakoFvJoQfw9b
	Pqb4MO9cOaBx3lgONWUyvZea1iwNlXI10l6HmkW5Vg9tkYlhbzFWTWmDXl0Gn8EnySQDY0kxIw1
	dO+wkjhfn3FsftPkeDgtyR7yrmy1yFFQecaB9mNUTBG2nvz1Dc/zjSKePIMfEEPIt
X-Gm-Gg: AR+sD10KuBktzUKq6o+ym38AGG/GvMsAIZfGchmzCZw3/Pw6wC8Io4hmTZG0Lpkz9ir
	AIJjJ5zQSdtvrqiRMxGj0/H68YMjg2OqoU567zg08Nq1jIDkAm+XC8mugTGqIQm93XdkjR8Ol4W
	zG2CkInVYxHqD7SXqM5NhvQAexoRcC0aESt5LkbjLNWEIdsMF22UiDZaz68RXvmxXDnh1Ly5WMp
	/uioxYqGa0CXKcZ6JNnlKCf6RJIWzOY0AzUB/HFF6eSuNQ+OFshhoTLJohswc/vEVxQIbBrhSn2
	Le+7CuG70DzE5iZxwdpaMVGUoDf3GxtXiv9jQnKsDSpW1gMD/WuFwrpiiKNa/asLXUMbnWsbSR4
	/TX+ybhfx8Ze+taD52X4But9msWrUxaYrNxjmNJip2MsPkiMMs8PbOpjLew==
X-Received: by 2002:a17:90b:3905:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38ec64dd02bmr4247422a91.12.1784827314817;
        Thu, 23 Jul 2026 10:21:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3905:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38ec64dd02bmr4247386a91.12.1784827314344;
        Thu, 23 Jul 2026 10:21:54 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f42bbsm19082660c88.14.2026.07.23.10.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:21:53 -0700 (PDT)
Message-ID: <4b634fdd-cd97-4e2c-b253-8d239874bcd0@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:21:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2 0/8] wifi: ath12k: support
 firmware-allocated MLD peer ID
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2OCBTYWx0ZWRfXxxdZb96i4Q7W
 c4idADdHgCUjUi5Q3pfx6H41zJ6YXp0wNoAbAYjSM0iyBb4HW1nakcKTz8c4G+mp26IYswL/1z5
 TvXnePr7906DYyQEeo4sIetGwIjHBspcaP/mQxqUoOVzWNxE9vG7Ii5jwmSGTzlx+lFNpRrmJmp
 uVEGgi6D5nAYiygzrG5PhojlubMac/25P0BhwcorZg5YekszHcQKfsr6OcMVL8kkyMKRan4KnGu
 ldOvgaGyHXS55+DsRvXsC6EdnMBVPBiKQPXV+b21jnbjywRwdvghSbGwojyBXGwgvAAoBTVHKEZ
 tFhCvWy2zAJuSmFkMxDhvNeMTdBZHnNMwwZgZK//ehstVu6puCsBcjLdntrygNW0+4qcdOgDq3q
 nw2cNraIivbClzxjJ2g+MAUatEMuRPzZd4EUmwiuw6KI6Z4wq4wRxmEn6hr3MsOPWX0RsUXyO8Z
 Ww+CMTSJlRW/KJItuTQ==
X-Proofpoint-ORIG-GUID: ev90YRO5z6aN2wEKqVtoLJBJy0wxIOYb
X-Proofpoint-GUID: ev90YRO5z6aN2wEKqVtoLJBJy0wxIOYb
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a624db3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qiebmGgv6xejdxd45h4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2OCBTYWx0ZWRfX+NDb1h/c4lVN
 JBZGEVDcOeJVbs+KmUnOusy5hT6gJE7pWxkvzSGaDLUAoP/5uAd4ct8NVci76HGnkfW6r3TtMQD
 QF0jj0f5jxgjW5kmaK0qm3ZYSDXs/VY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_102157_354044_6CF789BC 
X-CRM114-Status: GOOD (  19.75  )
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

On 7/19/2026 11:43 PM, Baochen Qiang wrote:
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
> Changes in v2:
> - patch 5/8: initialize ret before goto err handling in ath12k_mac_allocate()
> - Link to v1: https://lore.kernel.org/r/20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com
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
>  drivers/net/wireless/ath/ath12k/mac.c      | 165 ++++++++++++++++++++---------
>  drivers/net/wireless/ath/ath12k/peer.c     |  31 +++++-
>  drivers/net/wireless/ath/ath12k/peer.h     |   1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c |  12 +++
>  11 files changed, 293 insertions(+), 61 deletions(-)
> ---
> base-commit: 951dc0a744e4dc8490935316d3b76e23990bde3c
> change-id: 20260527-ath12k-fw-allocated-ml-peer-id-2b456891157f
> 
> Best regards,

This version LGTM other than the one commit text nit I can fix.
Will wait for Ramesh's RB tag to pick it up

