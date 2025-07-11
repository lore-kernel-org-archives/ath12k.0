Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC259C83F1A
	for <ath12k@archiver.kernel.org>; Fri, 11 Jul 2025 10:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGL/SZNkDefnD8rnQdJa++pgq2SPm6cH4YHcPivQI8U=; b=kKQMDH1WZTsMqXchFnPXIh9iQg
	6QZ2qj6kSwCWaQVfqWFzZy4kXCfNEeDdXWJGzhQWaHbZKlERg90wKjtFI1LYiTQALN2n/fH1j3cFF
	AmrqGvFAUlssbVpsG59Gn6ZzNQF3ZCyBEKGBwf4njH4rZRuRCdjmFVE4LepvKULAPh/WNP4j9i7pv
	4iVWC91BxUZ9WkXTGsUwIM3BR2qysZM5IDY7zQ6xaQdIteDbtslWgE38gOs7Ikin0usKWMeApGD0j
	FpEW2ZisehzYY5kZnGwMBSWIghlT7+lhnjdK2iaCKbe9q+1OBFqH4LNQ4aAr5mqRjBcwK1XIzap3a
	LkQm7Nug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAyC-0000000EUAZ-28xY;
	Fri, 11 Jul 2025 10:27:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaADK-0000000EL3F-3ug6
	for ath12k@lists.infradead.org;
	Fri, 11 Jul 2025 09:38:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XBIJ008142
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 09:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGL/SZNkDefnD8rnQdJa++pgq2SPm6cH4YHcPivQI8U=; b=B4jheiAikNANkj5K
	kdYwcGuJnFijefFrmCxBtyoxZtDOTXk+XCvPIHtZk3qyGYiwoPlBX/iM4zGoQRTS
	1AwUwyIr7LKQlteGGmhK/BmUxZFoT5uxRJ3ZOeZIaQCaJcPmvA6W++WlJxPKcYlo
	ni04g1m2RZMPo+7pDDViLxBilHR0TbPAPNh5l8mp6rNdEqA6Q9JMM4V015IExrDl
	1hDgUz4+SAkwRH4u4zTxCJUlMC1qxcxxYbU4G5Nd2238m1GjH8E6lgmyJ6DIIRbp
	TjHIHDWrWyDWG9vvg1MRcOoCgGt1F4YcpSx8oQjdJELvMMeHckJisB4R//m2aqIq
	pgTETQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg8345-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 09:38:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23692793178so18203395ad.0
        for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 02:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226721; x=1752831521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGL/SZNkDefnD8rnQdJa++pgq2SPm6cH4YHcPivQI8U=;
        b=iZsOj7Q4sT+fmquDm+9HTJKm+FrrV3AmZKhh46RGN7CS+IdIc61Ro1NQi/1FwgVJrN
         VY+cfUDrgnx13EUI8qQ7oXVUKZxQQpLOkommLUPbN52Ay/eM6S7U6pMys0/BiKsVS1fS
         xL53jG9ZSKskZF0wUM0QfgBjHVDpuAUvKr4MQhtCBYrjqF7VQmsjw8wJXWtzB2q49viz
         08+NlaxFZaqfro9ZP6bltnP0+okShCM+A0DarX8V6gI6Pongs9e0uQw9alf3vtZJaEnK
         3eBOx7BtbK5Yt87A5GJJBjqpq0T06gTRXu0zZRstQ/HKWLurfgi8hw5Dbr+/DNWE75rt
         8YOw==
X-Forwarded-Encrypted: i=1; AJvYcCXH0yRUbaNOhE4Sycw//pWyHZy9mvIoXAzyFTTVAvOV3GLagGgHoaD9fwQXG+bTTT0Fi3m2CWA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcQ26UkKAIJdrOXjvmMIjq0+wCrT55/lS2nJwkUXllWFabPeCa
	LPjV7AvKc5b1L6v21hV4uR+OUqkQfpoLAqr0NxM3WB4FLgtn7QHkxuQez3DRR/WVtvLOSHD3Ljr
	8lNemBOxsbUB+XpSMXHvmEeAyjIIkHsuQdXr0ewoETqNat+5x0tyV9aZcHvrFn95E
X-Gm-Gg: ASbGncvbZlLJpHNR8p//fasV7pL+ISrMD4wYPR30gfqxpX/GVKIcu4XCCW3vDkzcEVv
	XAfIqfCCyaDoUmqrQ+aJjPoFusEwxROuSaeWBa2jV53m88RgrV0OsvoHnZ7T1TBA/W2L4TJ3oyR
	zY5UfWSmGb7RxPflNp+WTnFE1xsvQM2zsHMdut82KpVLZ7No560IHFa8ifXID1ZGVb8T4rq0zTt
	qV18YAFHYHdayUPLOw89c8XztD/F0Nhaltmydmsp4nzNVCj3N3sT2vv3raIePWTAkgTDX2ieVR2
	wDTz5noZ1BokG2fiiCnKG7dLkzeZSRiMT9LHd4AUR/m0bBUs4k6eJVr15DV3hbw6SwxmhNlP+Fb
	7HfmiTcDRhU7OSO2JwRkT+VZr3USLjr9b
X-Received: by 2002:a17:903:90e:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-23dede860c0mr32494645ad.31.1752226720659;
        Fri, 11 Jul 2025 02:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL/Jqdo5vlOQiCfiDk4KSGN3BOX4g13P+XxoqP0LXTTfRT6yCGKdy3OfUF0j3Ba8Bvb/D5fg==
X-Received: by 2002:a17:903:90e:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-23dede860c0mr32494245ad.31.1752226720121;
        Fri, 11 Jul 2025 02:38:40 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4333e6csm47071625ad.162.2025.07.11.02.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 02:38:39 -0700 (PDT)
Message-ID: <3cb437c4-d113-48fc-a672-d8f7fbbd11ff@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:38:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix packets received in WBM error
 ring with REO LUT enabled
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, tanguy@squaremind.io
References: <20250710011754.559817-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250710011754.559817-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6870dba1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=p8CdzvKiexFK_hkQNEAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hXs9RHU9ymfzC9Wf93P1NISmGrWF886b
X-Proofpoint-GUID: hXs9RHU9ymfzC9Wf93P1NISmGrWF886b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2NyBTYWx0ZWRfX2xrKeIDIbbb7
 g2qaKAAVRmizHJenrWqzxUWE3IT6mbb+dNlKk5755UACfH32QnvoK48BZ/kSYTfAkV0RBIm0m5J
 ZOzxjJdol3BmZPwdhwyYjiEoBMY/JgEYgcFhHZYASzJKVvph7X4uOK6ssWbEU9CqqCajrRGlXB4
 HZJRdtEqwe29UFQvAi7ugDab4nFoP8EgGp//CDWB5vwSkP8pyBKyNDthBst56VUTRfi1D28CNNB
 5dRPLx0lsR6jFMklausc3BQB6pKoIhnQzYUW5sKTLl+2D6RRGBpmfOCULOYxv+copWIqs2Hr32j
 MVobGYMzyoA5oY/Ub19TN1oZ1cLpQ5DAiGxuiFuVM70R+5uRGuiYzkjM0N7KHg/MCSUhIGNu0yy
 EH8jjK1Rl0l5U+J7dVTxkOQ6VzQ83HsOW70aHg976xE4LP9zoEJkD2dxTTRutUGZXPCcgN4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_023842_993029_ED64AE21 
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



On 7/10/2025 9:17 AM, Nithyanantham Paramasivam wrote:
> Currently, packets are being received into the WBM error ring when
> REO queue lookup is enabled, resulting in degraded RX performance.
> The issue arises because the REO queue LUT TID memory reference is
> set to zero-it's being assigned before the memory is allocated.
> Fix this by assigning the REO queue TID memory reference in the LUT
> immediately after memory allocation to ensure correct packet
> processing.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Reported-by: Tanguy Serrat <tanguy@squaremind.io>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220282
> Fixes: 3b9cbce6fdd3 ("wifi: ath12k: alloc REO queue per station")
> Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index ed325aa6322d..65b4c91e4fe5 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1060,7 +1060,6 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
>  	}
>  
>  	rx_tid = &peer->rx_tid[tid];
> -	paddr_aligned = rx_tid->qbuf.paddr_aligned;
>  	/* Update the tid queue if it is already setup */
>  	if (rx_tid->active) {
>  		ret = ath12k_peer_rx_tid_reo_update(ar, peer, rx_tid,
> @@ -1072,6 +1071,7 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
>  		}
>  
>  		if (!ab->hw_params->reoq_lut_support) {
> +			paddr_aligned = rx_tid->qbuf.paddr_aligned;
>  			ret = ath12k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id,
>  								     peer_mac,
>  								     paddr_aligned, tid,
> @@ -1098,6 +1098,7 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
>  		return ret;
>  	}
>  
> +	paddr_aligned = rx_tid->qbuf.paddr_aligned;
>  	if (ab->hw_params->reoq_lut_support) {
>  		/* Update the REO queue LUT at the corresponding peer id
>  		 * and tid with qaddr.
> 
> base-commit: 45bbd91fc41b7cb6319e45e6fd732c5c8a0c44e3

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>


