Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A194606A32D
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mCXiRqLI;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tfj2ndES;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7YiP1yn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ta+GOAZXlWizSDSkAj84yRXeAdlLkOOcJL2DLqIsjgs=; b=mCXiRqLISJzo6N
	HUJHzN+m12aY+7glSk6b5Ip5Gxh0a7QNSXQlB5ubAb60YWMiwyOTZ4Xwe6FQoRjWeE2UicW5lMn96
	71dnZ1yIiUR/bI/Ft6cArkUvwvM34yHP/ui1dQDz7ICcYYcZfHrntI+yZhlIr1xTynPoYWh6MvsHd
	p54KqKYBBQwVLCrMiHEwoOx+At8q7wmJTEJj1tJGz5lkmxW2wNlFgURKmUpYr1AZ4B1yTs3LLbxk8
	QmzL9EGJkhTQw3XfawBp7JgZE05f0MF0ZzyuJO8+acWHhoHrQxsP8SqRWlqY9zevczr7YD/h0InKB
	2CRMYQomYPNR8rR4tWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcD7-0000000Dt7j-0qav;
	Thu, 26 Nov 2026 16:20:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcD4-0000000Dt7A-3SOy
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 16:20:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuBth3484289
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 16:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ta+GOAZXlWizSDSkAj84yRXeAdlLkOOcJL2DLqIsjgs=; b=Tfj2ndESDqpk3Z0x
	1nvqz97eAN7YFEyhY7ZCIC5ExzhBsUZsFcHBB6Fl6fScBL1NhZSM9ho97WMldItt
	kInfobEnH1HjfZ9AxQ7wAgDkB2JepKsEkzi2ae/1e8fkAux1JSvO74TxEq21KVm+
	T1TxHH08IFg0B4PONnYfYtv2va5BWTAO1VYtH9x0I+nmh/2R1kEMUkuxj4b5b4zP
	HKJwmMDPRB0FV4AbPrTbaGu9kmkoO0kLHlDu2mf8R53NapcewOquxf0UPWT+p90j
	WDz6h17sQSsKrOm73YhG2Yalp6RlsblK4R9ScU+TPR149kbpffyau4kQ4HFVaDnQ
	TeHTAQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak030v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 16:20:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so9741170eec.1
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 08:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795710033; x=1796314833; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ta+GOAZXlWizSDSkAj84yRXeAdlLkOOcJL2DLqIsjgs=;
        b=b7YiP1ynR9bfJkY7HTa50VgOIn9oQhbMhH75nJt99LWUpBP0f8OJYuOi92WdUydmIa
         yilQEiSGeiwcbu0V7Kaibkb3vzAAKTc0cu/EcEAvub+GiiO7DhjuRt7Q1nDNO9Wc39kx
         plJhmlJyySrsEZiSp6ejmdFPvmmVBuNCrhsr++nTzM8ARXw5JYpgxUAqIXylOA/K3SOn
         zSQa9vcjh5xS/VScWqwezAr56Ntkxoj+JIOqT4vmf4kBwB++2DDbYT14DGPFyHP7T/Cp
         IZkeOrQYfQMkdD3zGuT6BcAMnB/4log/SzWWA+kdXZPT4RX4vMZF1ovsiw9uu0bvHvJF
         q/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710033; x=1796314833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ta+GOAZXlWizSDSkAj84yRXeAdlLkOOcJL2DLqIsjgs=;
        b=YJHWQzQVrqE8aoARhPWEugl3G9iEZHlKEzo0Qv1SZ9b497TePyckIY2D55AEYFDbcY
         jLw9le1o+UrT3v3G5KQZ7FG69k1GQ/kaNuhynMCPJtsNCgg59zrRM53wfcxRDYRZqyn2
         so7x/skLiHDEt9YzSVbTdRBpczM6gP8Gf7jU0FdP2zvoaRs0apCYBF8HN2oAYOQMIwdO
         JRNgJlBzQSEvsM+OEd9UUhUcEsMv3zIrMfKE+GaO8rB+ZYgZlAZ3q/p2bpqI5znE1vim
         Red56v98sYansAmFyfMne5G/d19q/qaCgJzIpnvR6ETIPZ/PMVKI+8uSIAxdgkgceRgm
         jMTQ==
X-Forwarded-Encrypted: i=1; AL+hErGRTR7z/K3GPvjp+93f3ukESCKTv/KI7c8+Kh9kncEIKKWAPEG16jiq7EVs1vOF0xcthO4kHLw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+yY6JgkrmDgTrB1SJtuni/fFhWkbqpvqHHs1kLJT/O3ztGGaEq
	tGPwRsBlxJM6uPs4WIw2TBk7PnohzWIPoS1AKWM1nEAPr7l2m3akEMsvyd+FdaVGp1OKH8ZDAse
	Mao8SrUYNragqu3pv6Z/uqBOQpaSEGszLcufuECcewz/2gSNWwDqvXK6xMVSBy8W0
X-Gm-Gg: AZFdTZfrdbSRbPUKe2tBzKAM5m720/7aytPMPhucUbos5UXVRrj/g6gdRykzkTtChj9
	BHDN3maupdQ0MIkAi6edc09sQSSN5YTSQ7RCUr9xvTAuxl6Yt9KoSsUycZLDx1bco9H1eXoday+
	ML+cfElxj3/hD40BxWEVyVllWJexyguVZAfBIVciA41v+CokJYiPUjUYZe75yIePkZ2Wvsm42Rv
	ZnI/EFtVCioSh8fiiXlgvTHySycf5TmwIjoUmdKq/lX5Vf/njKZCcI9hlS8/maPSBK0v4muzvB3
	oRfMq3cBf3tWs/jsiP5Om5fHnGApNy8qOtHfTa7K/JBVoVib2rGKSytAb8AUEVv2Jk9ITI+FKJJ
	9i6ftyGQRL3qPiAzPrlVHB579ZQeqjqR5PCkd3OWEZ2M+718Y8HoJVqN37Epa7abn3Z54+kfyKj
	shZ88Xv7qXBm3xGqMSKA==
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr33998815eec.27.1795710032332;
        Thu, 26 Nov 2026 08:20:32 -0800 (PST)
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr33998770eec.27.1795710031591;
        Thu, 26 Nov 2026 08:20:31 -0800 (PST)
Received: from [192.168.0.3] ([49.204.130.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm66591004eec.28.2026.11.26.08.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:20:31 -0800 (PST)
Message-ID: <1bd9d8e4-4e00-4cdc-b53c-50675d6856c9@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 21:50:27 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v4] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261115-ath12k-fix-dma-mapping-for-reinject-packets-v4-1-27efef2890f8@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261115-ath12k-fix-dma-mapping-for-reinject-packets-v4-1-27efef2890f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b085c51 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JcMdxy0ByqZMvlM8ZepLMg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kxk9WyqwN4Jf3OentSIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 8yEtczhI6CkNu4Pj1Mv3AzxwoQ08-1Q0
X-Proofpoint-GUID: 8yEtczhI6CkNu4Pj1Mv3AzxwoQ08-1Q0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MyBTYWx0ZWRfXyM4vqHJexsTi
 cbxlAB3ce39Bt5AW+IK1oaThAdfxQjRz2FGuOHt/nuBw5jrJVQENpQWEMc7BGx58/aWdMmRMxSr
 1W9w8tGyxVEhbhQRS81WQSOB8nd3ERU123ovy5/HzOoCP7ymJDA2byLLPMR1fmBF27UVwLbhCJ5
 TyYrWY13Hkpa8UWZ1nNl6Fr8bYUH+MveuQwpyqP5T59kaMc7uxiJ+YbjVt9IEdA5yRt1fLE86cX
 9jnmb4g5eMIPG+A9K/tUmv4VQZZz1+cRCJlMPIKfzRVjgp2cDty+6nCBhTMolU772hX+5PvgM+2
 x2Me1HCJfKc+RBx/ZmCIwr7KdykhYZ7XSJBGA+WvXwtEyIdgQ5QR2gvo2J6j16DQVKYTc68ynFu
 azkSjS3Yj6gCD0HQ1SW7OeYadZZGDgOovQOHDVSevmnaMI07D9FVjoEx5i4Wz0HEEl4u+u1GXXp
 f3OoO/vqoh5B6M2ZIoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MyBTYWx0ZWRfX3Mey3Qdt4o8K
 sDR489zyiPPfMkRcphClulj4B1u2LVnX3So4QAQlSX7izzvEs8a8wmCRQTWuZo6gH6rxYJ8V1FN
 36dSlWDLobFB977al0qRYcaTAA/g9jg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_082034_991817_72D72F2B 
X-CRM114-Status: GOOD (  13.25  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 15-11-2026 14:30, Lorenzo Bianconi wrote:
> Defragmented MPDUs that are re-injected into the REO are mapped with
> DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
> DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
> map direction, so this violates the contract.
> 
> The mapping actually spans both directions, since the host has written
> the buffer before the REO reads it and the buffer is read back by the
> host afterwards, so DMA_BIDIRECTIONAL is the correct choice.
> 
> Add a common ath12k_dp_unmap_rx_buf() helper that selects
> DMA_BIDIRECTIONAL for re-injected buffers, identified by the existing
> ath12k_skb_rxcb::is_frag flag, and DMA_FROM_DEVICE otherwise, then use it
> in all the Rx reap and cleanup paths. Map and unmap the re-injected buffer
> with DMA_BIDIRECTIONAL consistently.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping reinjected packets")
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

