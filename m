Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A28109023F
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPcf2trL93E6xZUMO+BAJd0tDKLmZYatHQADeNtCTTE=; b=Vp3zZhaKrPZpuqrpo1uIsUACaK
	BJfxUbisrmPeUK3B2vZq0UcQH5Ya2xsrUiOw/pKiftNAS4iz9jTfybblHeeH05jlZ/lERFGpCVb9R
	yH4moiVcg1kx9l3DwTfjZSH33kyA+1pmjiS27jAmTlvndEZSbO2NYEbbsx53AIDTPjdhQc0GluGuD
	p/x5/9Nannjgr/PXLFPB3BZrLJCJX+nEyWvY6Vc0LwJmut2vxMruiHB9esDr3hZOdXWpUEIH1M68h
	yd7nQQyUelEVp+HGtrBFWPyxvx4BouF417vzG/UFNv/D8Bq36hF370WEQB4pciAULhKBPTZJybBsc
	n1jBFgkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GA1-0000000B49T-2NyA;
	Thu, 19 Mar 2026 16:23:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3G9z-0000000B495-0A8V
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 16:23:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JFOI4H771238
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 16:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPcf2trL93E6xZUMO+BAJd0tDKLmZYatHQADeNtCTTE=; b=S8lLtu1Aefee93FX
	WDR0EOGMT0KpKx5fZ2wsr9BxY7iS7s4UIyQ5h1V/zy5+C5TPkr5DXjNKQXU35OFZ
	Bov6crWDX/mq+/9V6JFFiCuTGYnhKovGCWQok25yofUt/SMcpKW0bAkItQmHJteG
	k8d3khXzWH3bD2BHwyMWJ+VnhCb+UfI7n3znNLsh1wWSkbzcPkv/r+q8J4lBSmpC
	wv/STbVv5NhJ5FX3UFvFa+p90J5KduIkx2dZq940ETJBNuKq7ntv4erFUEIt8Xnu
	d+/AYxqt5GI9j5iPr66bddjGzmZpO9Pi2Gsox4HqHf1Fe4LwOeHbTUs5ECF9MJl+
	BJcr5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00egbwt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 16:23:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aecfe69196so10516765ad.1
        for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773937424; x=1774542224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPcf2trL93E6xZUMO+BAJd0tDKLmZYatHQADeNtCTTE=;
        b=EO2BAmM5Z8OXb23AmeUp9F9N2yAyJGMd+vAPl35BdDeTc4xHRTvPPKfYj2HD+mkfD5
         fxcbDhEo/PEgb4ULWMLiJDpktY50J/jLzj4KwnxUco8zajMqD7aMmChTydC+db0x0aVa
         y/TieMoeIUe+rTcm7DfrSr2hRMga1SkCq/D89B88+PXp+xirXxWr1YPmU8591o8RoRD6
         iQjFRIxayxF479b0D9ZsnmZvAL2AQhyF6ascullmpzDybClwmcUZAIfGSTlpj8VmYUdz
         ZcL+Q+cKLroSPU3rcxdxKblFPt7Vhr8ydzymrMw/lf7XPHJcz8V40c0bj7hN3vELwGsd
         cJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773937424; x=1774542224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPcf2trL93E6xZUMO+BAJd0tDKLmZYatHQADeNtCTTE=;
        b=Yygm6G41He5HtmRJcwyGWY674eFdWWxis8DiGVE+8b9UzATYWu9nJV3B4sifSzAyj8
         24+deCCJ3AsntYbuDsvdhj6GmKh9dGfdKZHQvHjnCNo8beSgFD7hRewrmh39RE/ksmKj
         7pNt4Ju2Si8h+ePP0n4eYt1iLyWlhDPVhaxnMDStrAXLovTNtieKd9OYbDQKTYNzTuNh
         ELu4mDDdRdO47A76OYdrQZF4SQR2TnQin41//Xggw+v2jx0mdX9YhI0U24gUX+X1Y2L9
         XJ1YXKRhnV0mjDV3SupzrlTdlfYgGV9RztPEB+9UwjigDwszvKee4jt35l76fDOxJq3V
         QOxg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Nbtvm9AMJarpGKeeO/r2Y+toF4oKuzxbI2CPUCJjfMvcM425ZrORZ0uiadrLnuetb2Xllb0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0tZhbqdLGNE9BEmLbT3a8WBg/BzYm7g7HFwxFxG/+qKHFGBKK
	yedznpBtPxCnK+s3k9REduwndOeXKNQZ96MAqzwsXzChwIi3c/YZ2cfMzBdYY6r8rIwkvsRPS1i
	kjQKGH6a5aQKVX5RkajO1R+bS4Xrsj5+rXbznknM1f9SevTRiHT6JlzvJsANnKKw1S4puWmGI
X-Gm-Gg: ATEYQzxdvi1VFHx5nL1Q4osksKdHkC88n3QqMLP/iJEZTlVQ1WVwnxs7lwAEkkCgwD5
	Sl66IrA1pXF4HHEzTrqSwPC0JHP752zwRXIepAIPviKfZmqMdGZv/NVGxXTPcZsX/GzANmiQJjH
	sqRX+v8P7ES0wbz7E+xK7czOqWGoElLzsqWtC5+eCBhXL+DbtkGNQEejuodKY0GlTUeiMllz2j3
	yjknB8KdeUPT5ASqwBCaIBwSugEmNxlCFM5Uv9qy06hEu4/vuLtZi6GDV6h2VZERgA7boFEVrZI
	xhG6Jv2B/0krJpXZ2dwQ0TL92ed2O2m38lA1DYoyrV35z+cS+bRD+Dh/vrE55apHRdWP6TM8fLw
	IQkjr2WJzasxGrNZZEPAtgag5JJzyI5UHytiK9/vFRvnifDGCYnXNJhE0/uhBeNF4xXD9tqr9
X-Received: by 2002:a17:903:1666:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b06e3dd456mr66987775ad.26.1773937424309;
        Thu, 19 Mar 2026 09:23:44 -0700 (PDT)
X-Received: by 2002:a17:903:1666:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b06e3dd456mr66987605ad.26.1773937423754;
        Thu, 19 Mar 2026 09:23:43 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.250.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e5694acsm5797420a12.24.2026.03.19.09.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 09:23:43 -0700 (PDT)
Message-ID: <2ad176e7-05f4-4ff8-877d-f72479c942ea@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 21:53:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: prepare REO update element only
 for primary link
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260210-ath12k-rxtid-double-free-v1-1-8b523fb2886d@oss.qualcomm.com>
 <8056cb5f-cdde-4890-b8cf-3b37d1c3483f@oss.qualcomm.com>
 <1a037a6b-f39d-4624-8f3d-1298da8c50bf@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <1a037a6b-f39d-4624-8f3d-1298da8c50bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bc2311 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=t7h/bT458PYVitGB/2kRvw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w4kZ-GgywCtsffi29wMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: ln5TBEMNZ21jtLcmjHM5sRxXYLzQvX2W
X-Proofpoint-GUID: ln5TBEMNZ21jtLcmjHM5sRxXYLzQvX2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEzMCBTYWx0ZWRfXxC4I7QW7nawP
 M/m6odiY/OM1ma4+tCvBAjDhHRzaIZVZDDcIr0lvsmseJqEbB+6w4y7OJABljo4XhCZF5Z0rRe6
 1Mg93t18p4G2v+uHSnKrtTmqJ+fIvC2anV34ahGnLtvyEDr5TrGvdxs6xc5Z81USzGbExfZxpWK
 pn2nQmXB2sQInSrolZXu2WldJ/jPBHTTjtsXaObm3+FLSDdk1gmOTSe7wkAx9CeCm9SIwNNWcen
 vV6w9LMkhxCMu3aYeK6yjAyteyL7eoX6GlRK08GIciuzO5XApTOkKXVn/th9awHU/pXbEZkpab5
 iHvkAUST9hS73Iw4zEMpGqjlsSGHCMXW5jwxbNJJc+OPMPsBwQ9+PGeoxEY2q4MCXFdxmisLMzq
 ZGjQoN6MZtDasfgKDeUmqM002qrN1ZAyk0af1QBNDyROJI4dNn8dEb5yGBSwj5bSpFod8+aPFiy
 fuEMY2Zv9lJyvW5MXqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_092347_088945_C82B8F1C 
X-CRM114-Status: GOOD (  13.84  )
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



On 3/19/2026 7:44 PM, Jeff Johnson wrote:
> On 3/18/2026 8:46 PM, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 2/10/2026 8:37 AM, Baochen Qiang wrote:
>>> Commit [1] introduces dp->reo_cmd_update_rx_queue_list for the purpose
>>> of tracking all pending REO queue flush commands. The helper
>>> ath12k_dp_prepare_reo_update_elem() allocates an element and populates
>>> it with REO queue information, then add it to the list. The element would
>>> be helpful during clean up stage to finally unmap/free the corresponding
>>> REO queue buffer.
>>>
>>> In MLO scenarios with more than one links, for non dp_primary_link_only
>>> chips like WCN7850, that helper is called for each link peer. This
>>> results in multiple elements added to the list but all of them pointing
>>> to the same REO queue buffer. Consequently the same buffer gets
>>> unmap/freed multiple times:
>>>
>>> BUG kmalloc-2k (Tainted: G    B   W  O       ): Object already free
>>> -----------------------------------------------------------------------------
>>> Allocated in ath12k_wifi7_dp_rx_assign_reoq+0xce/0x280 [ath12k_wifi7] age=7436 cpu=10 pid=16130
>>>    __kmalloc_noprof
>>>    ath12k_wifi7_dp_rx_assign_reoq
>>>    ath12k_dp_rx_peer_tid_setup
>>>    ath12k_dp_peer_setup
>>>    ath12k_mac_station_add
>>>    ath12k_mac_op_sta_state
>>>    [...]
>>> Freed in ath12k_dp_rx_tid_cleanup.part.0+0x25/0x40 [ath12k] age=1 cpu=27 pid=16137
>>>    kfree
>>>    ath12k_dp_rx_tid_cleanup.part.0
>>>    ath12k_dp_rx_reo_cmd_list_cleanup
>>>    ath12k_dp_cmn_device_deinit
>>>    ath12k_core_stop
>>>    ath12k_core_hw_group_cleanup
>>>    ath12k_pci_remove
>>>
>>> Fix this by allowing list addition for primary link only. Note
>>> dp_primary_link_only chips like QCN9274 are not affected by this change,
>>> because that's what they were doing in the first place.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>>
>>> Fixes: 3bf2e57e7d6c ("wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures") # [1]
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221011
>>> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>
>> Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
> 
> Was there supposed to be a tag in front of that?
> 

Oops, sorry!

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

