Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431CDD35673
	for <ath12k@archiver.kernel.org>; Wed, 28 Jan 2026 04:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsI8x1+1AxWlVFIaQi6U91irGWAOKoUGy+gyTSyLEs8=; b=pVmtqbJ5jyUzP2+F49g/6hp3rx
	3eicMEt9P8np3X0JtK9D+uVQD63rkB01hz0wBJwhrLWxefs+nKro76MSX88PSZGyZv1E9jp3AVJY9
	3GA39yVF7wBCMJvVxKFlLf8jYFrFGDe4kUwRMjJzh04IBBrngGThwhnp/XKRkYkdyeBwyb+xtlQU/
	Qp8Swv9UVbAUUOxcXJpRmkFxcvZwePDJE07P+zXtloA7VUXPNq7XKvFZBpQ2xvsvx6/XpxK4lPSAz
	efOBjz36mJz5LgFg3MfyhV+mQQZB773MfnM93HQl8zPSE3a+C9vugrxJqp2O2vFreiqvd5+dc0QzV
	Js0vUBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxM3-0000000FQsA-3qQu;
	Wed, 28 Jan 2026 04:40:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxM1-0000000FQrX-3Ucf
	for ath12k@lists.infradead.org;
	Wed, 28 Jan 2026 04:40:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RKS6K74004211
	for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 04:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsI8x1+1AxWlVFIaQi6U91irGWAOKoUGy+gyTSyLEs8=; b=BbbMTq+Ap0srpbMe
	Ep4LFBEIXe//FMwoZ31CpOPwE0ccDfjG4SFzY7/YqdxMaBm116ZXcv/KvCoXcg3l
	3Hmzf+6tCpILut6lbimB8zg1l8ZiXad1hWnVFI3mqrMXn5UOGy6NslUzQk0Grr62
	3X2JQFp/MWyY0UKeQcEE7qt4xNZEE3C3plBlhtWjBPzx2OFVq5awhmvHmUI0IoXF
	z3AekujNMQjaEW2mZh085SK6pIHJr3WrpDGv2DRoEjG2U2/wFsr87Qvr7AN4RYKS
	a/3d+EontMdiQaLil7+dKHRjp+IsgblPX0gcunHiKlxsLA8Oo3Kp+/RY6lIKlGAQ
	oMSdcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4dys9ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 04:40:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so11910068a91.1
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 20:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769575233; x=1770180033; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsI8x1+1AxWlVFIaQi6U91irGWAOKoUGy+gyTSyLEs8=;
        b=B7dmdB/EAURyL3Wjo9tEMI1cXJ3nbnVZF3gQRZbmnj/WzEHgqJ0Plsa/Ox1ZAIupM5
         eG6I5CxP0S4TFNt5DWzd6OGIKIz3i13usYi2pZD379u2DwRcxvhuQL0rf2Yr+xDjL9f4
         s5gTu+b4TCtqnUC+58SR9O72Fodqn36Hp7bWfE99aic1BYvOYC83SzfMzMc05cwDDCgC
         HNazg9gJSp55TFeOkOioNud2DLE/hi5+gPIu4mcslIj5UWg501bpLunuuhaEa98Ih1jO
         KDEqFn+TTjRM2QZ4XvnvK55wBPUp0A+IECB7tPgpJFhgmuR//+JpTyOR3TMeuGsY86M6
         Pk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769575233; x=1770180033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsI8x1+1AxWlVFIaQi6U91irGWAOKoUGy+gyTSyLEs8=;
        b=SSIdRqcjCFv94gA+4s3ON4cG8OLJDUGJ5MikkyullzquW07HP1kKrUDFuJc9ODFI3v
         I6Ailm+35iUhbWTNbv1fknV8bJSu8CWhdjq68sBdtjq2J4wqgJW1bfwZ5LWvB9Z5O7sh
         jJq6pFhZ4lBjPeNvCvrCub1Okck5C8OSSL/x9L77JVwsopWg1X44UJEM4g2Igwl0yP91
         5VFDimm7//tbtdi+3VOPAbziKQxkHLWM5eeKc1Lm4trQsEUS5kG+/uSc/e3ci0fnH7Zi
         GfQthn52aNI1ENSrcR73xOPm//TuvDrRQga2agKKe9RmsSaDUp0U46Zmj7CgetrKukSK
         V8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWuPDTjBRg6tVj4wKopC1VX5IWwTmzs5A9TD+/l8PhMeIl0LsFOhzt++CjK8GCYADNHqTqlAmE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWSYHabu4bgeWvntXkpPHEvzD7NqMvnSJOlF7BGg5tpVKCdwNW
	KVUOZbqJovSSe1g/paZNHNeXJWHP1qU0MGg4UJJp4PFEmWP62y4kD2Ap84Vy3Gd1LVfpsaRRNDc
	13dcvQ3gId6jdGv6mjDiXg/g4TZNohE7Gm8LiSJaHRkAlLOFAugg5vv+T+wN7P/H528x4t9p6
X-Gm-Gg: AZuq6aJOIN+AC3CrIMJZV+UwQ/vKw2ZW6a3P7hN113QMJW9wEmRzhaSUfj4p9TkU6zE
	LV4i5kk4khD88J98X4Ew7XN///dhznWxkbVjNflEg3qnGz3uJK4XQ2fEKGoQO7DhCxfH9cdFoV7
	DX6yLEuNfDOm8vduuw538Bsr8GrXD5Ioa4sDY4kbRGoZzVjsbqlYKLaXBU+bmrpe6iiETnIrl8W
	4VCCL8q1zJibg435NGlbGO+PaROPvnMn1D1iQKhWjPj+l7jjqxSI3OE8r0JoZ7Uz0CIQHIKQhLr
	CcgTte0SR6OlhMX4GCNEuMPQHpaQDzXWehmQrO7Dx9QpR81eNpGMLyUHbkU7sLP2tTLx9x6d+Me
	VUJi34MZJpE9VdN178QExfWU9g7JDkleS8my2tVcbWHu3wGfjQF8klGg=
X-Received: by 2002:a05:6a21:1f8a:b0:366:1934:5234 with SMTP id adf61e73a8af0-38ec62ddea1mr3827855637.2.1769575232691;
        Tue, 27 Jan 2026 20:40:32 -0800 (PST)
X-Received: by 2002:a05:6a21:1f8a:b0:366:1934:5234 with SMTP id adf61e73a8af0-38ec62ddea1mr3827831637.2.1769575232187;
        Tue, 27 Jan 2026 20:40:32 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a33607esm885132a12.23.2026.01.27.20.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 20:40:31 -0800 (PST)
Message-ID: <5254be31-6f3c-4a06-a73a-176e930a04a0@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 10:10:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: clear stale link mapping of
 ahvif->links_map
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260127033400.1721220-1-aaradhana.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260127033400.1721220-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqT3+FF9 c=1 sm=1 tr=0 ts=69799341 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=46pzs6SXUnSmaBsRGOsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: -LC6NN318jKFIxf6BFlsTC00Lr7dD399
X-Proofpoint-ORIG-GUID: -LC6NN318jKFIxf6BFlsTC00Lr7dD399
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAzNCBTYWx0ZWRfX7vvjHSiQGhje
 +YPxd4DdUQ/u9FL5vVu5o8BwVfD1si11anfgnel1vUhsFJd3xeTVg6Ifcs2JPnASP9xVPWE+OWq
 Y2mbnhcRavai9Rv89xkQmG+Ci1cq/9BBFI3OcBZIowTKRWWcaeaHzmenzP4xfQkA5ewhWIzmfTN
 UihZHFHdleARm8FQd+dxqH6PPYxoZtp/BayvEsgQpZbaJIvx6Vijor4nIxZrj7MIMG4Nm6znpzX
 Ko1ELizbbwq4kzDe6jdEVlCCvdULqGyx+jy/VX51njklKyzJS5E8l5By+OXydxqH4P03NEsW7dy
 pN778OkUAZdFrN1jQaNB0PArgYCGvHhFiOdJ+w1NCOMM3QlKokEjm1AUEzE/MYqSn89B83UbzNu
 ffDgMB/Paoas1y3hD3a9GRqnagHEuPidoC8ICACmH8uVT/Cw5QOnOm2wwAECiaaAylBVjdUvV4i
 bbckTwZPlpda4WuivNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_204033_897079_B998EFB7 
X-CRM114-Status: GOOD (  13.22  )
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



On 1/27/2026 9:04 AM, Aaradhana Sahu wrote:
> When an arvif is initialized in non-AP STA mode but MLO connection
> preparation fails before the arvif is created
> (arvif->is_created remains false), the error path attempts to delete all
> links. However, link deletion only executes when arvif->is_created is true.
> As a result, ahvif retains a stale entry of arvif that is initialized but
> not created.
> 
> When a new arvif is initialized with the same link id, this stale mapping
> triggers the following WARN_ON.
> 
> WARNING: drivers/net/wireless/ath/ath12k/mac.c:4271 at ath12k_mac_op_change_vif_links+0x140/0x180 [ath12k], CPU#3: wpa_supplicant/275
> 
> Call trace:
>   ath12k_mac_op_change_vif_links+0x140/0x180 [ath12k] (P)
>   drv_change_vif_links+0xbc/0x1a4 [mac80211]
>   ieee80211_vif_update_links+0x54c/0x6a0 [mac80211]
>   ieee80211_vif_set_links+0x40/0x70 [mac80211]
>   ieee80211_prep_connection+0x84/0x450 [mac80211]
>   ieee80211_mgd_auth+0x200/0x480 [mac80211]
>   ieee80211_auth+0x14/0x20 [mac80211]
>   cfg80211_mlme_auth+0x90/0xf0 [cfg80211]
>   nl80211_authenticate+0x32c/0x380 [cfg80211]
>   genl_family_rcv_msg_doit+0xc8/0x134
> 
> Fix this issue by unassigning the link vif and clearing ahvif->links_map
> if arvif is only initialized but not created.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 81e4be30544e ("wifi: ath12k: handle link removal in change_vif_links()")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

