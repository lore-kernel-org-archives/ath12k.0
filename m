Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9A6C61DD3
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 06:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91AZ6ySo2GU0comiuHGaun1xtRTKFM9Pkah81PE5WJ4=; b=0n3I9YYSd0Q9S6Zd2bIuhrVkZi
	qvrBqARZfc3hL+mpwyM3xC7GcJeF+8q6pQmP+n4BBMfTt2VTvn5jSiQwlPdlrB3qa4sySUdQBMAdj
	qAiP03PHac/2G7NkcjElI4BIU5aqGBV3KdRikSWITaB2YvPHoHKwFQbv+KEnn8pzNDjM+x1oPEoqt
	McW6YDcn2stIs+TtxmoP9pQH1PioPXDrV6tvhnWUoI9ot9nJz4Al5dy05s+JRCGPMRjrPKgqrHIJc
	ESgSYZFhwGtpUeWgOAHDt/Pvr3GPT25R2114Vj6IN9k6ksMmTIyY1tCzyMgQpuGlnmtwySNikf3aZ
	BM1zylwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20ev-0000000GSWo-0W41;
	Thu, 03 Sep 2026 06:10:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20es-0000000GSWH-0qKn
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 06:10:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lgXu3912722
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 06:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	91AZ6ySo2GU0comiuHGaun1xtRTKFM9Pkah81PE5WJ4=; b=DCRDpbruN1ez9GpU
	KfgUTky2Y+FAuqvRGCYnir8of1GF7scmCKO0PRr6PK8H9E59xlbsA+I0f41BWsI4
	o/jv6eb80z6IUT6IqVE5O6nPdNGEk2/HfcWVd0MPs4kOSCIPMqbt5i3eXAPXSdYY
	LSTN0xNcwAYZILx3QOB0VNj7B71eQCXwqD7en6AAOvKX8EZitq5D2OgIhLptoF4D
	3Q+417+fdVzzOkml60jA8GlvBpFXhlSiqjz9vDx/lDs2WqZd8kjKWzKOMkNKPTiL
	pJiAYhKqsU3KLjA8cb3HlHRHeSK8j+li+i/92/rVeSFwODJo6fFqyGc320UwKWME
	RYqw+A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8c75u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 06:10:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso2977790a12.0
        for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 23:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788415844; x=1789020644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=91AZ6ySo2GU0comiuHGaun1xtRTKFM9Pkah81PE5WJ4=;
        b=X4y/PTbIyaN4Fqax0aABCvA0XxHw7+lp9Vkc15iPKjfn0Kw8ofIwut7bRN6lv1V2Qn
         Wy8DtXiv0gMcWn4LegHrv+N3Dp+MiSW6DU7SJfNeDsIEE4KZix9DqsZoCB2L4TxzaWPf
         PFzZJ2XnQAelqp1TcmzZeKaqcNHmxorb9RJNiRYl8k/pCDPduF8cie070hvbg07/nKqk
         MMjQjX48JNTCzvy+L+zIK9NltVAqM5g1R+fSu91lZTxMzoRI+zOWoqCGjoClvfMBVYO6
         q0vmbDbeoi7FALiKgWIaSlCFfB877Gxybje+kZNlOKDTShuJjQE7jX3rMY/JJudBb/wn
         wOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788415844; x=1789020644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91AZ6ySo2GU0comiuHGaun1xtRTKFM9Pkah81PE5WJ4=;
        b=fBpdBTUUDY5v3LsaSqYZATurqwsMoLLKV3+KwPOtLcYPof00NqA4JvijIAUzeLAWR8
         DVRyjvqXAxjD4oQnCNvh3qBjfz5a/+10nltayUbbFwAQCRRA9AQp2molH93IqI/bWhJp
         PBmaAIwIA+8XbuxC5sEAQLuknSpGgEd74DgwtDUid7KDY+1ZSUId4xRn7zSrBd0gwFIW
         8MRLsAq8jE3WvCvE2aXjL6xa5iJz5BmON1btuikovWLbCHH15YDMTCjWw9/Rol1HQ87B
         TcqBZlyoRcYHxww/ZXtjEY1BSGiYjwWjxRzZxq+hyZv/dUaeLKSI5PuOOiv/1BzL7Qge
         68JA==
X-Forwarded-Encrypted: i=1; AKwUvByDOuoYBruQglIyw9HGtnIS19Rqc8Y1KhqIS1Q6s3TX6Ch31a7uYdPqD3x7BiANWYzqabXdUMU=@lists.infradead.org
X-Gm-Message-State: AFuF++mhTj67cvykmyMCJuXCf2bm5jTxjXBY4fgSgovx4YwZQ+oQVO9s
	skQIzu9x557IbdsYkkJPNWLSgUQy9OVRmnHBErh2ycIEG6MN8Qk5OaPjQXaRkJIwfP/mhKGSgNO
	fz/GIIBAuFBgoY4fj9buoodaffGJo2vH5tx4BywOLSgXQr9rxvmmEtiwgFW0pQxeK
X-Gm-Gg: AYBFou3A9JjtuP5jBXP1D7H48k5pPciGMqDZ2v14+ZjajEycup+GM1yck2CcCBlLZB3
	bFll1kIafWYkYdrckoY4kty8mS/na6xtHUvtlFkGe+GAGRGUPEBKYfDNk0jvd4MG0rQG94U+lUv
	+Qy8n7kAX5AANBvY+/LtMelS9Ny2RQA0eEPtH92p1Lu16k13KeEv38RnLaQsjWCge2TcIqrqSbz
	0pyCMTqCTHrDPYNULKFeyImMYNRjEYjuJCicw6XE9ihO8ZJ0mirPH5nxQoL4Pb2qFdZk9LW1AVB
	QHZURbNF66tDp41OV3t/NeQf6NSpAcvMSvqTnq/NtysUeGPjqfYvkbW43wY9o2mPPZ4QgYpU5fs
	S0yn5PukTP3TcXpKSRXA6VF6A/8Gx0hEaNw==
X-Received: by 2002:a05:6a20:4304:b0:3d3:ae0f:526a with SMTP id adf61e73a8af0-3d9b0420a54mr14305563637.22.1788415843866;
        Wed, 02 Sep 2026 23:10:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:4304:b0:3d3:ae0f:526a with SMTP id adf61e73a8af0-3d9b0420a54mr14305487637.22.1788415843240;
        Wed, 02 Sep 2026 23:10:43 -0700 (PDT)
Received: from [172.20.10.2] ([152.59.48.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm4873959eec.0.2026.09.02.23.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:10:42 -0700 (PDT)
Message-ID: <9103ca95-5e27-4979-994c-e14f123cec7e@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:40:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IPQ5332 multipd: missing text PD level and qcom,rproc ownership
To: Hideo Sumi <hideo.sumi@mugops.com>
Cc: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20260902041339.7665-1-hideo.sumi@mugops.com>
 <741d7c3e-6eea-4a84-bf4c-8d8eb8032c83@oss.qualcomm.com>
 <20260902192434.54709-1-hideo.sumi@mugops.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20260902192434.54709-1-hideo.sumi@mugops.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TjxUAZgzeWmFC00yIt-ityMuXOnLQE2A
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a990f64 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xmPyY564vjej6uAyVk/9Uw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N4V0GIZ52OFWYRwfAJIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1MyBTYWx0ZWRfX6DNHxYzoIVxJ
 ksHZe5bHqxvwN3CYNEecu5oVuNjrlB7zDxw2GvDR93YD5chDHnzyJg08RcxLN0U5bgKK78AzysQ
 jgYqs0CrJgnCyiNfX6qrsIRz1+MW+h+DY/pp/LCSzS0Gz3nmqxHHqJsNvPeNOlbspzsqcgV2xVs
 BmYVlnveDU7sEVv67VITFUYMFsKY8wc/ZI5FUmDRqE9PEC/2cbSB490zJQOhwwqZ7jyE51colcG
 v4wj5KEOceeNDHh9J4FSu1UtiDUD9apOLXPfnkOixNJkQNjSxl0clpRm+u0V0E2deHd68xSo6Eq
 8UfgzwXHbxSYND3saEKsm7yD6hwUVRHpe/KEVD19guCb83BYOr+0GREmSTk0fIM9vQcY4yTE6m1
 Dx7nJbizyL58Ay3dkLrpZtY8eiQhzXVGoTQB38xa1NZxUqwwFpY+jrP/XrEIhIxAwTaGz7qP/eW
 OjWwX03y6m/m0hF+GUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1MyBTYWx0ZWRfXwd3qmkBkQSnY
 laLEvMtpSCYcqF62Y1I21I2dFX67aS2xUS9PHFvR4yAiSuSirHE7ozYgtBPx1bQOwYpPkKyNMp7
 1bTNWVTYOHQqxCfb9artYevfihCuiNQ=
X-Proofpoint-ORIG-GUID: TjxUAZgzeWmFC00yIt-ityMuXOnLQE2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_231046_365682_6EC1BED3 
X-CRM114-Status: GOOD (  47.13  )
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



On 9/3/2026 12:54 AM, Hideo Sumi wrote:
> On 9/2/2026 7:47 PM, Aaradhana Sahu wrote:
>> The intended model is that the root PD is completely managed by
>> qcom_q6v5_mpd, while the Text PD and WiFi User PDs are managed by ath12k.
>> ...
>> So, qcom,rproc in the ath12k DT is expected to point to the root PD.
> 
> Thank you, that settles both questions, and the shared firmware patch is
> exactly the piece I was missing. I built the model you describe and ran it
> on the board. It gets a good way in and then stops, and the last problem
> does not look like something a board can fix, so I am reporting what I
> found rather than guessing at it.
> 
> What I built, on 6.18.44 with backports 7.2:
> 
>   - ath12k loads the shared read-only image itself, your patch [1] ported
>     to this tree (it predates the common/Wi-Fi 7 split, so the mapping
>     comes from power_up() rather than from rproc_info)
>   - the text PD node is gone from the DT
>   - the user PD nodes are gone from the DT, so qcom_q6v5_mpd does not
>     instantiate them
>   - qcom,rproc points at the root PD
> 
> Three things came up on the way. The first two are, I think, plain bugs;
> I have patches for both and will send them separately if you agree.
> 
> 1. ath12k subscribes to the SSR notifier by rproc->name
>    --------------------------------------------------
> 
> ath12k_ahb_register_rproc_notifier() does
> 
>   qcom_register_ssr_notifier(ab_ahb->tgt_rproc->name, &ab_ahb->root_pd_nb);
> 
> but that lookup is keyed by the SSR name a driver passes to
> qcom_add_ssr_subdev(), not by rproc->name. qcom_q6v5_mpd registers
> "q6wcss" -- the same short name qcom_q6v5_wcss.c uses -- while rproc->name
> is the DT node name, "d100000.remoteproc" here. So the notifier registers
> against a name nothing signals:
> 
>   remoteproc remoteproc0: remote processor d100000.remoteproc is now up
>   ath12k_ahb c000000.wifi: RootPD ready wait timed out
>   ath12k_ahb c000000.wifi: probe with driver ath12k_ahb failed: -110
> 
> Subscribing with "q6wcss" fixes it.
> 
> 2. wifi0's memory-region[0] does not contain the images
>    ---------------------------------------------------
> 
> ipq5332.dtsi points it at q6_ipq5332_data. The shared read-only image and
> the user PD images link below that:
> 
>   q6_fw3 (shared RO)   0x4aefd000 - 0x4b296000
>   q6_fw1 (pd1)         0x4b2a3000 - 0x4b55b000
>   q6_ipq5332_data      0x4bd00000 - 0x4ca00000
>   q6_region            0x4a900000 - 0x4ca00000
> 
> so qcom_mdt_load() refuses them:
> 
>   ath12k_ahb c000000.wifi: segment outside memory range
>   ath12k_ahb c000000.wifi: failed to load shared firmware: -22
> 
> Pointing memory-region[0] at q6_region loads both. If ath12k is to own
> these images, the region it loads them into has to be the one they are
> linked for, and on this SoC that is the root PD's window.
> 
> 3. The user PD nodes: removing them is what the model requires, and
>    also what breaks it
>    ---------------------------------------------------------------
> 
> This is the one I cannot resolve from here.
> 
> Leaving pd-1/pd-2 in the DT does reproduce the IRQ conflict, exactly as
> you said:
> 
>   genirq: Flags mismatch irq 31. 00002001 (UserPD1-spawn)
>           vs. 00002001 (q6v5_wcss_userpd1_spawn-ack)
>   ath12k_ahb c000000.wifi: Request spawn irq failed: -16
> 
> Removing them clears that. But the root PD then stops during its own boot.
> Its crash record says:
> 
>   pd_stubs.c:137  Invalid user-pd CS load address 0x0
>   Thread name : sys_m_smsm   Process name : kernel
>   PC : 0xc000ae58  SSR : 0x018f0027  BADVA : 0x00000000
> 
> and ath12k ends at "UserPD spawn wait timed out", probe -110.
> 
> The address it is missing comes from SMEM item 507, written by
> qcom_q6v5_mpd's share_upd_bootinfo_to_q6() before the root PD is started:
> 
>   list_for_each_entry(upd_rproc, &upd_rproc_list, node) {
>           upd_bootinfo.pid       = upd_wcss->pd_asid + 1;
>           upd_bootinfo.bootaddr  = rproc_get_boot_addr(upd_rproc, fw);
>           upd_bootinfo.data_size = qcom_mdt_get_size(fw);
>   }
> 
> upd_rproc_list holds the user PD rprocs qcom_q6v5_mpd created. With the
> user PD nodes removed it is empty, so nothing is published and the root PD
> faults on a zero address. With them present, remoteproc owns the spawn
> interrupt. As it stands the two requirements exclude each other.
> 
> So my question is: in the intended model, who publishes the user PD boot
> info to SMEM 507? Three shapes seem possible and I did not want to pick
> one blind:
> 
>   - ath12k writes it, since it owns the images and knows their addresses.
>     That would mean moving share_upd_bootinfo_to_q6() out of remoteproc,
>     or exporting it.
>   - qcom_q6v5_mpd keeps writing it, reading the user PD nodes for their
>     firmware-name but not creating rprocs for them. The nodes would stay
>     in the DT and describe the PDs without claiming them.
>   - Something else covers it that I have not found -- the shared firmware
>     patch does not touch SMEM 507, so if there is a companion change I
>     have missed it.
> 
> I do not think [1] alone is enough to boot this without one of those, but
> I may well be reading the wrong tree; if this is fixed in ath12k-ng or in
> a series I have not seen, that is a fine answer and I will go and read it.
> 
> For reference: reading the Q6's crash record needed a change of its own.
> q6v5_fatal_interrupt() calls
> 
>   qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
> 
> and QCOM_SMEM_HOST_ANY is -1, so smem.c only searches the global
> partition. On this part the record is in the WCSS private partition, host
> 1, and qcom_q6v5_mpd already defines WCSS_SMEM_HOST as 1 for it without
> using it, because qcom_q6v5_init() has no way to pass a host through.
> Until I read it from host 1 every one of these failures printed only
> "fatal error without message". I am happy to send that as a patch too if
> it is wanted.
> 
> Board is on a serial console with a recoverable second firmware bank, so I
> can test whatever is useful.
> 
> [1] https://lore.kernel.org/linux-wireless/20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com/
> 
> Regards,
> Hideo Sumi

Before we look into the SMEM handling, could you please confirm whether you are using the
latest ath.git ToT and whether the remoteproc v14 series is included?

Remoteproc series:
https://patchwork.kernel.org/project/linux-arm-msm/cover/20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com/

Could you also share the complete DT changes and the firmware version you are using?
It would help to know how many WiFi devices/User PDs are attached on your platform.

Once I have these details, I can check whether the issue is already addressed in the latest patches
or whether an additional change is needed.

