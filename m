Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C85D25050
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWkCQrMVdcNN3iDMPf5vzVoyrfbbNe8+1ztYVn/Zmqg=; b=z/8XKJr2eOZojL0GbariroIbg9
	utc10OyqkoeaX4+/0VwUWHq3H5hwDRGGYQi9Lyb66130Qw5WKCa3ZGMxxbQW+UV0+FVFyb33QsZtt
	CbKVvnV3JAgXNMIuoNGKWxoAB8rLZ5jOQpTYfziiVqlmfo6rDGHCVeJ6TZSdXMDfZNtKpx152WnsV
	gbTK+w+8SkpRDMkaOIyuGWHBGj1BzfpBa3NDDg8smvqXZw+wNA0y6ClZrJuB5j56Rqfjv+evRVP2x
	IgrgCFbsvDkKZfT4F8CgqMcOCIz01yXzXyldfjomvJwN9m8vzIwB8AnY6OFp2Me2PrEAjTRPGnpVC
	bGVrFreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDgL-000000051lt-0yUz;
	Mon, 12 Jan 2026 08:53:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDgI-000000051lQ-3vk3
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 08:53:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C83BOA3072041
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 08:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWkCQrMVdcNN3iDMPf5vzVoyrfbbNe8+1ztYVn/Zmqg=; b=hwSFANl1H5fAwBPG
	TVHt5jto1u9+H/VGFbWAu37FDkvW5uhj12YUA7atyxL3GFuX+c17Aux9Fn+47vw4
	qGcRS8u+UcE5Pp/dFWZ4k6FF9w1dapROQ0xO7k/ciIIooeN1Wdq5gV5T6KlyrTVJ
	6MP4iLTyTobxOqPKh3ZDztmz53UOv8QKIJWANq6xU+IA/hWH/hWa8g1Rt74GqqIW
	a34zmXfDG0ltJWi7PjLYU4Vd+mS853Gh0HPLB1nwupDvmZt9zA2GRbGOybwbQ8if
	j2BSIde+DQhGwEC3ELPft3OZ/Am9foakx2fqdFEZSk9scxTUHKMD7lFF/AP+5qB5
	rQpsxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntukpm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 08:53:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1450189eso44606485ad.1
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 00:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768208026; x=1768812826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWkCQrMVdcNN3iDMPf5vzVoyrfbbNe8+1ztYVn/Zmqg=;
        b=DWQOjiZkskCFNDYKfyGWykSCoHVslfWllWM3j/eiz2rtkbBCAFxB9D3w7GfKLu8Zwj
         20NOO4WzFx7f+VCtW/mquTa0PbopnSdbrSOacPbKePWdOOegB1FxGbQ6q8wuaf/dDPCU
         XVCEep1aKnpXoGpKP7uDVuuB09j0/ipEFH8I1Ax7tMWdSSYVsd8s4+BFbo6Gb3AFonv2
         QLCzdgHegkA+nQ3YVFMeJ4jFzL3w/O11LjbZUynvycJrelGB9VL2IsFk8fr1r1atISbn
         rBlZ93oFhuXPCX9V351ZHam4QTVICaDwDJ9F3sd0ZTQhljF0QV0VRWQv78DEhYyARoX6
         dY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208026; x=1768812826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWkCQrMVdcNN3iDMPf5vzVoyrfbbNe8+1ztYVn/Zmqg=;
        b=qxoy66uIiwJ/9vZGuZ6SbSNtwmRK/w8mvxBrsCzAqactVZ1G29VWXa9B89GfeRQSCG
         IDHv4M6/p5USeDKf6Gd92Swt6IhA1RG6Bv3R9CaQDAReVTLfv/872zPGUNWcCIgM6TCY
         0CEah+Ki6ETejSISjc1s/KCBgBbXGPvMXvkltMmnJLxvfUAcj/E1ixHsrrSBg6sIpU5N
         +6jerEy+Dhwtfi3TWSmDY8cbc1WO6LGsRWiZZLzh1XEhAlc/FPvvYlRHHQ7iSkPqWmzE
         QA7U6UFrhXI+W2T15Zf92PIMwwPgtd+wlUVtXRwhSE3UOOEqPeoVB2fg51MHH+kKMog/
         ndLg==
X-Forwarded-Encrypted: i=1; AJvYcCWwdmQIUN2K9TVcZiGqHWSLOX5WFkD7UeJQF9z5jpaQOhhVNrlN2Hz+ZwpcWp9X/aZUL/9Qdoo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIGMH8TQ3c+aI9SFoLcRl+mtOwYqSMKOi6eEI8xcyIxXMws86a
	J/qJSjpbvyD1gA0iNyBlAAnGa2DemKHqt7SRlvElPpyOsJ9vnnDntpgOoAIGldA1GPPH0PrHGe5
	mA9U7HtsmDd+kcfvhjsldWM4VnLvEOeajcCvzakOx+Tv6b2KbqJDSOhu0F5uhzfff
X-Gm-Gg: AY/fxX4PwTX+rrhjc1JIL+zbTlpx9JyJYteNkXK0OoOCbeAR4PS1DnnQX04RPrxLjzF
	ovC9krhWAQb1R1iDWEqJEt2e/z+VQZTXSNfaeBHDTjoS2bQ1aPKEBPNYZO9pK+ArkksXcV4adi7
	LZfZgz1+LoQZHhk41FMcYfUwMiVxi7U7p5fveZFGgPTrSu1ENpk6SNzTJ0Rwk2M7CLu0QAOcSyB
	axLs3MIfpQXkqTsTDikGzvQA7zvJCmiqxJ+i7cpAJg6GvSdShG+U8iUSZ6Ybnz04igT6fDdlkcJ
	AyamYBTtudlEyczYJ4nplUXb04n+PESikRTz4lfTgIQmoH7Xj0WAEr0/sX7T6gdIMnncoNe1Xcg
	HUZIRG0urd5LDxEMAzAki6Db706vytEpZv+6kdvY+tuD9/ONzA4w4UIsxC3IrmbyjFixNMQzs5D
	NPLQie0M0=
X-Received: by 2002:a17:903:3d0b:b0:2a1:3ad6:fab3 with SMTP id d9443c01a7336-2a3e398244bmr192928365ad.1.1768208025758;
        Mon, 12 Jan 2026 00:53:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKlV+4r56idUQPnjdvCP2LdvJBCgqv0nR7FqSVZHFjbjhnrVVHBD1fhu/ZRznMJ6bG9A0f2A==
X-Received: by 2002:a17:903:3d0b:b0:2a1:3ad6:fab3 with SMTP id d9443c01a7336-2a3e398244bmr192928235ad.1.1768208025290;
        Mon, 12 Jan 2026 00:53:45 -0800 (PST)
Received: from [10.133.33.243] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2df6sm170159115ad.61.2026.01.12.00.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 00:53:45 -0800 (PST)
Message-ID: <f6c5c5cc-8dad-494f-91ef-632b5316a9a9@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 16:53:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: cancel scan only on active scan
 vdev
To: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260107-scan_vdev-v1-1-b600aedc645a@qti.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260107-scan_vdev-v1-1-b600aedc645a@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2OSBTYWx0ZWRfX3wWpPDvywmjM
 xF0p6d7aEnm9AQ66je6IjZsoIWtDA9yq3yb3xqCuqsGDKaGVrJDo1JN8V+IcrkPf6HoBIvQ/6Jj
 37fJyLxLc6shfjXsBgErGLCYa87Mq058C9av4m5IFB5mG3rbf56QoyN8hfPi7eJ2/IosJ6TTtlk
 34HVFmDrTSnxqOKHGzps/5zx8XwRNXx+es5XMqFBrcpK+xVkL9Wd0kMEozjVGogpViXC8CzBzkM
 D2mPin/L4hCVoSu/0Db9iO6eSNzfb9MLjwo+8j9Tlk+1tsrxzxRJcj10iz4ps21ZAea9IyhPbHf
 ncoxBtWhrXVqG4v/D+xt2So6tcAB24twSbyoixIWvqx6SulHr1nR+kpTZgWgU5TvoZjwpad7vIt
 aYD0nZTXrxUnABPKNgnUE/b2pEHqE+Yob2xDlSIcA8gY2REG0d0FK3MpH3TJVMquOiTE92cpdF2
 6RUzh9n2sx1eNu0kIVg==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964b69a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pvcN0sP83juaDmYZ9xwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: r6eT1j6lr1CWWcrzxZ2m2sy4fCAt-FVy
X-Proofpoint-GUID: r6eT1j6lr1CWWcrzxZ2m2sy4fCAt-FVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_005346_984156_5DBCEC47 
X-CRM114-Status: GOOD (  21.72  )
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



On 1/7/2026 2:02 PM, Manish Dharanenthiran wrote:
> Cancel the scheduled scan request only on the vdev that has an active
> scan running. Currently, ahvif->links_map is used to obtain the links,
> but this includes links for which no scan is scheduled. In failure cases
> where the scan fails due to an invalid channel definition, other links
> which are not yet brought up (vdev not created) may also be accessed,
> leading to the following trace:
> 
> Unable to handle kernel paging request at virtual address 0000000000004c8c
> pc : _raw_spin_lock_bh+0x1c/0x54
> lr : ath12k_scan_abort+0x20/0xc8 [ath12k]
> 
> Call trace:
>  _raw_spin_lock_bh+0x1c/0x54 (P)
>  ath12k_mac_op_cancel_hw_scan+0xac/0xc4 [ath12k]
>  ieee80211_scan_cancel+0xcc/0x12c [mac80211]
>  ieee80211_do_stop+0x6c4/0x7a8 [mac80211]
>  ieee80211_stop+0x60/0xd8 [mac80211]
> 
> Skip links that are not created or are not the current scan vdev. This
> ensures only the scan for the matching links is aborted and avoids
> aborting unrelated links during cancellation, thus aligning with how
> start/cleanup manage ar->scan.arvif.
> 
> Also, remove the redundant arvif->is_started check from
> ath12k_mac_op_cancel_hw_scan() that was introduced in commit 3863f014ad23
> ("wifi: ath12k: symmetrize scan vdev creation and deletion during HW
> scan") to avoid deleting the scan interface if the scan is triggered on
> the existing AP vdev as this use case is already handled in
> ath12k_scan_vdev_clean_work().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: feed05f1526e ("wifi: ath12k: Split scan request for split band device")
> Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 2f4daee9e2f0..950ca7536612 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5606,7 +5606,8 @@ void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
>  
>  	for_each_set_bit(link_id, &links_map, ATH12K_NUM_MAX_LINKS) {
>  		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> -		if (!arvif || arvif->is_started)
> +		if (!arvif || !arvif->is_created ||
> +		    arvif->ar->scan.arvif != arvif)
>  			continue;
>  
>  		ar = arvif->ar;
> 
> ---
> base-commit: 631ee338f04db713ba611883f28e94157ebb68e5
> change-id: 20260106-scan_vdev-94d8cf5a667e
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


