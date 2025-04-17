Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA06C369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Be6m2HqIEihUmnVtYiPM/ZbG65KieSdUP57uv1iI/OU=; b=QsKViVSM2dimSY15wnSOwiw+E2
	Du5cUTtyYgT27GteHnYM21Qgfl+5HwKfudNHxlSkq7vu59PnaObKhnGLFgb+vYnQTL+ufx7ZCGEw7
	KxlPyyFCulQFD/25h/Rkgh0N6gUY2sLxJhB2Ut8NGZL++Bghko7UB1QpCxyQMkzLr5Of6+IwtGXsA
	J7HisuxHbj1I8lUV/PkfwIunM1Y8I16eJlwfxOyXM5ibtFSvBP4jFcUIpWxZbN0mtV+Ql6yg5sUV2
	vrT23o5askTW9sYV3O06eVxgzWdIY0uboSqnYJTST/t65Kk+Gme4ZmEC/FkNrdO11rUw7NnQm6ISY
	UWZvoNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HDN-0000000Bi8k-3NwN;
	Thu, 17 Apr 2025 04:51:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HDK-0000000Bi81-1kxP
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:51:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GL4r99003388
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Be6m2HqIEihUmnVtYiPM/ZbG65KieSdUP57uv1iI/OU=; b=iYxAngUiVCQbNxES
	NnKypiG2+NvqsoPtwZ7IFm78PXTo2mqEakIe7WpiH6g5biMUyUWovmJ+z+KaF7nN
	ld7vUSqlhtVYUv1Ue/gc4hSFmNf21fAztYRlDBR6WROhXuF2MsR9iiOWpZ+pwKU+
	EeaCAWmUeOQT+i6qfUKA++agRdIFx4BhHNAGmLdz2lBWSiEWtsjZCeghxPZYlfJ0
	CH/9N6J1B0ZhA+hyiEpz86ZDptdjAaaFJ8DsAaJHjPQ1t2XiAH+fB7hDTj8Li4Xr
	Xx1Xw7Mdnba7Q+iiavyX3GnbCuOMpV0y92zZWUc0GaTWQiT+zWo5BSPNqTR0qwvV
	EpXS+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvax09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:51:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b431ee0dso302733b3a.0
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 21:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744865461; x=1745470261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Be6m2HqIEihUmnVtYiPM/ZbG65KieSdUP57uv1iI/OU=;
        b=dUZFQcBg0V7nVR2xbAY1nmjQZRSzZu2NeMhG8W6AJiVtGVMtBn8j0U9N3lL2Bw0jo7
         XezQadLsD7XdUDWX/P7yAKiLMBl+c5zhhqOsAIAbLbKwGj06QDZKxGE5N6Rl/l0tETS0
         7/mCw7AxQfJwpGV2KatyfGB3uAN48xYdzWHHz2GLRgDeRIevV10Jy2S66nXRXzt7Je4a
         jp71xU0V2fVHSAOHFjf1/KctRwc01F/Ae+MfM2aBNU57FSSX/VfMreSdpJA+ExZTM+OC
         v9FvEJrZowCPSbV2k5y4dWoKzJ8+CZs/G2rfGUv0Yz5MKFMPme4/86ZS6LXdmljGRFo8
         C/7w==
X-Forwarded-Encrypted: i=1; AJvYcCX3KA3yrHYzwJ0puO5fuQp9DQBl0ZdBhSziFnaAv4tGAfpGD9NiuGUvgrcMvvnE5x4AJmcTZ2w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYO+pz+Lbj+oGWskwxhN9UROo96ak/oii7iN3Hv/ZAR0P4sh/l
	JqKUn6OZKqJD3D9g0cEtbZWhax0WdHr1zZ9Frxo9QxSMliNVAfz3UalI8/1/HoHSYXIfpUoujMT
	IGixaVby49+hDNUWX7jQH6Aaq6oa5utn2tIjBjqd/0+yXjBhunWSyYItVYOLY
X-Gm-Gg: ASbGncvFzlYim8Dl6ODDk57DnhX3O/ICs2O6T0EPANEiBcFQgLVYiXd644pYNZNqbNS
	XeE0Iyg59HqgM8HOQpWBZlhAmAyYNJoXrAEPnW3Q1dTQp0j5Yf5L2q/Q/oI2HVjKCnNvXz2IaGe
	6oEuOx67W7h8YBCWdcc02LQVePX/6FHslzubbEUth23T1gCm655ZvoTYcqDN6/xzugP2Dkt7ZXC
	F+VovJYljC12lUZz4YtQr3j5jJT32OFtkZLuVcTFCjuV7C3lds2eZru8+u2xiE+SS2b2VzknHQK
	gnogFhKa47eySZJsz8uY97WW3GQGDfTd+lyT0NLv1WqxaKjTUTuBvg==
X-Received: by 2002:aa7:9313:0:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-73c266e1782mr6112047b3a.6.1744865461147;
        Wed, 16 Apr 2025 21:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzihpiHHaq8nx3XfS23uRKBU/YcXwR5Y0HWffmYYmDvrY9BXNyFYep7Pv/t1Wqu0PdOQLEww==
X-Received: by 2002:aa7:9313:0:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-73c266e1782mr6112030b3a.6.1744865460720;
        Wed, 16 Apr 2025 21:51:00 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73d90750bb7sm406364b3a.126.2025.04.16.21.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 21:51:00 -0700 (PDT)
Message-ID: <08e7af61-411e-2db4-e731-fc1adb180afc@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 10:20:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: fix node corruption in ar->arvifs
 list
Content-Language: en-US
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250416021724.2162519-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250416021724.2162519-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qiXq-2KSh1hM48BpIkuWt_cW5TLdgtq9
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=680088b6 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=boy3l9ICv52KCTrOtmEA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qiXq-2KSh1hM48BpIkuWt_cW5TLdgtq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=785
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_215102_464706_CE3810D5 
X-CRM114-Status: GOOD (  14.13  )
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



On 4/16/2025 7:47 AM, Maharaja Kennadyrajan wrote:
> In current WLAN recovery code flow, ath12k_core_halt() only reinitializes
> the "arvifs" list head. This will cause the list node immediately following
> the list head to become an invalid list node. Because the prev of that node
> still points to the list head "arvifs", but the next of the list head
> "arvifs" no longer points to that list node.
> 
> When a WLAN recovery occurs during the execution of a vif removal, and it
> happens before the spin_lock_bh(&ar->data_lock) in
> ath12k_mac_vdev_delete(), list_del() will detect the previously mentioned
> situation, thereby triggering a kernel panic.
> 
> The fix is to remove and reinitialize all vif list nodes from the list head
> "arvifs" during WLAN halt. The reinitialization is to make the list nodes
> valid, ensuring that the list_del() in ath12k_mac_vdev_delete() can execute
> normally.
> 
> Call trace:
> __list_del_entry_valid_or_report+0xd4/0x100 (P)
> ath12k_mac_remove_link_interface.isra.0+0xf8/0x2e4 [ath12k]
> ath12k_scan_vdev_clean_work+0x40/0x164 [ath12k]
> cfg80211_wiphy_work+0xfc/0x100
> process_one_work+0x164/0x2d0
> worker_thread+0x254/0x380
> kthread+0xfc/0x100
> ret_from_fork+0x10/0x20
> 
> The change is mostly copied from the ath11k patch:
> https://lore.kernel.org/all/20250320053145.3445187-1-quic_stonez@quicinc.com/
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

